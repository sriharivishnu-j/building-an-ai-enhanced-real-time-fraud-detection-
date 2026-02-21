package com.example.fraud;

public class FraudResponse {
    private final String message;

    public FraudResponse(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }
}