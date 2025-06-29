package com.example;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.*;

public class CalculatorTest {

    private Calculator calculator;

    @BeforeEach
    public void setUp() {
        calculator = new Calculator();
        System.out.println("Setup: Calculator object created");
    }

    @AfterEach
    public void tearDown() {
        calculator = null;
        System.out.println("Teardown: Calculator object cleared");
    }

    @Test
    public void testAddition() {
        int a = 5;
        int b = 3;
        int result = calculator.add(a, b);

        assertEquals(8, result, "5 + 3 should equal 8");
    }

    @Test
    public void testAdditionWithZero() {
        int a = 0;
        int b = 7;
        int result = calculator.add(a, b);

        assertEquals(7, result, "0 + 7 should equal 7");
    }
}
