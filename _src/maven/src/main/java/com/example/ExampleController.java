// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

package com.example;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@RestController
public class ExampleController {

    private static final Logger logger = LoggerFactory.getLogger(ExampleController.class);
    private final Random random = new Random();

    @GetMapping("/")
    public String root() {
        logger.info("Root endpoint accessed");
        return "OK - Application is running with Application Insights!";
    }

    @GetMapping("/test")
    public String test() {
        logger.info("Test endpoint accessed");
        
        // Simulate some processing time
        try {
            Thread.sleep(random.nextInt(100) + 50);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        
        return "Test successful! Telemetry data sent to Application Insights.";
    }

    @GetMapping("/error")
    public String error() {
        logger.error("Error endpoint accessed - simulating an error");
        throw new RuntimeException("This is a test exception for Application Insights");
    }

    @GetMapping("/health")
    public String health() {
        logger.info("Health check performed");
        return "Healthy";
    }
}
