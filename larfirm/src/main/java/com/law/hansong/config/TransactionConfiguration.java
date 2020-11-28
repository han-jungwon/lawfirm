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
        DataSourceTransactionManager tm = new DataSourceTransactionManager(dataSource);
        return tm;
    }
    @Bean(name = "transactionInterceptor")
    public TransactionInterceptor transactionInterceptor(PlatformTransactionManager platformTransactionManager) {
        TransactionInterceptor transactionInterceptor = new TransactionInterceptor();

        transactionInterceptor.setTransactionManager(platformTransactionManager);
        Properties transactionAttributes = new Properties();

        String cudOption = "PROPAGATION_REQUIRED,-Throwable";
        String rOption = "PROPAGATION_SUPPORTS,-Throwable,readOnly";

        // Insert
        transactionAttributes.setProperty("insert*",cudOption);
        transactionAttributes.setProperty("save*",cudOption);
        transactionAttributes.setProperty("add*",cudOption);
        // Update
        transactionAttributes.setProperty("update*",cudOption);
        transactionAttributes.setProperty("modify*",cudOption);
        transactionAttributes.setProperty("alter*",cudOption);
        transactionAttributes.setProperty("cancel*",cudOption);
        transactionAttributes.setProperty("refuse*",cudOption);
        transactionAttributes.setProperty("enable*",cudOption);
        transactionAttributes.setProperty("disable*",cudOption);
        // Delete
        transactionAttributes.setProperty("delete*",cudOption);

        // Read
        transactionAttributes.setProperty("find*",rOption);
        transactionAttributes.setProperty("query*",rOption);
        transactionAttributes.setProperty("search*",rOption);
        transactionAttributes.setProperty("get*",rOption);
        transactionAttributes.setProperty("select*",rOption);
        transactionAttributes.setProperty("*",rOption);

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
