package com.fx23121.DonationPlatform.Service;

import com.fx23121.DonationPlatform.DAO.DonationDAO;
import com.fx23121.DonationPlatform.Entity.Donation;
import com.fx23121.DonationPlatform.SearchData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DonationServiceImpl implements DonationService {

    @Autowired
    private DonationDAO donationDao;

    //get all the donations

    @Override
    @Transactional
    public void addDonation(Donation donation) {
        donationDao.saveOrUpdate(donation);
    }

    //find donations which have fields contain stringQuery


    //no validate when delete donation because this method will always be called from
    //a validated context( i.e a queried donation list)
    @Override
    @Transactional
    public void deleteDonation(int id) {
        donationDao.delete(id);
    }

    //no validate when update donation because this method will always be called from
    //a validated context( i.e a queried donation list)
    @Override
    @Transactional
    public void updateDonation(Donation donation) {
        donationDao.saveOrUpdate(donation);
    }

    @Override
    @Transactional
    public Donation getDonation(int id) {
        return donationDao.getDonation(id);
    }

    @Override
    public SearchData<Donation> getDonationByField(String stringQuery, int pageSize, int pageIndex) {
        return null;
    }
}
