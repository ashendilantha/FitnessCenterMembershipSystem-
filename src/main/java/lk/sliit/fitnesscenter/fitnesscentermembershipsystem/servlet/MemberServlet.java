package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.servlet;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.Member;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.MemberDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.List;

@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {
    private final MemberDAO memberManager = new MemberDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action is required");
            return;
        }

        try {
            String memberID = request.getParameter("memberID");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String membershipType = request.getParameter("membershipType");
            String contactNumber = request.getParameter("contactNumber");
            LocalDate lastRenewalDate;

            // Validate date format
            try {
                lastRenewalDate = LocalDate.parse(request.getParameter("lastRenewalDate"));
            } catch (DateTimeParseException e) {
                response.sendRedirect("error.jsp?message=Invalid date format for lastRenewalDate");
                return;
            }

            // Basic validation
            if (email == null || !email.contains("@")) {
                response.sendRedirect("error.jsp?message=Invalid email address");
                return;
            }
            if (name == null || name.trim().isEmpty()) {
                response.sendRedirect("error.jsp?message=Name is required");
                return;
            }

            // Log received parameters for debugging
            System.out.println("Received: memberID=" + memberID + ", name=" + name + ", email=" + email +
                    ", membershipType=" + membershipType + ", contactNumber=" + contactNumber +
                    ", lastRenewalDate=" + lastRenewalDate);

            Member member = new Member(memberID, name, email, password, membershipType, contactNumber, lastRenewalDate);

            switch (action) {
                case "add":
                    memberManager.addMember(member);
                    response.sendRedirect("success.jsp?message=Member added successfully");
                    break;

                case "update":
                    memberManager.updateMember(member);
                    response.sendRedirect("success.jsp?message=Member updated successfully");
                    break;

                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=" + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action != null) {
                switch (action) {
                    case "delete":
                        String deleteMemberID = request.getParameter("memberID");
                        memberManager.deleteMember(deleteMemberID);
                        response.sendRedirect("MemberServlet");
                        return;

                    case "sortByRenewalDate":
                        List<Member> sortedMembers = memberManager.getAllMembers();
                        sortedMembers = memberManager.sortMembersByRenewalDate(sortedMembers);
                        request.setAttribute("members", sortedMembers);
                        request.getRequestDispatcher("viewMembers.jsp").forward(request, response);
                        return;
                }
            }

            List<Member> members = memberManager.getAllMembers();
            request.setAttribute("members", members);
            request.getRequestDispatcher("viewMembers.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=" + e.getMessage());
        }
    }
}