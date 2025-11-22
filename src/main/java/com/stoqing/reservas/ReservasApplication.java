package com.stoqing.reservas;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class ReservasApplication {

    public static void main(String[] args) {
        SpringApplication.run(ReservasApplication.class, args);
    }

}
