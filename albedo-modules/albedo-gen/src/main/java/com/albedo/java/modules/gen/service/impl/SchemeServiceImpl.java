package com.albedo.java.modules.gen.service.impl;

import cn.hutool.core.util.CharUtil;
import com.albedo.java.common.core.util.CollUtil;
import com.albedo.java.common.core.util.FreeMarkers;
import com.albedo.java.common.core.util.StringUtil;
import com.albedo.java.common.core.vo.PageModel;
import com.albedo.java.common.core.vo.QueryCondition;
import com.albedo.java.common.data.util.QueryWrapperUtil;
import com.albedo.java.common.persistence.DynamicSpecifications;
import com.albedo.java.common.persistence.SpecificationDetail;
import com.albedo.java.common.persistence.service.impl.DataVoServiceImpl;
import com.albedo.java.modules.gen.domain.Scheme;
import com.albedo.java.modules.gen.domain.Table;
import com.albedo.java.modules.gen.domain.TableColumn;
import com.albedo.java.modules.gen.domain.vo.*;
import com.albedo.java.modules.gen.domain.xml.GenConfig;
import com.albedo.java.modules.gen.repository.SchemeRepository;
import com.albedo.java.modules.gen.service.TableColumnService;
import com.albedo.java.modules.gen.service.TableService;
import com.albedo.java.modules.gen.util.GenUtil;
import com.albedo.java.modules.sys.domain.Dict;
import com.albedo.java.modules.sys.domain.vo.GenSchemeDataVo;
import com.albedo.java.modules.sys.dubbo.RemoteMenuService;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Service class for managing schemes.
 *
 * @author somowhere
 */
@Service
public class SchemeServiceImpl extends DataVoServiceImpl<SchemeRepository, Scheme, String, SchemeDataVo> implements com.albedo.java.modules.gen.service.SchemeService {

	private final TableService tableService;
	private final TableColumnService tableColumnService;
	@Reference(check = false)
	private RemoteMenuService remoteMenuService;

	public SchemeServiceImpl(TableService tableService,
							 TableColumnService tableColumnService) {
		this.tableService = tableService;
		this.tableColumnService = tableColumnService;
	}

	@Override
	public List<Scheme> findAll(String id) {
		SpecificationDetail specificationDetail = DynamicSpecifications.bySearchQueryCondition(
			QueryCondition.ne(Table.F_ID, id == null ? "-1" : id));
		return findAll(specificationDetail);
//		return repository.findAllByStatusAndId(TableDataVo.FLAG_NORMAL, id == null ? "-1" : id);
	}


	@Override
	public String generateCode(SchemeDataVo schemeDataVo) {
		StringBuilder result = new StringBuilder();

		// 查询主表及字段列
		TableDataVo tableDataVo = tableService.findOneVo(schemeDataVo.getTableId());
		tableDataVo.setColumnList(tableColumnService.findAll(new QueryWrapper<TableColumn>().eq(TableColumn.F_SQL_GENTABLEID,
			tableDataVo.getId()))
			.stream().map(item -> tableColumnService.copyBeanToVo(item)).collect(Collectors.toList())
		);
		Collections.sort(tableDataVo.getColumnList());

		// 获取所有代码模板
		GenConfig config = GenUtil.getConfig();

		// 获取模板列表
		List<TemplateVo> templateList = GenUtil.getTemplateList(config, schemeDataVo.getCategory(), false);
		List<TemplateVo> childTableTemplateList = GenUtil.getTemplateList(config, schemeDataVo.getCategory(), true);

		// 如果有子表模板，则需要获取子表列表
		if (childTableTemplateList.size() > 0) {
			tableDataVo.setChildList(tableService.findAllByParentTable(tableDataVo.getId())
				.stream().map(item -> tableService.copyBeanToVo(item)).collect(Collectors.toList()));
		}

		// 生成子表模板代码
		if (tableDataVo.getChildList() == null) {
			tableDataVo.setChildList(Lists.newArrayList());
		}
		for (TableDataVo childTable : tableDataVo.getChildList()) {
			Collections.sort(childTable.getColumnList());
			childTable.setCategory(schemeDataVo.getCategory());
			schemeDataVo.setTableDataVo(childTable);
			Map<String, Object> childTableModel = GenUtil.getDataModel(schemeDataVo);
			for (TemplateVo tpl : childTableTemplateList) {
				result.append(GenUtil.generateToFile(tpl, childTableModel, schemeDataVo.getReplaceFile()));
			}
		}
		tableDataVo.setCategory(schemeDataVo.getCategory());
		// 生成主表模板代码
		schemeDataVo.setTableDataVo(tableDataVo);
		Map<String, Object> model = GenUtil.getDataModel(schemeDataVo);
		for (TemplateVo tpl : templateList) {
			result.append(GenUtil.generateToFile(tpl, model, schemeDataVo.getReplaceFile()));
		}
		return result.toString();
	}

