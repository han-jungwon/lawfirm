package com.law.hansong.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.BAD_REQUEST)
public class ObjectNotFoundException extends RuntimeException{
    private static final long serialVersionUID = 1L;

    private final String message;
    private final boolean historyBack;

    public ObjectNotFoundException(String message, boolean historyBack) {
        this.message = String.format("요청하신 %s 정보를 찾을 수 없습니다.", message);
        this.historyBack = historyBack;
    }

    public ObjectNotFoundException(String message) {
        this.message = String.format("요청하신 %s 정보를 찾을 수 없습니다.", message);
        this.historyBack = false;
    }


    public ObjectNotFoundException() {
        this.message = "요청하신 정보를 찾을 수 없습니다.";
        this.historyBack = false;
    }

    public String getMessage() {
        return message;
    }

    public boolean getHistoryBack() {
        return historyBack;
    }
}