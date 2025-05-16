package com.Bakery1.utils;

import com.Bakery1.models.Feedback;
import java.io.*;
import java.util.*;

public class FeedbackFileManager {
    public static void saveFeedback(Feedback feedback, String filePath) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(feedback.toFileString());
            writer.newLine();
        }
    }

    public static List<String> getAllFeedback(String filePath) throws IOException {
        List<String> feedbackList = new ArrayList<>();
        File file = new File(filePath);
        if (!file.exists()) return feedbackList;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                feedbackList.add(line);
            }
        }
        return feedbackList;
    }
}