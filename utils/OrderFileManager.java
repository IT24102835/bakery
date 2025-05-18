package com.Bakery1.utils;

import com.Bakery1.models.Order;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class OrderFileManager {

    private static final String FILE_NAME = "C:\\Users\\USER\\Desktop\\projectfinal\\bakery\\src\\main\\webapp\\output1.txt";//output1=custom cake

    // Write order to file (append mode)
    public static void writeOrderToFile(Order order, String filePath) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(order.toFileString());
            writer.newLine();
        }
    }

    // Read all orders from file (as raw lines)
    public static List<String> readOrdersFromFile(String filePath) throws IOException {
        List<String> orderData = new ArrayList<>();
        File file = new File(filePath);
        if (!file.exists()) file.createNewFile(); // create file if missing
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    orderData.add(line);
                }
            }
        }
        return orderData;
    }

    // Overwrite all orders in file
    public static void overwriteOrdersToFile(List<String> orders, String filePath) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, false))) {
            for (String line : orders) {
                writer.write(line);
                writer.newLine();
            }
        }
    }

    // Get file name
    public static String getFileName() {
        return FILE_NAME;
    }
}
