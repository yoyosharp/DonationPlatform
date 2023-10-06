package com.fx23121.DonationPlatform.DAO;

import com.fx23121.DonationPlatform.Entity.Donation;

import java.util.List;

public interface DonationDao {

    void save(Donation donation);

    Donation getDonation(int id);

    List<Donation> getDonationList();

    void delete(int id);
}
