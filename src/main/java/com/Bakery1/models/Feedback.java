package com.Bakery1.models;

public class Feedback {
    private final String name;
    private final String message;

    public Feedback(String name, String message) {
        this.name = name;
        this.message = message;
    }

    public String getName() {
        return name;
    }

    public String getMessage() {
        return message;
    }

    public String toFileString() {
        return name + " - " + message;
    }
}

