package com.fx23121.DonationPlatform.DAO;

import com.fx23121.DonationPlatform.Entity.Donation;
import com.fx23121.DonationPlatform.Entity.User;
import com.fx23121.DonationPlatform.Entity.UserDonation;

import java.util.List;

public interface UserDonationDAO {

    void saveUserDonation(UserDonation userDonation);

    List<UserDonation> getUserDonationListByDonation(Donation donation);

    List<UserDonation> getUserDonationListByUser(User user);
}
