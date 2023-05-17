package rw.ac.rca.webapp.orm;

import javax.persistence.*;

@Entity
@Table(name = "mark")
public class Mark {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @ManyToOne
    @JoinColumn(name = "student_id")
    private Student studentId;
    private String courseName;
    private float courseMarks;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Student getStudentId() {
        return studentId;
    }

    public void setStudentId(Student studentId) {
        this.studentId = studentId;
    }

    public String getCourseName() {
        return courseName;
    }

    public float getCourseMarks() {
        return courseMarks;
    }

    public void setCourseMarks(float courseMarks) {
        this.courseMarks = courseMarks;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
}
