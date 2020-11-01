package com.law.hansong.exception;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/*
    비즈니스 로직에서 Exception으로 예외를 발생시키면
    아래 클래스의 @ExceptionHandler가 붙은 메서드에서 캐치하여 이후 로직을 공통적으로 처리.
    return 타입이 ResponseEntity<?>인데 여기서 파라미터로 HttpStatus를 넘겨주기.
*/

@Controller
@ControllerAdvice
public class CustomizeExceptionHandler {
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

}