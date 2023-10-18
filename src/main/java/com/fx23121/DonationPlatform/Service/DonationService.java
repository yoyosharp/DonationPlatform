package com.fx23121.DonationPlatform.Service;

import com.fx23121.DonationPlatform.Entity.Donation;
import com.fx23121.DonationPlatform.SearchData;

public interface DonationService {

    void addDonation(Donation donation);

    void deleteDonation(int id);

    void updateDonation(Donation donation);

    Donation getDonation(int id);

    SearchData<Donation> getDonationByField(String stringQuery, int pageSize, int pageIndex, int status);
}
