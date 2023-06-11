package rw.ac.rca.webapp.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rw.ac.rca.webapp.dao.MarksDAO;
import rw.ac.rca.webapp.dao.StudentDAO;
import rw.ac.rca.webapp.dao.impl.MarksDAOImpl;
import rw.ac.rca.webapp.dao.impl.StudentDAOImpl;
import rw.ac.rca.webapp.orm.Address;
import rw.ac.rca.webapp.orm.Mark;
import rw.ac.rca.webapp.orm.Student;
import rw.ac.rca.webapp.util.UserRole;


/**
 * Servlet implementation class CreateUser
 */
public class EditMarks extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MarksDAO marksDAO = MarksDAOImpl.getInstance();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditMarks() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pageRedirect = request.getParameter("page");
        HttpSession httpSession = request.getSession();
        if (pageRedirect != null) {
            if (pageRedirect.equals("editmarks")) {

                if (request.getParameter("editMarks") != null) {

                    int id = Integer.parseInt(request.getParameter("id"));
                    Mark mark = marksDAO.getMarksById(id);

                    try {
                        String courseName = request.getParameter("coursename");
                        int courseMarks = Integer.parseInt(request.getParameter("coursemarks"));

                        mark.setCourseName(courseName);
                        mark.setCourseMarks(courseMarks);

                        marksDAO.updateMarks(mark);

                        httpSession.setAttribute("message", "Edited successfully");
                    } catch (Exception e) {
                        httpSession.setAttribute("message", "Can't Edit");
                    }

                }

            }
            UserRole[] userRoles = UserRole.values();
            httpSession.setAttribute("userRoles", userRoles);
            request.getRequestDispatcher("WEB-INF/editmarks.jsp").forward(
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
