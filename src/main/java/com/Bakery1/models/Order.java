package com.Bakery1.models;

public class Order {
        private final String customerName;
        private final String cakeType;
        private final String cakeFlavour;
        private final String cakeSize;
        private final String message;
        private final String payment;
      
        public Order(String customerName, String cakeType, String cakeFlavour, String cakeSize, String message, String payment) {
            this.customerName = customerName;
            this.cakeType = cakeType;
            this.cakeFlavour = cakeFlavour;
            this.cakeSize = cakeSize;
            this.message = message;
            this.payment = payment;
        }

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

        //Order to string to write in file
        public String toFileString() {
            return customerName + "|" + cakeType + "|" + cakeFlavour + "|" + cakeSize + "|" + message + "|" + payment;
        }

        //create an Order object
        public static com.Bakery1.models.Order fromFileString(String line) {
            String[] parts = line.split("\\|"); 
            if (parts.length == 6) {
                return new com.Bakery1.models.Order(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5]);
            } else {
                return null;
            }
        }
}

