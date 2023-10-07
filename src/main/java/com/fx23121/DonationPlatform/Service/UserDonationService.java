package com.fx23121.DonationPlatform.Service;

import com.fx23121.DonationPlatform.Entity.UserDonation;

public interface UserDonationService {

    void addUserDonation(UserDonation userDonation);

    void getUserDonationByUser(int userId);

    void getUserDonationByDonation(int donationId);
}
