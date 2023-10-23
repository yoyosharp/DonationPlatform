package com.fx23121.DonationPlatform.DAO;

import com.fx23121.DonationPlatform.Entity.Donation;
import com.fx23121.DonationPlatform.Service.SearchData;

public interface DonationDAO {

    void saveOrUpdate(Donation donation);

    Donation getDonation(int id);


    void delete(int id);


    SearchData<Donation> getDonationByField(String stringQuery, int pageSize, int pageIndex, int status);
}
