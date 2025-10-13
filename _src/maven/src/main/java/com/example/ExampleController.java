// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

package com.example;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Controller
public class ExampleController {

    private static final Logger logger = LoggerFactory.getLogger(ExampleController.class);
    private final Random random = new Random();

    @GetMapping("/")
    public String home(Model model) {
        logger.info("Home page accessed");
        model.addAttribute("currentTime", LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
        return "index";
    }

    @GetMapping("/api")
    @ResponseBody
    public String root() {
        logger.info("Root API endpoint accessed");
        return "OK - Application is running with Application Insights!";
    }

    @PostMapping("/api/test")
    @ResponseBody
    public Map<String, Object> test() {
        logger.info("Test API endpoint accessed");
        
        // Simulate some processing time
        try {
            Thread.sleep(random.nextInt(100) + 50);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        
        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("message", "Test successful! Telemetry data sent to Application Insights.");
        response.put("timestamp", LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
        response.put("processingTime", random.nextInt(100) + 50 + "ms");
        
        return response;
    }

    @PostMapping("/api/error")
    @ResponseBody
    public Map<String, Object> error() {
        logger.error("Error API endpoint accessed - simulating an error");
        
        Map<String, Object> response = new HashMap<>();
        response.put("status", "error");
        response.put("message", "This is a test exception for Application Insights");
        response.put("timestamp", LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
        
        // Simulate the error being logged but return a structured response
        try {
            throw new RuntimeException("This is a test exception for Application Insights");
        } catch (RuntimeException e) {
            logger.error("Exception occurred: ", e);
            response.put("exception", e.getMessage());
        }
        
        return response;
    }

    @GetMapping("/api/health")
    @ResponseBody
    public Map<String, Object> health() {
        logger.info("Health check API performed");
        
        Map<String, Object> response = new HashMap<>();
        response.put("status", "healthy");
        response.put("message", "Application is running smoothly");
        response.put("timestamp", LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
        response.put("uptime", "Application Insights Demo");
        response.put("version", "1.0.0");
        
        return response;
    }
}
