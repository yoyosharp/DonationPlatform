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
        return userDAO.getUserList();
    }

    @Override
    @Transactional
    public void addUser(User user) {
        userDAO.save(user);
    }

    @Override
    @Transactional
    public void updateUser(User user) {
        userDAO.save(user);
    }

    @Override
    @Transactional
    public List<User> findUserByField(String stringQuery) {
        return userDAO.getUserListByField(stringQuery);
    }

    @Override
    @Transactional
    public User getUserByEmailAndPassword(String userEmail, String userPassword) {
        List<User> userList = userDAO.getUserList();

        for (User user: userList){
            if (user.getEmail().equals(userEmail)) {
                if (user.getPassword().equals(userPassword)) return user;
                else return null;
            }
        }
        return null;
    }
}
