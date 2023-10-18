package com.fx23121.DonationPlatform.DAO;

import com.fx23121.DonationPlatform.Entity.Role;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

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

    @Override
    public List<Role> getRoles() {
        //get new session
        Session session = sessionFactory.getCurrentSession();
        //create query
        Query<Role> query = session.createQuery("FROM Role", Role.class);
        return query.getResultList();
    }
}
