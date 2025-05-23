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

@WebServlet("/MemberLoginServlet")
public class MemberLoginServlet extends HttpServlet {
    private MemberDAO memberManager = new MemberDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Member member = memberManager.authenticate(email, password);

        if (member != null) {
            HttpSession session = request.getSession();
            session.setAttribute("member", member);

            response.sendRedirect("memberProfile.jsp");
        }
        else {
            response.sendRedirect("loginMember.jsp?error=true");
        }
    }
}
