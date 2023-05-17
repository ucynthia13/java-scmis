package rw.ac.rca.webapp.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rw.ac.rca.webapp.dao.StudentDAO;
import rw.ac.rca.webapp.dao.impl.StudentDAOImpl;
import rw.ac.rca.webapp.orm.Address;
import rw.ac.rca.webapp.orm.Student;
import rw.ac.rca.webapp.util.UserRole;


/**
 * Servlet implementation class CreateUser
 */
public class EditStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentDAO studentDAO = StudentDAOImpl.getInstance();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditStudent() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pageRedirect = request.getParameter("page");
        HttpSession httpSession = request.getSession();
        if (pageRedirect != null) {
            if (pageRedirect.equals("editstudent")) {

                if (request.getParameter("saveEditedStudent") != null) {

                    int id = Integer.parseInt(request.getParameter("id"));
                    Student student = studentDAO.getStudentById(id);

                    try {
                        String firstname = request.getParameter("firstname");
                        String lastname = request.getParameter("lastname");
                        String email = request.getParameter("email");
                        String gender = request.getParameter("gender");
                        int isInternational = Integer.parseInt(request.getParameter("isInternational"));
                        int stdAddress = Integer.parseInt(request.getParameter("address"));
                        Address address = new Address(stdAddress);

                        student.setFirstName(firstname);
                        student.setLastName(lastname);
                        student.setEmail(email);
                        student.setGender(gender);
                        student.setIsInternational(isInternational);
                        student.setAddress(address);


                        httpSession.setAttribute("message", "Edited successfully");
                    } catch (Exception e) {
                        httpSession.setAttribute("message", "Can't Edit");
                    }

                }

            }
            UserRole[] userRoles = UserRole.values();
            httpSession.setAttribute("userRoles", userRoles);
            request.getRequestDispatcher("WEB-INF/editstudent.jsp").forward(
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
