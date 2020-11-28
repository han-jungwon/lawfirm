package com.law.hansong.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.framework.autoproxy.BeanNameAutoProxyCreator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.ProxyTransactionManagementConfiguration;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;
import org.springframework.transaction.interceptor.TransactionInterceptor;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@EnableTransactionManagement
public class TransactionConfiguration implements TransactionManagementConfigurer {
    private Logger log = LoggerFactory.getLogger(getClass());

    @Resource(name="txManager")
    private PlatformTransactionManager txManager;

    @Bean(value = "txManager")
    public PlatformTransactionManager txManager(DataSource dataSource) {
        log.info("txManager init...");
        DataSourceTransactionManager tm = new DataSourceTransactionManager(dataSource);
        return tm;
    }
    @Bean(name = "transactionInterceptor")
    public TransactionInterceptor transactionInterceptor(PlatformTransactionManager platformTransactionManager) {
        TransactionInterceptor transactionInterceptor = new TransactionInterceptor();
        // 事物管理器
        transactionInterceptor.setTransactionManager(platformTransactionManager);
        Properties transactionAttributes = new Properties();

        // 新增
        transactionAttributes.setProperty("insert*","PROPAGATION_REQUIRED,-Throwable");
        transactionAttributes.setProperty("save*","PROPAGATION_REQUIRED,-Throwable");
        // 修改
        transactionAttributes.setProperty("update*","PROPAGATION_REQUIRED,-Throwable");
        transactionAttributes.setProperty("modify*","PROPAGATION_REQUIRED,-Throwable");
        transactionAttributes.setProperty("alter*","PROPAGATION_REQUIRED,-Throwable");
        transactionAttributes.setProperty("cancel*","PROPAGATION_REQUIRED,-Throwable");
        transactionAttributes.setProperty("refuse*","PROPAGATION_REQUIRED,-Throwable");
        transactionAttributes.setProperty("enable*","PROPAGATION_REQUIRED,-Throwable");
        transactionAttributes.setProperty("disable*","PROPAGATION_REQUIRED,-Throwable");

        // 删除
        transactionAttributes.setProperty("delete*","PROPAGATION_REQUIRED,-Throwable");

        //查询
        transactionAttributes.setProperty("find*","PROPAGATION_SUPPORTS,-Throwable,readOnly");
        transactionAttributes.setProperty("query*","PROPAGATION_SUPPORTS,-Throwable,readOnly");
        transactionAttributes.setProperty("search*","PROPAGATION_SUPPORTS,-Throwable,readOnly");
        transactionAttributes.setProperty("*","PROPAGATION_SUPPORTS,-Throwable,readOnly");

        transactionInterceptor.setTransactionAttributes(transactionAttributes);
        return transactionInterceptor;
    }

    @Bean
    public BeanNameAutoProxyCreator transactionAutoProxy() {
        BeanNameAutoProxyCreator transactionAutoProxy = new BeanNameAutoProxyCreator();
        transactionAutoProxy.setProxyTargetClass(true);

        transactionAutoProxy.setBeanNames("*Service", "*ServiceImpl");
        transactionAutoProxy.setInterceptorNames("transactionInterceptor");
        return transactionAutoProxy;
    }

    @Override
    public PlatformTransactionManager annotationDrivenTransactionManager() {
        return txManager;
    }
}
