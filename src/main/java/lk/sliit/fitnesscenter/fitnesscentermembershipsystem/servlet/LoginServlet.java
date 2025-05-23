//package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.servlet;
//import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.Member;
//import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.MemberDAO;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import java.io.IOException;
//
//@WebServlet("/LoginServlet")
//public class LoginServlet extends HttpServlet {  // Added extends HttpServlet
//    private MemberDAO memberManager = new MemberDAO();
//    // Admin credentials
//    private static final String ADMIN_EMAIL = "admin12@mail.com";
//    private static final String ADMIN_PASSWORD = "1234";
//
//    @Override  // Added @Override annotation
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//
//        // Check for admin login first
//        if (ADMIN_EMAIL.equals(email) && ADMIN_PASSWORD.equals(password)) {
//            HttpSession session = request.getSession();
//            // Create a simple admin user object
//            Member adminUser = new Member();
//            adminUser.setAdmin(true);
//            adminUser.setEmail(email);
//            session.setAttribute("currentUser", adminUser);
//            response.sendRedirect("adminDashboard.jsp");
//            return;
//        }
//
//        // Regular member login
//        Member authenticatedMember = memberManager.authenticate(email, password);
//
//        if (authenticatedMember != null) {
//            HttpSession session = request.getSession();
//            session.setAttribute("currentUser", authenticatedMember);
//            response.sendRedirect("memberDashboard.jsp");
//        }
//        else {
//            request.setAttribute("error", "Invalid email or password");
//            request.getRequestDispatcher("login.jsp").forward(request, response);
//        }
//    }
//}




package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.servlet;

import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.Member;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.MemberDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private MemberDAO memberManager = new MemberDAO();
    // Admin credentials
    private static final String ADMIN_EMAIL = "admin12@mail.com";
    private static final String ADMIN_PASSWORD = "1234";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("error", "Email and password are required");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        try {
            // Check for admin login first
            if (ADMIN_EMAIL.equals(email) && ADMIN_PASSWORD.equals(password)) {
                HttpSession session = request.getSession();
                // Create a simple admin user object with minimal required fields
                Member adminUser = new Member("admin-" + System.currentTimeMillis(), "Admin", email, password,
                        "Admin", "", null); // Using a timestamp as memberId, empty contactNumber
                adminUser.setAdmin(true);
                session.setAttribute("currentUser", adminUser);
                session.setAttribute("role", "admin");
                response.sendRedirect(request.getContextPath() + "/adminDashboard.jsp");
                return;
            }

            // Regular member login
            Member authenticatedMember = memberManager.authenticate(email, password);

            if (authenticatedMember != null) {
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", authenticatedMember);
                session.setAttribute("role", "member");
                session.setAttribute("memberId", authenticatedMember.getMemberId());
                response.sendRedirect(request.getContextPath() + "/memberDashboard.jsp");
            } else {
                request.setAttribute("error", "Invalid email or password");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}