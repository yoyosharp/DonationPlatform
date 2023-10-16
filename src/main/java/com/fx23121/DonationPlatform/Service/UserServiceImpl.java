package com.fx23121.DonationPlatform.Service;

import com.fx23121.DonationPlatform.DAO.RoleDAO;
import com.fx23121.DonationPlatform.DAO.UserDAO;
import com.fx23121.DonationPlatform.Entity.Role;
import com.fx23121.DonationPlatform.Entity.User;
import com.fx23121.DonationPlatform.SearchData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDAO userDAO;

    @Autowired
    private RoleDAO roleDAO;

    @Override
    @Transactional
    public void addUser(User toAddUser) {
        userDAO.save(toAddUser);
    }

    @Override
    @Transactional
    public void updateUser(User user) {
        userDAO.save(user);
    }

    @Override
    @Transactional
    public SearchData<User> getUserByFields(String stringQuery, int pageSize, int pageIndex) {
        return userDAO.getUserByFields(stringQuery, pageSize, pageIndex);
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

    @Override
    @Transactional
    public User getUserById(int currentUserId) {
        return userDAO.getUserById(currentUserId);
    }

    @Override
    @Transactional
    public void deleteUser(int currentUserId) {
        User currentUser = userDAO.getUserById(currentUserId);
        currentUser.setStatus(-1);
        userDAO.save(currentUser);
    }

    @Override
    @Transactional
    public void lockUser(int currentUserId) {
        User currentUser = userDAO.getUserById(currentUserId);
        currentUser.setStatus(0);
        userDAO.save(currentUser);
    }

    @Override
    @Transactional
    public void unlockUser(int currentUserId) {
        User currentUser = userDAO.getUserById(currentUserId);
        currentUser.setStatus(1);
        userDAO.save(currentUser);
    }

}
