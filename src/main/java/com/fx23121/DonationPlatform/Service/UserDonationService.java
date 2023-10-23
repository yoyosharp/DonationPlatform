package com.fx23121.DonationPlatform.Service;

import com.fx23121.DonationPlatform.Entity.UserDonation;

public interface UserDonationService {

    void addUserDonation(UserDonation userDonation);

    SearchData<UserDonation> getUserDonationByUser(int userId);

    SearchData<UserDonation> getUserDonationByDonation(int donationId, int pageSize, int pageIndex, int status);

    void confirm(int userDonationId);

    void reject(int userDonationId);
}
