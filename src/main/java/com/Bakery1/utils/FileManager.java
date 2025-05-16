package com.Bakery1.utils;

import com.Bakery1.models.Users;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileManager {
    private static final String FILE_NAME = "C:\\Users\\USER\\Desktop\\projectfinal\\bakery\\src\\main\\webapp\\WEB-INF\\users.txt";//users.txt

    // Write a user to file in clean CSV format
    public static void writeUserToFile(Users user, String filePath) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(user.getName() + "," +
                    user.getAddress() + "," +
                    user.getCity() + "," +
                    user.getPhone() + "," +
                    user.getEmail() + "," +
                    user.getPassword());
            writer.newLine(); // One line per user
        }
    }

    // Read raw lines from file
    public static List<String> readUsersFromFile(String filePath) throws IOException {
        List<String> lines = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;

            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    lines.add(line.trim());
                }
            }
        }

        return lines;
    }

    // Convert lines into User objects
    public static List<Users> readUsersAsObjects(String filePath) throws IOException {
        List<Users> users = new ArrayList<>();
        List<String> lines = readUsersFromFile(filePath);

        for (String line : lines) {
            String[] parts = line.split(",");

            if (parts.length == 6) {
                try {
                    String name = parts[0];
                    String address = parts[1];
                    String city = parts[2];
                    int phone = Integer.parseInt(parts[3].replaceAll("\\D", "")); // safe parsing
                    String email = parts[4];
                    String password = parts[5];

                    users.add(new Users(name, address, city, phone, email, password));
                } catch (NumberFormatException e) {
                    // Skip invalid entries
                    System.err.println("Skipping invalid user entry: " + line);
                }
            }
        }

        return users;
    }
}