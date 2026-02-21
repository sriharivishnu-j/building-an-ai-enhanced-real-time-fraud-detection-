package com.example.fraud.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

@RestController
public class FraudController {
    @GetMapping("/fraud-check")
    public Mono<String> checkFraud() {
        // Placeholder for fraud check logic
        return Mono.just("Fraud check completed");
    }
}
