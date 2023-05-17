package rw.ac.rca.webapp.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import rw.ac.rca.webapp.dao.UserDAO;
import rw.ac.rca.webapp.dao.impl.UserDAOImpl;
import rw.ac.rca.webapp.orm.User;

public class DeleteUser extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = UserDAOImpl.getInstance();

    public DeleteUser(){
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pageRedirect = request.getParameter("page");
        HttpSession httpSession = request.getSession();
        if (pageRedirect != null) {
            if (pageRedirect.equals("deleteuser")) {

                try {

                    int userId = Integer.parseInt(request.getParameter("id"));

                    System.out.println(userId);

                    User user = userDAO.getUserById(userId);

                    userDAO.deleteUser(user);
                    httpSession.setAttribute("message", "User deleted successfully!");
                } catch (NumberFormatException | NullPointerException e) {
                    httpSession.setAttribute("message", "Failed to delete user!");
                }
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
