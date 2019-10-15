 <p align="center">
  <img src="https://img.shields.io/badge/Avue-2.0.6-green.svg" alt="Build Status">
   <img src="https://img.shields.io/badge/Spring%20Cloud-Greenwich.SR2-blue.svg" alt="Coverage Status">
   <img src="https://img.shields.io/badge/Spring%20Cloud%20Alibaba-2.1.0.RELEASE-blue.svg" alt="Coverage Status">
   <img src="https://img.shields.io/badge/Spring%20Boot-2.1.8.RELEASE-blue.svg" alt="Downloads">
 </p>  
 
**albedo-cloud-alibaba Microservice Architecture**
- 全网最新spring-cloud-alibaba微服务架构
- 前端<a href="https://github.com/somowhere/albedo-ui" target="_blank">albedo-ui </a>
- 基于<a href="https://gitee.com/log4j/pig" target="_blank">pix</a>开源版本（保持更新）二次开发(同时借鉴<a href="https://www.jhipster.tech/" target="_blank">jhipster</a>)
- 基于 Spring Cloud Greenwich.SR2 、Spring Security OAuth2 的RBAC权限管理系统  
- 基于数据驱动视图的理念封装 Element-ui，即使没有 vue 的使用经验也能快速上手  
- 提供对常见容器化支持 Docker、Kubernetes、Rancher2 支持  
- 提供 lambda 、stream api 、webflux 的生产实践   

    

![](https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo-cloud/Snipaste_2019-10-10_10-20-37.png)   
![](https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo-cloud/Snipaste_2019-10-10_10-21-13.png)   
![](https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo-cloud/Snipaste_2019-10-10_10-22-00.png)   
![](https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo-cloud/Snipaste_2019-10-10_10-22-14.png)   
![](https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo-cloud/Snipaste_2019-10-10_10-22-36.png)   
![](https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo-cloud/Snipaste_2019-10-10_10-22-57.png)   
![](https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo-cloud/Snipaste_2019-10-10_10-23-22.png)   
![](https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo-cloud/Snipaste_2019-10-10_10-23-35.png)   
![](https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo-cloud/Snipaste_2019-10-10_10-24-07.png)   
![](https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo-cloud/Snipaste_2019-10-10_10-24-21.png)   
![](https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo-cloud/Snipaste_2019-10-10_10-24-41.png)   
![](https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo-cloud/Snipaste_2019-10-10_10-24-54.png)   

#### 核心依赖 


依赖 | 版本
---|---
Spring Boot |  2.1.8.RELEASE  
Spring Cloud | Greenwich.SR2   
Spring Cloud Alibaba | 2.1.0.RELEASE
Spring Security OAuth2 | 2.3.5
Mybatis Plus | 3.2.0
hutool | 4.5.16
Avue | 2.0.6
   


#### 模块说明
```lua
albedo
├── albedo-ui -- 前端工程[8080]
├── albedo-auth -- 授权服务提供[3000]
└── albedo-common -- 系统公共模块 
     ├── albedo-common-api --  服务基础api
     ├── albedo-common-core -- 公共工具类核心包
     ├── albedo-common-log -- 日志服务
     ├── albedo-common-module -- 模块基础包
     └── albedo-common-security -- 安全工具类
├── albedo-gateway -- Spring Cloud Gateway网关[9999]
└── albedo-module -- 功能模块
     ├── albedo-gen -- 图形化代码生成[5003]
     ├── albedo-monitor -- Spring Boot Admin监控 [5001]
     ├── albedo-quartz -- 任务调度 [5004]
     ├── albedo-sentinel -- 流量监控模块 [8858]
     ├── albedo-sys -- 通用用户权限管理系统业务处理模块[4000]
     └── albedo-zipkin -- 链路调用监控 [5002]
└── albedo-plugin  -- 插件模块 
     ├── albedo-data-mybatis -- mybatis 基础模块
     └── albedo-swagger-api -- swagger api
	 
```

#### 快速开始

1. 启动前安装服务mysql/redis/[nacos](https://github.com/alibaba/nacos)注册中心
2. 导入db/albedo-cloud
3. 浏览器访问本地[nacos](http://localhost:8848)导入nacos-config/nacos_config_export_2019-10-10 10_56_24.zip配置
4. 启动AlbedoAuthApplication、AlbedoSysApplication、AlbedoGenApplication、AlbedoQuartzApplication、AlbedoMonitorApplication、AlbedoSentinelApplication、AlbedoZipkinApplication、AlbedoGatewayApplication
5. 启动前端[albedi-ui](https://github.com/somowhere/albedo-ui) 访问[localhost](http://localhost:4000)

#### 提交反馈

1. 欢迎提交 issue，请写清楚遇到问题的原因，开发环境，复显步骤。

2. 不接受`功能请求`的 issue，功能请求可能会被直接关闭。  

3. <a href="mailto:somewhere0813@gmail.com">somewhere0813@gmail.com</a>    

4. QQ群: 685728393 

#### 开源协议


![](https://images.gitee.com/uploads/images/2019/0330/065147_e07bc645_410595.png)


#### 关注我们

