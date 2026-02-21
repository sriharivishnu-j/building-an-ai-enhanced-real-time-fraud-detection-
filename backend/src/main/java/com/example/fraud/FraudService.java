package com.example.fraud;

import org.springframework.stereotype.Service;
import reactor.core.publisher.Mono;

@Service
public class FraudService {

    public Mono<FraudResponse> detectFraud() {
        // Placeholder for fraud detection logic
        return Mono.just(new FraudResponse("No fraud detected"));
    }
}