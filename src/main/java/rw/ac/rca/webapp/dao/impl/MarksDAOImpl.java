/**
 *
 */
package rw.ac.rca.webapp.dao.impl;

import java.util.List;
import org.hibernate.Query;
import rw.ac.rca.webapp.dao.MarksDAO;
import rw.ac.rca.webapp.orm.Mark;
import rw.ac.rca.webapp.orm.Student;

public class MarksDAOImpl extends DAO implements MarksDAO {

    private static MarksDAOImpl instance;

    private MarksDAOImpl() {
    }

    public static MarksDAOImpl getInstance() {
        if (instance == null) {
            return new MarksDAOImpl();
        } else {
            return instance;
        }
    }

    public Mark saveMarks( Mark mark) {
        try {
            begin();
            getSession().save(mark);
            commit();
            return mark;
        } catch (Exception e) {
            rollback();
            return null;
        }
    }

    public Mark updateMarks(Mark mark) {
        try {
            begin();
            getSession().update(mark);
            commit();
            return mark;
        } catch (Exception e) {
            rollback();
            return null;
        }
    }

    public Mark saveOrUpdateMarks(Mark mark) {
        try {
            begin();
            getSession().saveOrUpdate(mark);
            commit();
            return mark;
        } catch (Exception e) {
            rollback();
            return null;
        }
    }

    public boolean deleteMarks(Mark mark) {
        try {
            begin();
            Query query = getSession().createQuery(
                    "from mark where id= :ref");
            query.setInteger("ref", mark.getId());
            Mark mrk = (Mark) query.uniqueResult();
            getSession().delete(mrk);
            commit();
            return true;

        } catch (Exception e) {
            rollback();
            return false;
        }
    }

    public Mark getMarksById(int markId) {
        try {
            begin();
            Query query = getSession().createQuery(
                    "from mark where id= :ref");
            query.setInteger("ref", markId);
            Mark mark = (Mark) query.uniqueResult();
            commit();
            return mark;
        } catch (Exception e) {
            rollback();
            return null;

        }
    }

    @SuppressWarnings("unchecked")
    public List<Mark> getAllMarks() {
        try {
            begin();
            Query query = getSession().createQuery("from Mark");
            List<Mark> marks = query.list();
            commit();
            return marks;
        } catch (Exception e) {
            rollback();
            return null;
        }
    }
}