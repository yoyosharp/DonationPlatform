package com.fx23121.DonationPlatform.Service;

import com.fx23121.DonationPlatform.DAO.UserDonationDAO;
import com.fx23121.DonationPlatform.Entity.UserDonation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserDonationServiceImpl implements UserDonationService {

    @Autowired
    private UserDonationDAO userDonationDAO;

    @Override
    @Transactional
    public void addUserDonation(UserDonation userDonation) {

    }

    @Override
    @Transactional
    public void getUserDonationByUser(int userId) {

    }

    @Override
    @Transactional
    public void getUserDonationByDonation(int donationId) {

    }
}
