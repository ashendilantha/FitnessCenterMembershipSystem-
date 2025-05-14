package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.servlet;

import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.PaymentDAO;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.CashPayment;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.CreditCardPayment;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.Payment;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "PaymentServlet", value = "/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    private PaymentDAO paymentDAO;

    @Override
    public void init() {
        paymentDAO = new PaymentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("viewAll".equals(action)) {
            List<Payment> payments = paymentDAO.getAllPayments();
            request.setAttribute("payments", payments);
            request.getRequestDispatcher("invoiceHistory.jsp").forward(request, response);
        } else if ("viewByMember".equals(action)) {
            int memberId = Integer.parseInt(request.getParameter("memberId"));
            List<Payment> payments = paymentDAO.getPaymentsByMemberId(memberId);
            request.setAttribute("payments", payments);
            request.getRequestDispatcher("invoiceHistory.jsp").forward(request, response);
        } else if ("viewSorted".equals(action)) {
            List<Payment> payments = paymentDAO.getPaymentsSortedByDate();
            request.setAttribute("payments", payments);
            request.getRequestDispatcher("invoiceHistory.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("paymentProcessing.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("processPayment".equals(action)) {
            processPayment(request, response);
        }
    }

    private void processPayment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int memberId = Integer.parseInt(request.getParameter("memberId"));
        String planId = request.getParameter("planId");
        String classId = request.getParameter("classId");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String description = request.getParameter("description");
        String paymentMethod = request.getParameter("paymentMethod");

        // Generate a new payment ID (in a real app, this would be more sophisticated)
        int paymentId = (int) (System.currentTimeMillis() % 1000000);
        LocalDateTime paymentDate = LocalDateTime.now();

        Payment payment;

        if ("Credit Card".equals(paymentMethod)) {
            String cardNumber = request.getParameter("cardNumber");
            String cardHolderName = request.getParameter("cardHolderName");
            String expiryDate = request.getParameter("expiryDate");
            String cvv = request.getParameter("cvv");

            payment = new CreditCardPayment(
                    paymentId, memberId, planId, classId, amount, paymentDate,
                    description, cardNumber, cardHolderName, expiryDate, cvv
            );
        } else {
            String receiptNumber = request.getParameter("receiptNumber");
            payment = new CashPayment(
                    paymentId, memberId, planId, classId, amount, paymentDate,
                    description, receiptNumber
            );
        }

        boolean success = paymentDAO.createPayment(payment);

        if (success) {
            request.setAttribute("message", "Payment processed successfully!");
            request.setAttribute("payment", payment);
            request.getRequestDispatcher("paymentConfirmation.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Failed to process payment");
            request.getRequestDispatcher("paymentProcessing.jsp").forward(request, response);
        }
    }

}