package com.fx23121.DonationPlatform.DAO;

import com.fx23121.DonationPlatform.Entity.Role;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoleDAOImpl implements RoleDAO {

    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public Role getRole(int roleId) {
        //get new session
        Session session = sessionFactory.getCurrentSession();
        //create query
        return session.get(Role.class, roleId);
    }
}
