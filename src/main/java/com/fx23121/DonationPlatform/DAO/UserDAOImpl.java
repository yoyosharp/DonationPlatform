package com.fx23121.DonationPlatform.DAO;

import com.fx23121.DonationPlatform.Entity.User;
import com.fx23121.DonationPlatform.Service.SearchData;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.util.List;

@Repository
@EnableTransactionManagement
public class UserDAOImpl implements UserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void save(User user) {
        //get a new session
        Session session = sessionFactory.getCurrentSession();
        //save or update user
        session.saveOrUpdate(user);
    }

    //Since we not really "delete" a user from our database then all query must check
    //if the user.status field is "deleted" or not. In this case equal to -1 or not
    @Override
    public User getUserById(int id) {
        //get a new session
        Session session = sessionFactory.getCurrentSession();
        //create query
        Query<User> query = session.createQuery("FROM User WHERE id = :id " +
                "AND status != -1", User.class);
        query.setParameter("id", id);

        return query.getSingleResult();
    }


    @Override
    public List<User> getUserList() {
        //get a new session
        Session session = sessionFactory.getCurrentSession();
        //create query
        Query<User> query = session.createQuery("FROM User", User.class);

        return query.getResultList();
    }


    @Override
    public SearchData<User> getUserByFields(String stringQuery, int pageSize, int pageIndex) {

        //get user count
        Session session = sessionFactory.getCurrentSession();

        String string = "%" + stringQuery + "%";
        //create query for total result
        Query<Long> countQuery = session.createQuery("SELECT COUNT(u) FROM User u" +
                " WHERE status != -1" +
                " AND (email LIKE :stringQuery OR phoneNumber LIKE :stringQuery)", Long.class);
        countQuery.setParameter("stringQuery", string);
        long totalCount = countQuery.getSingleResult();

        //create user query
        Query<User> userQuery = session.createQuery("FROM User WHERE status != -1 " +
                        "AND (email LIKE :stringQuery OR phoneNumber LIKE :stringQuery)"
                , User.class);

        userQuery.setParameter("stringQuery", string);
        userQuery.setFirstResult((pageIndex - 1) * pageSize);
        //get the result count for query
        int resultCount = (int) Math.min(totalCount - (pageIndex - 1) * pageSize, pageSize);
        userQuery.setMaxResults(resultCount);

        List<User> result = userQuery.getResultList();

        return new SearchData<>((int) totalCount, result);
    }

}
