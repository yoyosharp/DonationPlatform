package com.fx23121.DonationPlatform.DAO;

import com.fx23121.DonationPlatform.Entity.UserDonation;
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
public class UserDonationDAOImpl implements UserDonationDAO {

    //injecting session factory
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void saveUserDonation(UserDonation userDonation) {
        //get a new session
        Session session = sessionFactory.getCurrentSession();
        //save the object
        session.saveOrUpdate(userDonation);
    }

    @Override
    public SearchData<UserDonation> getUserDonationListByDonation(int donationId, int pageSize, int pageIndex, int status) {
        //get a new session
        Session session = sessionFactory.getCurrentSession();
        //create string for query
        String strTotalCountQuery = "SELECT COUNT(u) from UserDonation u " +
                "WHERE donation.id = :donationId";
        String strUserDonationQuery = "FROM UserDonation WHERE donation.id = :donationId";
        if (status != 10) {
            strTotalCountQuery += " AND status = :status";
            strUserDonationQuery += " AND status = :status";
        }
        strUserDonationQuery += " ORDER BY id DESC"; //reverse order for latest userDonations
        //create query for total count
        Query<Long> totalCountQuery = session.createQuery(strTotalCountQuery, Long.class);
        totalCountQuery.setParameter("donationId", donationId);
        if (status != 10) totalCountQuery.setParameter("status", status);
        long totalCount = totalCountQuery.getSingleResult();

        //create query for data
        Query<UserDonation> userDonationQuery = session.createQuery(strUserDonationQuery, UserDonation.class);
        userDonationQuery.setParameter("donationId", donationId);
        if (status != 10) userDonationQuery.setParameter("status", status);
        userDonationQuery.setFirstResult((pageIndex - 1) * pageSize);
        //get the result count for the page
        int resultCount = Math.min(pageSize, (int) totalCount - (pageIndex - 1) * pageSize);
        userDonationQuery.setMaxResults(resultCount);
        List<UserDonation> list = userDonationQuery.getResultList();
        return new SearchData<>((int) totalCount, list);
    }

    @Override
    public SearchData<UserDonation> getUserDonationListByUser(int userId) {
//        //get a new session
//        Session session = sessionFactory.getCurrentSession();
//        //create the query
//        Query<UserDonation> query = session.createQuery("FROM UserDonation WHERE user.id = :userID", UserDonation.class);
//        query.setParameter("userID", userId);

        return null;
    }

    @Override
    public UserDonation getUserDonation(int id) {

        //get a new session
        Session session = sessionFactory.getCurrentSession();

        //retrieve the object
        return session.get(UserDonation.class, id);
    }
}
