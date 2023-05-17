package rw.ac.rca.webapp.web;

import rw.ac.rca.webapp.dao.MarksDAO;
import rw.ac.rca.webapp.dao.impl.MarksDAOImpl;
import rw.ac.rca.webapp.orm.Course;
import rw.ac.rca.webapp.orm.Mark;
import rw.ac.rca.webapp.orm.Student;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CreateCourse
 */
public class CreateMark extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MarksDAO marksDAO = (MarksDAO) MarksDAOImpl.getInstance();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateMark() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String pageRedirect = request.getParameter("page");
        HttpSession httpSession = request.getSession();
        Object user = httpSession.getAttribute("authenticatedUser");
        System.out.println("The user in session is: " + user);

        if (pageRedirect != null) {
            System.out.println("The print statement is and the only is: " + pageRedirect);
            if (pageRedirect.equals("createmarks")) {
                request.getRequestDispatcher("WEB-INF/createmarks.jsp").forward(request, response);
            } else {
                request.setAttribute("error ", "No user found");
                request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error ", "No user found");
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageRedirect = request.getParameter("page");
        HttpSession httpSession = request.getSession();
        Object user = httpSession.getAttribute("authenticatedUser");

        if(pageRedirect != null){
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            if(pageRedirect.equals("createmarks")){
                Mark mark = new Mark();
                String coursename = request.getParameter("coursename");
                int coursemarks = Integer.parseInt(request.getParameter("coursemarks"));
                int studentid = Integer.parseInt(request.getParameter("studentId"));
                Student studentId = new Student(studentid);

                // Saving marks;
                try {
                    mark.setStudentId(studentId);
                    mark.setCourseName(coursename);
                    mark.setCourseMarks(coursemarks);

                    marksDAO.saveMarks(mark);
                    request.setAttribute("success" , "Successfully registered marks" );
                    request.getRequestDispatcher("WEB-INF/createmarks.jsp").forward(request , response);
                }catch (Exception e){
                    request.setAttribute("error" , "Failed to create the Course" );
                    request.getRequestDispatcher("WEB-INF/createmarks.jsp").forward(request , response);
                }
            }else{
                request.getRequestDispatcher("WEB-INF/login.jsp").forward(request , response);
            }
        }else{
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request , response);
        }
    }

}