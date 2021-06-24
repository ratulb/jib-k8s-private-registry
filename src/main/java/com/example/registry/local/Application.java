package com.example.registry.local;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.concurrent.atomic.AtomicLong;

@RestController
@SpringBootApplication
public class Application {
	private static final String template = "Hello Docker, %s!";
        private final AtomicLong counter = new AtomicLong();

	public static void main(String[] args) {
		System.out.println("Starting application...");
		SpringApplication.run(Application.class, args);
	}

        @GetMapping("/greeting")
        public String greeting(@RequestParam(value="name",
           defaultValue="World") String name) {
           String message = String.format(template, counter.incrementAndGet()) + " " + name;
           return message;
        }
	@GetMapping("/")
        public String index() {
           return "Hello there";
        }

}
