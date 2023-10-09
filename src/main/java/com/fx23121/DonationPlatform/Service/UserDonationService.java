package com.fx23121.DonationPlatform.Service;

import com.fx23121.DonationPlatform.Entity.UserDonation;

import java.util.List;

public interface UserDonationService {

    void addUserDonation(UserDonation userDonation);

    List<UserDonation> getUserDonationByUser(int userId);

    List<UserDonation> getUserDonationByDonation(int donationId);
}
