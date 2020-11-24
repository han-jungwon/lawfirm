package com.law.hansong.exception;

import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import java.sql.SQLException;
import java.util.Date;

/*
    비즈니스 로직에서 Exception으로 예외를 발생시키면
    아래 클래스의 @ExceptionHandler가 붙은 메서드에서 캐치하여 이후 로직을 공통적으로 처리.
    return 타입이 ResponseEntity<?>인데 여기서 파라미터로 HttpStatus를 넘겨주기.
*/

@RestControllerAdvice("com.law.hansong.restcontroller")
public class RestCustomizeExceptionHandler extends ResponseEntityExceptionHandler {
    // 400
    @ExceptionHandler(BadRequestException.class)
    public ResponseEntity<Object> handler(BadRequestException e, WebRequest request) {
        RestExceptionResponse es = new RestExceptionResponse(new Date(), e.getMessage(), request.getDescription(false));

        return new ResponseEntity(es, HttpStatus.BAD_REQUEST);
    }
    // 404
    @ExceptionHandler(ObjectNotFoundException.class)
    public ResponseEntity<Object> handler(ObjectNotFoundException e, WebRequest request) {
        RestExceptionResponse es = new RestExceptionResponse(new Date(), e.getMessage(), request.getDescription(false));

        return new ResponseEntity(es, HttpStatus.NOT_FOUND);
    }
    // 500
    @ExceptionHandler(BusinessLogicException.class)
    public ResponseEntity<Object> handler(BusinessLogicException e, WebRequest request) {
        RestExceptionResponse es = new RestExceptionResponse(new Date(), e.getMessage(), request.getDescription(false));

        return new ResponseEntity(es, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    // DB
    @ExceptionHandler({SQLException.class, DataAccessException.class})
    public ResponseEntity<Object> sqlHandler(Exception e, WebRequest request) {
        RestExceptionResponse es = new RestExceptionResponse(new Date(), e.getMessage(), request.getDescription(false));

        return new ResponseEntity(es, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    // default
    @ExceptionHandler(Exception.class)
    public ResponseEntity<Object> handler(Exception e, WebRequest request) {
        RestExceptionResponse es = new RestExceptionResponse(new Date(), e.getMessage(), request.getDescription(false));

        return new ResponseEntity(es, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @Override
    protected ResponseEntity<Object> handleMethodArgumentNotValid(MethodArgumentNotValidException ex,
                                                                  HttpHeaders headers, HttpStatus status,
                                                                  WebRequest request){
        RestExceptionResponse es = new RestExceptionResponse(new Date()
                    , "Validation Failed", ex.getBindingResult().toString());

        return new ResponseEntity(es, HttpStatus.BAD_REQUEST);
    }

}