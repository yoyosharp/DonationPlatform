package com.fx23121.DonationPlatform.Service;

import com.fx23121.DonationPlatform.DAO.UserDAO;
import com.fx23121.DonationPlatform.Entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDAO userDAO;

    @Override
    @Transactional
    public List<User> getUsers() {
        return null;
    }

    @Override
    @Transactional
    public void addUser(User user) {

    }

    @Override
    @Transactional
    public void updateUser(int id) {

    }

    @Override
    @Transactional
    public List<User> findUserByField(String stringQuery) {
        return null;
    }
}
