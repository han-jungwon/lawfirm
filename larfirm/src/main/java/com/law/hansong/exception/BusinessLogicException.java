package com.law.hansong.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
public class BusinessLogicException extends RuntimeException{
    private static final long serialVersionUID = 1L;

    private final String message;
    private final boolean historyBack;

    public BusinessLogicException(String message, boolean historyBack) {
        this.message = message;
        this.historyBack = historyBack;
    }

    public BusinessLogicException() {
        this.message = "서버에 문제가 발생했습니다. 관리자에게 문의바랍니다.";
        this.historyBack = false;
    }

    public String getMessage() {
        return message;
    }

    public boolean getHistoryBack() {
        return historyBack;
    }
}