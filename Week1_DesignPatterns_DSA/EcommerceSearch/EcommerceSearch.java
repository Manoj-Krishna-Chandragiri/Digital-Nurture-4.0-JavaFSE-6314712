package Week1_DesignPatterns_DSA.EcommerceSearch;

/*Big O notation describes the upper bound of an algorithm's running time as input size grows.
It helps analyze and compare the efficiency of algorithms.
Best case: minimum time for some input.
Average case: expected time over all inputs.
Worst case: maximum time for any input.
For search: Linear search O(1) best, O(n) average/worst. Binary search O(1) best, O(log n) average/worst (requires sorted data).
*/

class Product {
    int productId;
    String productName;
    String category;

    Product(int productId, String productName, String category) {
        this.productId = productId;
        this.productName = productName;
        this.category = category;
    }
}

class SearchUtils {
    static int linearSearch(Product[] products, int targetId) {
        for (int i = 0; i < products.length; i++) {
            if (products[i].productId == targetId) {
                return i;
            }
        }
        return -1;
    }

    static int binarySearch(Product[] products, int targetId) {
        int left = 0, right = products.length - 1;
        while (left <= right) {
            int mid = left + (right - left) / 2;
            if (products[mid].productId == targetId) {
                return mid;
            } else if (products[mid].productId < targetId) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return -1;
    }
}

public class EcommerceSearch {
    public static void main(String[] args) {
        Product[] products = {
            new Product(101, "Laptop", "Electronics"),
            new Product(205, "Shoes", "Footwear"),
            new Product(150, "Book", "Stationery"),
            new Product(300, "Phone", "Electronics"),
            new Product(120, "T-shirt", "Apparel")
        };

        int idx = SearchUtils.linearSearch(products, 150);
        if (idx != -1) {
            System.out.println("Linear Search: Found " + products[idx].productName);
        } else {
            System.out.println("Linear Search: Product not found");
        }

        java.util.Arrays.sort(products, (a, b) -> a.productId - b.productId);

        idx = SearchUtils.binarySearch(products, 150);
        if (idx != -1) {
            System.out.println("Binary Search: Found " + products[idx].productName);
        } else {
            System.out.println("Binary Search: Product not found");
        }

        // Analysis:
        // Linear search: O(n), checks each product one by one.
        // Binary search: O(log n), divides search space in half each time, but needs sorted data.
        // For large product lists, binary search is much faster and more suitable for an e-commerce platform.
    }
}
