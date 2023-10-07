package com.fx23121.DonationPlatform.Service;

import com.fx23121.DonationPlatform.Entity.Donation;

import java.util.List;

public interface DonationService {

    List<Donation> getDonationList();

    void addDonation(Donation donation);

    List<Donation> findDonationByField(String stringQuery);

    void deleteDonation(int id);

    void updateDonation(Donation donation);

    Donation getDonation(int id);
}
