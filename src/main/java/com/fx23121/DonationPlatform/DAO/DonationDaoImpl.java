package com.fx23121.DonationPlatform.DAO;

import com.fx23121.DonationPlatform.Entity.Donation;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.util.List;

@Repository
@EnableTransactionManagement
public class DonationDaoImpl implements DonationDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void save(Donation donation) {
        //get a new session
        Session session = sessionFactory.getCurrentSession();
        //save the object
        session.saveOrUpdate(donation);
    }

    @Override
    public Donation getDonation(int id) {
        //get a new session
        Session session = sessionFactory.getCurrentSession();
        //get donation
        return session.get(Donation.class, id);
    }

    @Override
    public List<Donation> getDonationList() {
        //get a new session
        Session session = sessionFactory.getCurrentSession();
        //create query
        Query<Donation> query = session.createQuery("FROM Donation", Donation.class);
        return query.getResultList();
    }

    @Override
    public void delete(int id) {
        //get a new session
        Session session = sessionFactory.getCurrentSession();
        //get the donation from database
        Donation donation = session.get(Donation.class, id);
        //remove the donation
        session.remove(donation);
    }
}
