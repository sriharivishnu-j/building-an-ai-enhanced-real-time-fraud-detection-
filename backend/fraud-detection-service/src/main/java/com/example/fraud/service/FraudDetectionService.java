package com.example.fraud.service;

import org.springframework.stereotype.Service;
import reactor.core.publisher.Mono;

@Service
public class FraudDetectionService {
    public Mono<Boolean> detectFraud(String transaction) {
        // Placeholder for fraud detection logic
        return Mono.just(false);
    }
}
