package Week1_DesignPatterns_DSA.FinancialForecasting;

/*
Recursion is a programming technique where a method calls itself to solve a problem by breaking it down into smaller subproblems.
It can simplify problems that have a natural recursive structure, such as computing factorial, Fibonacci numbers, or traversing trees.
*/

// Recursive future value calculation: FV = PV * (1 + rate)^years
class FinancialForecasting {
    // Recursive method to calculate future value
    static double futureValue(double presentValue, double rate, int years) {
        if (years == 0) {
            return presentValue;
        }
        return futureValue(presentValue, rate, years - 1) * (1 + rate);
    }

    public static void main(String[] args) {
        double presentValue = 1000.0;
        double rate = 0.08; // 8% annual growth
        int years = 5;

        double fv = futureValue(presentValue, rate, years);
        System.out.printf("Future value after %d years: %.2f\n", years, fv);
    }
}

/*
Time complexity: O(n), where n is the number of years, since the function calls itself once per year.
To optimize and avoid excessive computation (especially if overlapping subproblems exist), use memoization or an iterative approach.
For this simple case, iteration is more efficient:
    static double futureValueIterative(double presentValue, double rate, int years) {
        double result = presentValue;
        for (int i = 0; i < years; i++) {
            result *= (1 + rate);
        }
        return result;
    }
*/
