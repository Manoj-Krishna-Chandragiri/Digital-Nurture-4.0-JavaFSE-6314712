package com.example;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class AssertionsTest {

    @Test
    public void testAssertions() {
        int a = 2;
        int b = 3;
        int sum = a + b;
        assertEquals(5, sum);

        int x = 5;
        int y = 3;
        assertTrue(x > y);
        assertFalse(y > x);

        String nullString = null;
        assertNull(nullString);

        Object obj = new Object();
        assertNotNull(obj);
    }
}
