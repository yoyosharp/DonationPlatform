package com.fx23121.DonationPlatform.Demo;

import com.fx23121.DonationPlatform.Entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

@Repository
@EnableTransactionManagement
public class testDAO {

    @Autowired
     private SessionFactory sessionFactory;

    @Transactional
     public User getUser(int id) {
        Session session = sessionFactory.getCurrentSession();

        User user = session.get(User.class, id);
        System.out.println(user);
        return user;
    }
}