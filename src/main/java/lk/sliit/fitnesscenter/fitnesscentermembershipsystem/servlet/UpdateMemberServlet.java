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

@WebServlet("/UpdateMemberServlet")
public class UpdateMemberServlet extends HttpServlet {
    private MemberDAO memberManager = new MemberDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get parameters from form
        String memberId = request.getParameter("memberId");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String membershipType = request.getParameter("membershipType");
        String contactNumber = request.getParameter("contactNumber");

        //Searches for the current member using their ID
        Member existingMember = memberManager.getAllMembers().stream()
                .filter(m -> m.getMemberId().equals(memberId))
                .findFirst()
                .orElse(null);

        if (existingMember == null) {
            response.sendRedirect("memberProfile.jsp?error=Member not found");
            return;
        }

        // Create updated member
        Member updatedMember = new Member(
                memberId,
                name,
                email,
                password,
                membershipType,
                contactNumber,
                existingMember.getLastRenewalDate()
        );

        // Update member in the system
        memberManager.updateMember(updatedMember);

        // Update member in session
        HttpSession session = request.getSession();
        session.setAttribute("member", updatedMember);

        // Redirect back to profile with success message
        response.sendRedirect("memberProfile.jsp?success=Profile updated successfully");
    }
}