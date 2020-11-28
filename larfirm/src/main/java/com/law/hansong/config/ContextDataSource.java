package com.law.hansong.config;

import javax.sql.DataSource;

import com.law.hansong.exception.BusinessLogicException;
import com.law.hansong.exception.ObjectNotFoundException;
import org.apache.commons.dbcp.BasicDataSource;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.Advisor;
import org.springframework.aop.aspectj.AspectJExpressionPointcut;
import org.springframework.aop.support.DefaultPointcutAdvisor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.interceptor.*;

import java.util.*;

// 데이터베이스 설정
//@Aspect
@Configuration
// 어노테이션 기반 트랜잭션 관리를 사용합니다.
// <tx:annotation-driven>
//@EnableTransactionManagement
public class ContextDataSource {
    private Logger log = LoggerFactory.getLogger(getClass());

    private static final String EXPRESSION = "execution(* com.law.hansong..*Impl.*(..))";
    private static final int TX_METHOD_TIMEOUT = 5;

    /**
     * 데이터 소스 등록
     * @return
     */
    @Bean(destroyMethod ="close")
    public DataSource dataSource() {
        log.info("db init...");
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
        dataSource.setUrl("jdbc:oracle:thin:@localhost:1521:XE");

        dataSource.setUsername("songhan");
        dataSource.setPassword("songhan");
        dataSource.setDefaultAutoCommit(false);

        return dataSource;

    }
}