	@Override
	public Map<String, Object> findFormData(SchemeDataVo schemeDataVo, String loginId) {
		Map<String, Object> map = Maps.newHashMap();

		if (StringUtil.isNotEmpty(schemeDataVo.getId())) {
			schemeDataVo = super.findOneVo(schemeDataVo.getId());
		}
		if (StringUtil.isBlank(schemeDataVo.getPackageName())) {
			schemeDataVo.setPackageName("com.albedo.java.modules");
		}
		if (StringUtil.isBlank(schemeDataVo.getFunctionAuthor())) {
			schemeDataVo.setFunctionAuthor(loginId);
		}
		map.put("schemeVo", schemeDataVo);
		GenConfig config = GenUtil.getConfig();
		map.put("config", config);

		map.put("categoryList", CollUtil.convertComboDataList(config.getCategoryList(), Dict.F_VAL, Dict.F_NAME));
		map.put("viewTypeList", CollUtil.convertComboDataList(config.getViewTypeList(), Dict.F_VAL, Dict.F_NAME));

		List<Table> tableList = tableService.findAll(), list = Lists.newArrayList();
		List<String> tableIds = Lists.newArrayList();
		if (StringUtil.isNotEmpty(schemeDataVo.getId())) {
			List<Scheme> schemeList = findAll(schemeDataVo.getId());
			tableIds = CollUtil.extractToList(schemeList, "tableId");
		}
		for (Table table : tableList) {
			if (!tableIds.contains(table.getId())) {
				list.add(table);
			}
		}
		map.put("tableList", CollUtil.convertComboDataList(list, Table.F_ID, Table.F_NAMESANDTITLE));
		return map;
	}

	@Override
	public IPage getSchemeVoPage(PageModel pm) {
		Wrapper wrapper = QueryWrapperUtil.getWrapperByPage(pm, getPersistentClass());
		pm.addOrder(OrderItem.desc("a." + Scheme.F_SQL_CREATEDDATE));
		IPage<List<SchemeVo>> userVosPage = baseMapper.getSchemeVoPage(pm, wrapper);
		return userVosPage;
	}

	@Override
	public Map<String, Object> previewCode(String id, String username) {
		Map<String, Object> result = Maps.newHashMap();
		SchemeDataVo schemeDataVo = super.findOneVo(id);
		// 查询主表及字段列
		TableDataVo tableDataVo = tableService.findOneVo(schemeDataVo.getTableId());
		tableDataVo.setColumnList(tableColumnService.findAll(new QueryWrapper<TableColumn>().eq(TableColumn.F_SQL_GENTABLEID,
			tableDataVo.getId()))
			.stream().map(item -> tableColumnService.copyBeanToVo(item)).collect(Collectors.toList())
		);
		Collections.sort(tableDataVo.getColumnList());

		// 获取所有代码模板
		GenConfig config = GenUtil.getConfig();

		// 获取模板列表
		List<TemplateVo> templateList = GenUtil.getTemplateList(config, schemeDataVo.getCategory(), false);
		List<TemplateVo> childTableTemplateList = GenUtil.getTemplateList(config, schemeDataVo.getCategory(), true);

		// 如果有子表模板，则需要获取子表列表
		if (childTableTemplateList.size() > 0) {
			tableDataVo.setChildList(tableService.findAllByParentTable(tableDataVo.getId())
				.stream().map(item -> tableService.copyBeanToVo(item)).collect(Collectors.toList()));
		}

		// 生成子表模板代码
		if (tableDataVo.getChildList() == null) {
			tableDataVo.setChildList(Lists.newArrayList());
		}
		for (TableDataVo childTable : tableDataVo.getChildList()) {
			Collections.sort(childTable.getColumnList());
			childTable.setCategory(schemeDataVo.getCategory());
			schemeDataVo.setTableDataVo(childTable);
			Map<String, Object> childTableModel = GenUtil.getDataModel(schemeDataVo);
			for (TemplateVo tpl : childTableTemplateList) {
				String content = FreeMarkers.renderString(StringUtil.trimToEmpty(tpl.getContent()), childTableModel);
				result.put(FreeMarkers.renderString(tpl.getFileName(), childTableModel), content);
			}
		}
		tableDataVo.setCategory(schemeDataVo.getCategory());
		// 生成主表模板代码
		schemeDataVo.setTableDataVo(tableDataVo);
		Map<String, Object> model = GenUtil.getDataModel(schemeDataVo);
		for (TemplateVo tpl : templateList) {
			String content = FreeMarkers.renderString(StringUtil.trimToEmpty(tpl.getContent()), model);
			result.put(FreeMarkers.renderString(tpl.getFileName(), model), content);
		}
		return result;
	}

	@Override
	public SchemeDataVo genMenu(SchemeGenDataVo schemeGenDataVo) {
		SchemeDataVo schemeDataVo = super.findOneVo(schemeGenDataVo.getId());
		TableDataVo tableDataVo = schemeDataVo.getTableDataVo();
		if (tableDataVo == null) {
			tableDataVo = tableService.findOneVo(schemeDataVo.getTableId());
		}
		String url = StringUtil.toAppendStr("/", StringUtil.lowerCase(schemeDataVo.getModuleName()), (StringUtil.isNotBlank(schemeDataVo.getSubModuleName()) ? "/" + StringUtil.lowerCase(schemeDataVo.getSubModuleName()) : ""), "/",
			StringUtil.toRevertCamelCase(StringUtil.lowerFirst(tableDataVo.getClassName()), CharUtil.DASHED), "/");
		remoteMenuService.saveByGenScheme(new GenSchemeDataVo(schemeDataVo.getName(),
			schemeGenDataVo.getParentMenuId(), url, tableDataVo.getClassName()));
		return  schemeDataVo;
	}


}
