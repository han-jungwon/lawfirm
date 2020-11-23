package com.law.hansong.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.BAD_REQUEST)
public class BadRequestException extends RuntimeException{
    private static final long serialVersionUID = 1L;

    private final String message;
    private final boolean historyBack;

    public BadRequestException(String message, boolean historyBack) {
        this.message = message;
        this.historyBack = historyBack;
    }

    public BadRequestException() {
        this.message = "잘못된 요청입니다.";
        this.historyBack = false;
    }

    public String getMessage() {
        return message;
    }

    public boolean getHistoryBack() {
        return historyBack;
    }
}