package com.cognizant.spring_core_date_format;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@SpringBootApplication
public class SpringCoreDateFormatApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringCoreDateFormatApplication.class, args);
        System.out.println("SpringCoreDateFormatApplication started...");

        displayDate();
    }

    public static void displayDate() {
        // Load Spring XML context
        ApplicationContext context = new ClassPathXmlApplicationContext("date-format.xml");

        // Get dateFormat bean
        SimpleDateFormat format = context.getBean("dateFormat", SimpleDateFormat.class);

        try {
            Date parsedDate = format.parse("31/12/2018");
            System.out.println("Parsed Date: " + parsedDate);
        } catch (ParseException e) {
            System.out.println("Date parsing failed: " + e.getMessage());
        }
    }
}

