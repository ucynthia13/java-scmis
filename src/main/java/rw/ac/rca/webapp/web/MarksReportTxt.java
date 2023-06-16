package rw.ac.rca.webapp.web;

import rw.ac.rca.webapp.dao.MarksDAO;
import rw.ac.rca.webapp.dao.impl.MarksDAOImpl;
import rw.ac.rca.webapp.orm.Mark;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.nio.file.Files;
import java.util.List;

public class MarksReportTxt extends HttpServlet {
    public MarksReportTxt(){
        super();
    }

    MarksDAO marksDAO = MarksDAOImpl.getInstance();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession httpSession = req.getSession();
        String pageRedirect =  req.getParameter("page");
        if(pageRedirect.equals("markssearch")){
            String filePath = "/Uploads";
            String fileName = "marks.txt";
            String fullPath = filePath + File.separator + fileName;

            List<Mark> marks = marksDAO.getAllMarks();
            if(marks != null){
                File file = new File(fullPath);
                file.getParentFile().mkdirs();
                file.createNewFile();

                try (OutputStream fos  = Files.newOutputStream(file.toPath())){
                    for (Mark marks1: marks){
                        String studentId = "Marks Scored: " + marks1.getStudentId();
                        String courseName = "Total Marks: " + marks1.getCourseName();
                        String courseMarks = "Grade:  " + marks1.getCourseMarks();

                        fos.write(studentId.getBytes());
                        fos.write(courseName.getBytes());
                        fos.write(courseMarks.getBytes());
                        fos.write(System.lineSeparator().getBytes());
                    }
                }

                resp.setContentType("application/octet-stream");
                resp.setContentLength((int) file.length());
                resp.setHeader("Content-Disposition" , "attachment; filename=\"" + file.getName() + "\"");

                ServletOutputStream outputStream = resp.getOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead;

                try (FileInputStream fis = new FileInputStream(file)) {
                    while ((bytesRead = fis.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                }
                outputStream.close();
                RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/marks.jsp");
                dispatcher.forward(req, resp);
            }
        }

    }
}