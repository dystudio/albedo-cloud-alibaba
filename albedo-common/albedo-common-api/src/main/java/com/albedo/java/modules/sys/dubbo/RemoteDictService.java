package com.albedo.java.modules.sys.dubbo;

import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.core.util.R;
import com.alibaba.cloud.dubbo.annotation.DubboTransported;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;

public interface RemoteDictService {

	String getDictAll();

}
