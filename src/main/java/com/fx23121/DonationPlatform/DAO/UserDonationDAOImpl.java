package com.fx23121.DonationPlatform.DAO;

import com.fx23121.DonationPlatform.Entity.Donation;
import com.fx23121.DonationPlatform.Entity.User;
import com.fx23121.DonationPlatform.Entity.UserDonation;
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
    public List<UserDonation> getUserDonationListByDonation(int donationiD) {
        //get a new session
        Session session = sessionFactory.getCurrentSession();
        //create the query
        Query<UserDonation> query = session.createQuery("FROM UserDonation WHERE donation.id = :donationId", UserDonation.class);
        query.setParameter("donationId", donationiD);

        return query.getResultList();
    }

    @Override
    public List<UserDonation> getUserDonationListByUser(int userId) {
        //get a new session
        Session session = sessionFactory.getCurrentSession();
        //create the query
        Query<UserDonation> query = session.createQuery("FROM UserDonation WHERE user.id = :userID", UserDonation.class);
        query.setParameter("userID", userId);

        return query.getResultList();
    }
}
