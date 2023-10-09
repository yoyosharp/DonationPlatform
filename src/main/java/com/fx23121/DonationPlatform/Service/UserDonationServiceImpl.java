package com.fx23121.DonationPlatform.Service;

import com.fx23121.DonationPlatform.DAO.UserDonationDAO;
import com.fx23121.DonationPlatform.Entity.UserDonation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserDonationServiceImpl implements UserDonationService {

    @Autowired
    private UserDonationDAO userDonationDAO;

    @Override
    @Transactional
    public void addUserDonation(UserDonation userDonation) {
        userDonationDAO.saveUserDonation(userDonation);
    }

    @Override
    @Transactional
    public List<UserDonation> getUserDonationByUser(int userId) {
        return userDonationDAO.getUserDonationListByUser(userId);
    }

    @Override
    @Transactional
    public List<UserDonation> getUserDonationByDonation(int donationId) {

        return userDonationDAO.getUserDonationListByDonation(donationId);
    }
}
