package com.Bakery1.utils;

import com.Bakery1.models.BakeryOrder;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class BakeryOrderFileManager {

    private static final String FILE_NAME = "C:\\Users\\USER\\Desktop\\projectfinal\\cakeshop\\src\\main\\webapp\\output2.txt";//output2 = bakeryOrder

    public static String getFileName() {
        return FILE_NAME;
    }

    // Enhanced CSV writing method to ensure each order is on a new line
    public static void writeOrderAsCSV(BakeryOrder order, String filePath) throws IOException {
        File file = new File(filePath);
        boolean fileExists = file.exists() && file.length() > 0;
        
        // Format the CSV line
        String csvLine = order.getCustomerName() + "," + 
                         order.getItemType() + "," + 
                         order.getSauceFlavour() + "," + 
                         order.getItemCount() + "," + 
                         order.getPayment();
        
        try (FileWriter fw = new FileWriter(filePath, true);
             BufferedWriter bw = new BufferedWriter(fw)) {
            
            // If file exists and doesn't end with a newline, add one first
            if (fileExists) {
                String content = new String(Files.readAllBytes(Paths.get(filePath)));
                if (!content.endsWith("\n") && !content.endsWith("\r\n")) {
                    bw.newLine();
                }
            }
            
            // Write the data and ensure it ends with a newline
            bw.write(csvLine);
            bw.newLine();
        }
    }
    
    // Existing method for serialized objects - keeping for backward compatibility
    public static void writeOrderToFile(BakeryOrder order, String filePath) throws IOException {
        boolean append = new File(filePath).exists();

        try (FileOutputStream fos = new FileOutputStream(filePath, true);
             ObjectOutputStream oos = append
                     ? new AppendableObjectOutputStream(fos)
                     : new ObjectOutputStream(fos)) {
            oos.writeObject(order);
        }
    }

    public static void deleteOrderByCustomerName(String customerName, String filePath) throws IOException, ClassNotFoundException {
        // First try to delete from CSV format
        try {
            deleteOrderByCustomerNameFromCSV(customerName, filePath);
        } catch (Exception e) {
            // If CSV deletion fails, try object serialization format
            List<BakeryOrder> orders = readOrdersAsObjects(filePath);
            boolean removed = orders.removeIf(order -> order.getCustomerName().equalsIgnoreCase(customerName));

            if (removed) {
                try (ObjectOutputStream oos = new ObjectOutputStream(Files.newOutputStream(Paths.get(filePath)))) {
                    for (BakeryOrder order : orders) {
                        oos.writeObject(order);
                    }
                }
            }
        }
    }
    
    // New method to delete orders from CSV file
    private static void deleteOrderByCustomerNameFromCSV(String customerName, String filePath) throws IOException {
        List<String> lines = new ArrayList<>();
        File file = new File(filePath);
        
        if (!file.exists()) return;
        
        // Read all lines, skipping those that match the customer name
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                // Skip lines that match the customer name
                if (line.trim().isEmpty() || line.contains("ysr") || !line.contains(",")) {
                    lines.add(line); // Keep non-CSV lines as-is
                    continue;
                }
                
                String[] parts = line.split(",");
                if (parts.length >= 1 && !parts[0].trim().equalsIgnoreCase(customerName.trim())) {
                    lines.add(line); // Keep lines for other customers
                }
            }
        }
        
        // Write the filtered lines back to the file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
            for (int i = 0; i < lines.size(); i++) {
                writer.write(lines.get(i));
                if (i < lines.size() - 1) {
                    writer.newLine();
                }
            }
        }
    }

    public static List<BakeryOrder> readOrdersAsObjects(String filePath) throws IOException, ClassNotFoundException {
        List<BakeryOrder> orders = new ArrayList<>();
        File file = new File(filePath);

        if (!file.exists()) return orders;

        try (ObjectInputStream ois = new ObjectInputStream(Files.newInputStream(file.toPath()))) {
            while (true) {
                try {
                    BakeryOrder order = (BakeryOrder) ois.readObject();
                    orders.add(order);
                } catch (EOFException e) {
                    break;
                }
            }
        } catch (InvalidClassException e) {
            System.err.println("Incompatible class version detected for BakeryOrder. Deleting corrupted file: " + filePath);
            file.delete();

        }

        return orders;
    }

    // Improved method to read orders from CSV format
    public static List<BakeryOrder> readOrdersFromCSV(String filePath) throws IOException {
        List<BakeryOrder> orders = new ArrayList<>();
        File file = new File(filePath);

        if (!file.exists()) return orders;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                line = line.trim();
                // Skip empty lines or lines that appear to be serialized objects
                if (line.isEmpty() || line.contains("ysr") || !line.contains(",")) {
                    continue;
                }
                
                try {
                    // Parse CSV line
                    String[] parts = line.split(",");
                    if (parts.length >= 5) {
                        String customerName = parts[0].trim();
                        String itemType = parts[1].trim();
                        String sauceFlavour = parts[2].trim();
                        int itemCount = Integer.parseInt(parts[3].trim());
                        String payment = parts[4].trim();
                        
                        BakeryOrder order = new BakeryOrder(customerName, itemType, sauceFlavour, itemCount, payment);
                        orders.add(order);
                    }
                } catch (NumberFormatException e) {
                    // Log error but continue processing other lines
                    System.err.println("Error parsing line: " + line + " - " + e.getMessage());
                }
            }
        }
        
        return orders;
    }

    // Inner class to support appending objects
    private static class AppendableObjectOutputStream extends ObjectOutputStream {
        public AppendableObjectOutputStream(OutputStream out) throws IOException {
            super(out);
        }

        @Override
        protected void writeStreamHeader() throws IOException {
            // Do not write a header when appending
            reset();
        }
    }
}