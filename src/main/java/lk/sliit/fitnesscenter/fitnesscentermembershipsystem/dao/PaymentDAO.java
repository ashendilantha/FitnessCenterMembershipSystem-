package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao;

import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.Payment;
import java.io.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Queue;
import java.util.LinkedList;

public class PaymentDAO {
    private static final String FILE_PATH = System.getProperty("user.home") + "/Hansana/payments.txt";
    private static final Queue<Payment> paymentQueue = new LinkedList<>();

    public PaymentDAO() {
        createFileIfNotExists();
    }

    private void createFileIfNotExists() {
        File file = new File(FILE_PATH);
        if (!file.exists()) {
            try {
                file.getParentFile().mkdirs();
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    // Create operation(Create)
    public boolean createPayment(Payment payment) {
        paymentQueue.add(payment); // Add the new payment to the queue
        processQueue();            // Process all payments in the queue
        return true;
    }

    private synchronized void processQueue() {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            while (!paymentQueue.isEmpty()) {
                Payment payment = paymentQueue.poll();
                writer.write(payment.toString());   // Write payment data
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }





    // Read operation(Read)
    public List<Payment> getAllPayments() {
        List<Payment> payments = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;

            // Read each payment record line by line
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");

                // Create a Payment object from the parsed data
                Payment payment = new Payment(
                        Integer.parseInt(data[0]),
                        Integer.parseInt(data[1]),
                        data[2],
                        data[3],
                        Double.parseDouble(data[4]),
                        LocalDateTime.parse(data[5]),
                        data[6],
                        data[7]
                );
                payments.add(payment); // Add payment to the list
            }
        } catch (IOException e) {
            e.printStackTrace(); // Error handling
        }
        return payments;
    }





//    // Update operation(Update)
//    public boolean updatePayment(Payment updatedPayment) {
//        List<Payment> payments = getAllPayments();
//        boolean found = false;
//
//        for (int i = 0; i < payments.size(); i++) {
//            if (payments.get(i).getPaymentId() == updatedPayment.getPaymentId()) {
//                payments.set(i, updatedPayment);
//                found = true;
//                break;
//            }
//        }
//
//        if (found) {
//            rewriteFile(payments);
//            return true;
//        }
//        return false;
//    }

//    // Delete operation(Delete)
//    public boolean deletePayment(int paymentId) {
//        List<Payment> payments = getAllPayments();
//        boolean removed = payments.removeIf(p -> p.getPaymentId() == paymentId);
//
//        if (removed) {
//            rewriteFile(payments);
//            return true;
//        }
//        return false;
//    }

    private void rewriteFile(List<Payment> payments) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Payment payment : payments) {
                writer.write(payment.toString());
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Sort payments by date using insertion sort
    public List<Payment> getPaymentsSortedByDate() {
        List<Payment> payments = getAllPayments();

        for (int i = 1; i < payments.size(); i++) {
            Payment key = payments.get(i);
            int j = i - 1;

            while (j >= 0 && payments.get(j).getPaymentDate().isAfter(key.getPaymentDate())) {
                payments.set(j + 1, payments.get(j));
                j = j - 1;
            }
            payments.set(j + 1, key);
        }

        return payments;
    }

    // Get payments by member ID
    public List<Payment> getPaymentsByMemberId(int memberId) {
        List<Payment> allPayments = getAllPayments();
        List<Payment> memberPayments = new ArrayList<>();

        for (Payment payment : allPayments) {
            if (payment.getMemberId() == memberId) {
                memberPayments.add(payment);
            }
        }

        return memberPayments;
    }

    public int getQueueSize() {
        return paymentQueue.size();
    }
    public Payment processNextPayment() {
        return paymentQueue.poll();
    }
}