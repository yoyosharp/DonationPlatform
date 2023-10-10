package com.fx23121.DonationPlatform.DAO;

import com.fx23121.DonationPlatform.Entity.User;

import java.util.List;

public interface UserDAO {
    void save(User user);

    User getUserById(int id);

    List<User> getUserListByField(String stringQuery);

    List<User> getUserList();

    int getUserCount(String stringQuery);
}
