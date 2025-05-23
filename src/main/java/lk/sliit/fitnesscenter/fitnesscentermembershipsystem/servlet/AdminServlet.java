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

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    private MemberDAO memberManager = new MemberDAO();
//    private MembershipPlanManager membershipPlanManager = new MembershipPlanManager();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        HttpSession session = request.getSession();
        Member currentUser = (Member)session.getAttribute("currentUser");

        if(currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }


        String action = request.getParameter("action");

        switch (action){
            case "addPlan":
                break;
            case "deleteMember":
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        HttpSession session = request.getSession();
        Member currentUser = (Member)session.getAttribute("currentUser");

        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        request.setAttribute("member", memberManager.getAllMembers());
//        request.setAttribute("plans", membershipPlanManager.getAllPlans());
        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }
}
