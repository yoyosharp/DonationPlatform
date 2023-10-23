package com.fx23121.DonationPlatform.Service;

import com.fx23121.DonationPlatform.Entity.User;

public interface UserService {

    void addUser(User toAddUser);

    void updateUser(User user);

    SearchData<User> getUserByFields(String stringQuery, int pageSize, int PageIndex);

    User getUserByEmailAndPassword(String userEmail, String userPassword);

    User getUserById(int currentUserId);

    void deleteUser(int currentUserId);

    void lockUser(int currentUserId);

    void unlockUser(int currentUserId);
}
