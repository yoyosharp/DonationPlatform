package com.fx23121.DonationPlatform.Service;

import com.fx23121.DonationPlatform.Entity.User;

import java.util.List;

public interface UserService {
    List<User> getUsers();

    void addUser(User user);

    void updateUser(int id);

    List<User> findUserByField(String stringQuery);
}
