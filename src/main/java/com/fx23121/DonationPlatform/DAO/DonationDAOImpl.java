package com.fx23121.DonationPlatform.DAO;

import com.fx23121.DonationPlatform.Entity.Donation;
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
public class DonationDAOImpl implements DonationDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void saveOrUpdate(Donation donation) {
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
    public void delete(int id) {
        //get a new session
        Session session = sessionFactory.getCurrentSession();
        //get the donation from database
        Donation donation = session.get(Donation.class, id);
        //remove the donation
        session.remove(donation);
    }

    @Override
    public SearchData<Donation> getDonationByField(String stringQuery, int pageSize, int pageIndex, int status) {
        //get a new session
        Session session = sessionFactory.getCurrentSession();

        //create txt queries
        String strQuery = "%" + stringQuery + "%";
        String strResultCountQuery = "SELECT COUNT(d) FROM Donation d WHERE (name LIKE :stringQuery " +
                "OR code LIKE :stringQuery " +
                "OR organizationName LIKE :stringQuery " +
                "OR phoneNumber LIKE :stringQuery) " +
                "AND status != -1";

        String strDonationQuery = "FROM Donation WHERE (name LIKE :stringQuery " +
                "OR code LIKE :stringQuery " +
                "OR organizationName LIKE :stringQuery " +
                "OR phoneNumber LIKE :stringQuery) " +
                "AND status != -1";

        if (status != 10) {
            strResultCountQuery += " AND status = :status";
            strDonationQuery += " AND status = :status";
        }
        strDonationQuery += " ORDER BY id DESC";
        //get total result count
        Query<Long> resultCountQuery = session.createQuery(strResultCountQuery, Long.class);
        resultCountQuery.setParameter("stringQuery", strQuery);
        if (status != 10) resultCountQuery.setParameter("status", status);
        long totalCount = resultCountQuery.getSingleResult();

        //calculate the number of result
        int resultCount = (int) Math.min(totalCount - (pageIndex - 1) * pageSize, pageSize);
        //query the result
        Query<Donation> donationQuery = session.createQuery(strDonationQuery, Donation.class);
        donationQuery.setParameter("stringQuery", strQuery);
        if (status != 10) donationQuery.setParameter("status", status);
        donationQuery.setFirstResult((pageIndex - 1) * pageSize);
        donationQuery.setMaxResults(resultCount);

        List<Donation> list = donationQuery.getResultList();
        return new SearchData<>((int) totalCount, list);
    }

}
