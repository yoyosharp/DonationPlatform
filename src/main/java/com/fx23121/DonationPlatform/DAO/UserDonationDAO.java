package com.fx23121.DonationPlatform.DAO;

import com.fx23121.DonationPlatform.Entity.UserDonation;
import com.fx23121.DonationPlatform.Service.SearchData;

public interface UserDonationDAO {

    void saveUserDonation(UserDonation userDonation);

    SearchData<UserDonation> getUserDonationListByDonation(int donationId, int pageSize, int pageIndex, int status);

    SearchData<UserDonation> getUserDonationListByUser(int userId);

    UserDonation getUserDonation(int id);
}
