package rw.ac.rca.webapp.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rw.ac.rca.webapp.orm.User;
import rw.ac.rca.webapp.util.UserRole;

import rw.ac.rca.webapp.dao.UserDAO;
import rw.ac.rca.webapp.dao.impl.UserDAOImpl;

/**
 * Servlet implementation class CreateUser
 */
public class EditEmployee extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = UserDAOImpl.getInstance();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditEmployee() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pageRedirect = request.getParameter("page");
        HttpSession httpSession = request.getSession();
        if (pageRedirect != null) {
            if (pageRedirect.equals("editemployee")) {

                if (request.getParameter("saveEditedEmployee") != null) {

                    int id = Integer.parseInt(request.getParameter("id"));
                    User user = userDAO.getUserById(id);

                    try {
                        String usernameauth = request.getParameter("username");
                        String userfullname = request.getParameter("userfullname");
                        String email = request.getParameter("email");

                        user.setUsername(usernameauth);
                        user.setFullName(userfullname);
                        user.setEmail(email);
                        userDAO.updateUser(user);

                        httpSession.setAttribute("message", "Edited successfully");
                    } catch (Exception e) {
                        httpSession.setAttribute("message", "Can't Edit");
                    }

                }

            }
            UserRole[] userRoles = UserRole.values();
            httpSession.setAttribute("userRoles", userRoles);
            request.getRequestDispatcher("WEB-INF/editemployee.jsp").forward(
                    request, response);
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
