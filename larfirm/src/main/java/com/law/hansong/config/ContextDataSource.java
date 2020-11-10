package com.law.hansong.config;

import javax.sql.DataSource;

import com.law.hansong.exception.BusinessLogicException;
import com.law.hansong.exception.ObjectNotFoundException;
import org.apache.commons.dbcp.BasicDataSource;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.aop.Advisor;
import org.springframework.aop.aspectj.AspectJExpressionPointcut;
import org.springframework.aop.support.DefaultPointcutAdvisor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.interceptor.*;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Properties;

// 데이터베이스 설정
@Aspect
@Configuration
// 어노테이션 기반 트랜잭션 관리를 사용합니다.
// <tx:annotation-driven>
@EnableTransactionManagement
public class ContextDataSource {

    @Autowired
    private DataSourceTransactionManager transactionManager;

    private static final String EXPRESSION = "execution(* com.law.hansong.service.*Impl.*(..))";
    //private static final String multi_EXPRESSION = "(execution(* *..*.service..*.*(..)) || execution(* *..*.services..*.*(..)))";
    private static final int TX_METHOD_TIMEOUT = 5;

    /**
     * 데이터 소스 등록
     * @return
     */
    @Bean
    public DataSource dataSource() {
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
        dataSource.setUrl("jdbc:oracle:thin:@localhost:1521:XE");

        dataSource.setUsername("songhan");
        dataSource.setPassword("songhan");
        dataSource.setDefaultAutoCommit(false);

        return dataSource;

    }

    /**
     * 트랜잭션 매니저 등록
     *
     * @return
     */
    @Bean
    public DataSourceTransactionManager transactionManager() {
        return new DataSourceTransactionManager(dataSource());
    }

    @Bean
    public TransactionInterceptor transactionInterceptor() {
        TransactionInterceptor txAdvice = new TransactionInterceptor();
        Properties txAttributes = new Properties();

        // rollback 적용 exception 추가
        List<RollbackRuleAttribute> rollbackRules = new ArrayList<RollbackRuleAttribute>();
        rollbackRules.add(new RollbackRuleAttribute(Exception.class));
        rollbackRules.add(new RollbackRuleAttribute(ObjectNotFoundException.class));
        rollbackRules.add(new RollbackRuleAttribute(BusinessLogicException.class));

        //readonly 세팅
        DefaultTransactionAttribute readOnlyAttribute = new DefaultTransactionAttribute(TransactionDefinition.PROPAGATION_REQUIRED);
        readOnlyAttribute.setReadOnly(true);
        readOnlyAttribute.setTimeout(TX_METHOD_TIMEOUT);

        //CUD 세팅
        RuleBasedTransactionAttribute transactionAttribute
                = new RuleBasedTransactionAttribute(TransactionDefinition.PROPAGATION_REQUIRED, rollbackRules);
        //transactionAttribute.setName("*");
        transactionAttribute.setTimeout(TX_METHOD_TIMEOUT);
        transactionAttribute.setIsolationLevel(TransactionDefinition.ISOLATION_SERIALIZABLE);

        String readOnlyTransactionAttributesDefinition = readOnlyAttribute.toString();
        String transactionAttributesDefinition = transactionAttribute.toString();

        // readonly 네임
        txAttributes.setProperty("select*", readOnlyTransactionAttributesDefinition);
        txAttributes.setProperty("get*", readOnlyTransactionAttributesDefinition);
        txAttributes.setProperty("search*", readOnlyTransactionAttributesDefinition);
        txAttributes.setProperty("find*", readOnlyTransactionAttributesDefinition);

        // CUD 네임
        txAttributes.setProperty("update*", transactionAttributesDefinition);
        txAttributes.setProperty("create*", transactionAttributesDefinition);
        txAttributes.setProperty("add*", transactionAttributesDefinition);
        txAttributes.setProperty("delete*", transactionAttributesDefinition);
        txAttributes.setProperty("*", transactionAttributesDefinition);

        txAdvice.setTransactionAttributes(txAttributes);
        txAdvice.setTransactionManager(transactionManager);

        return txAdvice;
    }

    @Bean
    public Advisor transactionAdvisor() {
        AspectJExpressionPointcut pointcut = new AspectJExpressionPointcut();
        pointcut.setExpression(EXPRESSION);

        return new DefaultPointcutAdvisor(pointcut, transactionInterceptor());
    }


}
