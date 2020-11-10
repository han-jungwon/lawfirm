package com.law.hansong;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.law.hansong.config.ApplicationConfig;
import com.law.hansong.config.securityConfig;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {ApplicationConfig.class, securityConfig.class})
public class PasswordEncoderTest {
    @Autowired
    PasswordEncoder passwordEncoder;
    // 인코딩된 값이 나옴
    @Test
    public void passwordEncode() throws Exception{
        System.out.println(passwordEncoder.encode("114457678862025743945"));
    }
    // 인코딩된 값은 매번 다름
    @Test
    public void passwordTest() throws Exception{
       String encodePasswd = "$2a$10$wucWMKYowwohr1Oqym6NheSRHBjwBQoGBYLM9MbjSRgPRmlVn2kSu";
                             //"$2a$10$qPoHy.sNCvMXFQQ5W0XSye8U4PFeNsYJ.ZjfxBsdzjbYLxcLLy5.K"

       String password = "1517556866";
       boolean test = passwordEncoder.matches(password, encodePasswd);
       System.out.println(test);
    }

}