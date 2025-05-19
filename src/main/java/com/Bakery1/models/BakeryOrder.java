
package com.Bakery1.models;

import java.io.Serializable;

public class BakeryOrder implements Serializable {
    private static final long serialVersionUID = 1L; // Ensures consistent serialization

    private String customerName;
    private String itemType;
    private String sauceFlavour;
    private int itemCount;
    private String payment; 
    // Constructor
    public BakeryOrder(String customerName, String itemType, String sauceFlavour, int itemCount, String payment) {
        this.customerName = customerName;
        this.itemType = itemType;
        this.sauceFlavour = sauceFlavour;
        this.itemCount = itemCount;
        this.payment = payment;
    }

    // Getters and Setters
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getItemType() {
        return itemType;
    }

    public void setItemType(String itemType) {
        this.itemType = itemType;
    }

    public String getSauceFlavour() {
        return sauceFlavour;
    }

    public void setSauceFlavour(String sauceFlavour) {
        this.sauceFlavour = sauceFlavour;
    }

    public int getItemCount() {
        return itemCount;
    }

    public void setItemCount(int itemCount) {
        this.itemCount = itemCount;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    @Override
    public String toString() {
        return customerName + "|" + itemType + "|" + sauceFlavour + "|" + itemCount + "|" + payment;
    }
    
}
