package com.law.hansong.exception;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.HashMap;
import java.util.Map;

/*
    비즈니스 로직에서 RestException으로 예외를 발생시키면
    아래 클래스의 @ExceptionHandler가 붙은 메서드에서 캐치하여 이후 로직을 공통적으로 처리.
    return 타입이 ResponseEntity<?>인데 여기서 파라미터로 HttpStatus를 넘겨주기.
*/

@RestControllerAdvice
public class ControllerAdvice {
    //
    @ExceptionHandler(RestException.class)
    public ResponseEntity<Map<String,Object>> handler(RestException e) {
        Map<String, Object> resBody = new HashMap<>();
        resBody.put("message", e.getMessage());

        return new ResponseEntity<>(resBody, e.getStatus());
    }
}