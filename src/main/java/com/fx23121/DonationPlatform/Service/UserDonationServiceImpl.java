package com.fx23121.DonationPlatform.Service;

import com.fx23121.DonationPlatform.DAO.DonationDAO;
import com.fx23121.DonationPlatform.DAO.UserDAO;
import com.fx23121.DonationPlatform.DAO.UserDonationDAO;
import com.fx23121.DonationPlatform.Entity.Donation;
import com.fx23121.DonationPlatform.Entity.User;
import com.fx23121.DonationPlatform.Entity.UserDonation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Service
public class UserDonationServiceImpl implements UserDonationService {

    @Autowired
    private UserDonationDAO userDonationDAO;
    @Autowired
    private DonationDAO donationDAO;
    @Autowired
    private UserDAO userDao;

    @Override
    @Transactional
    public void addUserDonation(UserDonation userDonation) {

        //get the current user form database
        User currentUser = userDao.getUserById(userDonation.getUser().getId());
        userDonation.setUser(currentUser);
        //get the current donation from database
        Donation currentDonation = donationDAO.getDonation(userDonation.getDonation().getId());
        userDonation.setDonation(currentDonation);
        //if the name get from webpage is empty, set name to currentUser name
        if (userDonation.getName().isEmpty()) userDonation.setName(currentUser.getFullName());
        //add metadata
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        userDonation.setCreateAt(formatter.format(LocalDateTime.now()));
        //set status to waiting confirmation
        userDonation.setStatus(0);

        userDonationDAO.saveUserDonation(userDonation);
    }

    @Override
    @Transactional
    public SearchData<UserDonation> getUserDonationByUser(int userId) {
        return userDonationDAO.getUserDonationListByUser(userId);
    }

    @Override
    @Transactional
    public SearchData<UserDonation> getUserDonationByDonation(int donationId, int pageSize, int pageIndex, int status) {

        return userDonationDAO.getUserDonationListByDonation(donationId, pageSize, pageIndex, status);
    }

    @Override
    @Transactional
    public void confirm(int userDonationId) {
        //set the status
        UserDonation currentUserDonation = userDonationDAO.getUserDonation(userDonationId);
        currentUserDonation.setStatus(1);

        //update donation fund
        Donation currentDonation = currentUserDonation.getDonation();
        currentDonation.setFund(currentDonation.getFund() + currentUserDonation.getMoney());

        userDonationDAO.saveUserDonation(currentUserDonation);

    }

    @Override
    @Transactional
    public void reject(int userDonationId) {
        //set the status
        UserDonation currentUserDonation = userDonationDAO.getUserDonation(userDonationId);
        currentUserDonation.setStatus(-1);
        userDonationDAO.saveUserDonation(currentUserDonation);

    }
}
