package com.law.hansong.exception;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/*
    비즈니스 로직에서 Exception으로 예외를 발생시키면
    아래 클래스의 @ExceptionHandler가 붙은 메서드에서 캐치하여 이후 로직을 공통적으로 처리.
    return 타입이 ResponseEntity<?>인데 여기서 파라미터로 HttpStatus를 넘겨주기.
*/

@ControllerAdvice("com.law.hansong.controller")
public class CustomizeExceptionHandler {
    // 400
    @ExceptionHandler(BadRequestException.class)
    public ModelAndView handler(BadRequestException e) {
        ExceptionResponse es = new ExceptionResponse(new Date(), e.getMessage(), "400", e.getHistoryBack() );
        ModelAndView mav = new ModelAndView();
        mav.setViewName("error/default");
        mav.addObject("es",es);

        return mav;
    }
    // 404
    @ExceptionHandler(ObjectNotFoundException.class)
    public ModelAndView handler(ObjectNotFoundException e) {
        ExceptionResponse es = new ExceptionResponse(new Date(), e.getMessage(), "404", e.getHistoryBack() );
        ModelAndView mav = new ModelAndView();
        mav.setViewName("error/default");
        mav.addObject("es",es);

        return mav;
    }
    // 500
    @ExceptionHandler(BusinessLogicException.class)
    public ModelAndView handler(BusinessLogicException e) {
        ExceptionResponse es = new ExceptionResponse(new Date(), e.getMessage(), "500", e.getHistoryBack());
        ModelAndView mav = new ModelAndView();
        mav.setViewName("error/default");
        mav.addObject("es",es);

        return mav;
    }

    // DB
    @ExceptionHandler({SQLException.class, DataAccessException.class})
    public ModelAndView handler() {
        ExceptionResponse es = new ExceptionResponse(new Date(), "데이터에 문제가 발생했습니다. 관리자에게 문의바랍니다.","500", false);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("error/default");
        mav.addObject("es",es);

        return mav;
    }

    // 권한
    @ExceptionHandler(AuthenticationException.class)
    public ModelAndView handler(AuthenticationException e) {
        ExceptionResponse es = new ExceptionResponse(new Date(), e.getMessage(),"401", true);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("error/default");
        mav.addObject("es",es);

        return mav;
    }


    // default
    @ExceptionHandler(Exception.class)
    public ModelAndView handler(Exception e) {
        ExceptionResponse es = new ExceptionResponse(new Date(), "문제가 발생했습니다. 관리자에게 문의바랍니다.","Error", false);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("error/default");
        mav.addObject("es",es);

        return mav;
    }
}