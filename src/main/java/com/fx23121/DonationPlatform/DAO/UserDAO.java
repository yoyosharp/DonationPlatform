package com.fx23121.DonationPlatform.DAO;

import com.fx23121.DonationPlatform.Entity.User;
import com.fx23121.DonationPlatform.Service.SearchData;

import java.util.List;

public interface UserDAO {
    void save(User user);

    User getUserById(int id);

    List<User> getUserList();

    SearchData<User> getUserByFields(String stringQuery, int pageSize, int pageIndex);
}
