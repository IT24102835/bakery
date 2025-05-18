package com.Bakery1.models;

public class Order {
        private final String customerName;
        private final String cakeType;
        private final String cakeFlavour;
        private final String cakeSize;
        private final String message;
        private final String payment;

        // Constructor
        public Order(String customerName, String cakeType, String cakeFlavour, String cakeSize, String message, String payment) {
            this.customerName = customerName;
            this.cakeType = cakeType;
            this.cakeFlavour = cakeFlavour;
            this.cakeSize = cakeSize;
            this.message = message;
            this.payment = payment;
        }

        // Getters
        public String getCustomerName() {
            return customerName;
        }

        public String getCakeType() {
            return cakeType;
        }

        public String getCakeFlavour() {
            return cakeFlavour;
        }

        public String getCakeSize() {
            return cakeSize;
        }

        public String getMessage() {
            return message;
        }

        public String getPayment() {
            return payment;
        }

        // Convert Order to string to write in file (use a clear delimiter like |)
        public String toFileString() {
            return customerName + "|" + cakeType + "|" + cakeFlavour + "|" + cakeSize + "|" + message + "|" + payment;
        }

        // Parse a line from file to create an Order object
        public static com.Bakery1.models.Order fromFileString(String line) {
            String[] parts = line.split("\\|"); // split by pipe character
            if (parts.length == 6) {
                return new com.Bakery1.models.Order(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5]);
            } else {
                return null;
            }
        }
}

