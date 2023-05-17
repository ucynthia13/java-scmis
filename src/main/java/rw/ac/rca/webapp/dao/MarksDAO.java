package rw.ac.rca.webapp.dao;

import java.util.List;

import rw.ac.rca.webapp.orm.Mark;

public interface MarksDAO {
    public Mark saveMarks(Mark mark);
    public Mark updateMarks(Mark mark);
    public Mark saveOrUpdateMarks(Mark mark);
    public boolean deleteMarks(Mark mark);
    public Mark getMarksById(int marksId);
    public List<Mark> getAllMarks();

}
