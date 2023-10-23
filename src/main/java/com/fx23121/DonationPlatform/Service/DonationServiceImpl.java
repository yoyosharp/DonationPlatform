package com.fx23121.DonationPlatform.Service;

import com.fx23121.DonationPlatform.DAO.DonationDAO;
import com.fx23121.DonationPlatform.Entity.Donation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Service
public class DonationServiceImpl implements DonationService {

    @Autowired
    private DonationDAO donationDao;

//    private String[] status = new String[]{"Mới", "Mới tạo", "Đang", "Đang quyên", "Đang quyên góp",
//            "Dừng", "Dừng quyên", "Dừng quyên góp", "đóng", "Đã đóng"};

    @Override
    @Transactional
    public void addDonation(Donation donation) {
        //set some data and save to the database
        donation.setFund(0);
        donation.setStatus(0);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        donation.setCreatedAt(formatter.format(LocalDateTime.now()));
        if (donation.getStartDate().isEmpty()) donation.setStartDate(formatter.format(LocalDateTime.now()));
        donationDao.saveOrUpdate(donation);
    }

    //find donations which have fields contain stringQuery


    //for delete set status = -1
    @Override
    @Transactional
    public void deleteDonation(int id) {
        Donation currentDonation = donationDao.getDonation(id);
        currentDonation.setStatus(-1);
        donationDao.saveOrUpdate(currentDonation);
    }

    //no validate when update donation because this method will always be called from
    //a validated context( i.e a queried donation list)
    @Override
    @Transactional
    public void updateDonation(Donation donation) {
        //retrieve donation from the database
        Donation currentDonation = donationDao.getDonation(donation.getId());
        //set the data to the current donation
        currentDonation.setCode(donation.getCode());
        currentDonation.setName(donation.getName());

        if (!donation.getEndDate().isEmpty()) currentDonation.setEndDate(donation.getEndDate());
        if (donation.getTargetMoney() != null) currentDonation.setTargetMoney(donation.getTargetMoney());

        currentDonation.setOrganizationName(donation.getOrganizationName());
        currentDonation.setPhoneNumber(donation.getPhoneNumber());
        currentDonation.setDescription(donation.getDescription());

        donationDao.saveOrUpdate(currentDonation);
    }

    @Override
    @Transactional
    public Donation getDonation(int id) {
        return donationDao.getDonation(id);
    }

    @Override
    @Transactional
    public SearchData<Donation> getDonationByField(String stringQuery, int pageSize, int pageIndex, int status) {

        return donationDao.getDonationByField(stringQuery, pageSize, pageIndex, status);
    }

    @Override
    @Transactional
    public void startDonation(int id) {
        Donation currentDonation = donationDao.getDonation(id);
        currentDonation.setStatus(1);
        donationDao.saveOrUpdate(currentDonation);
    }

    @Override
    @Transactional
    public void stopDonation(int id) {
        Donation currentDonation = donationDao.getDonation(id);
        currentDonation.setStatus(2);
        donationDao.saveOrUpdate(currentDonation);
    }

    @Override
    @Transactional
    public void closeDonation(int id) {
        Donation currentDonation = donationDao.getDonation(id);
        currentDonation.setStatus(3);
        donationDao.saveOrUpdate(currentDonation);
    }
}
