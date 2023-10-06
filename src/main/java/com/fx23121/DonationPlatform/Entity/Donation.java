package com.fx23121.DonationPlatform.Entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "donation")
public class Donation {

    //define fields
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "code")
    private String code;

    @Column(name = "created")
    private String createdAt;

    @Column(name = "description")
    private String description;

    @Column(name = "end_date")
    private String endDate;

    @Column(name = "money")
    private int targetMoney;

    @Column(name = "fund")
    private int fund;

    @Column(name = "organization_name")
    private String organizationName;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "start_date")
    private String startDate;

    @Column(name = "status")
    private int status;

    @OneToMany(mappedBy = "donation",
            cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH })
    private List<UserDonation> userDonationList;

    //define constructors

    public Donation() {
    }

    public Donation(String name, String code, String createdAt, String description, String endDate, int targetMoney, int fund, String organizationName, String phoneNumber, String startDate, int status) {
        this.name = name;
        this.code = code;
        this.createdAt = createdAt;
        this.description = description;
        this.endDate = endDate;
        this.targetMoney = targetMoney;
        this.fund = fund;
        this.organizationName = organizationName;
        this.phoneNumber = phoneNumber;
        this.startDate = startDate;
        this.status = status;
    }

    //define getters/setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public int getTargetMoney() {
        return targetMoney;
    }

    public void setTargetMoney(int targetMoney) {
        this.targetMoney = targetMoney;
    }

    public int getFund() {
        return fund;
    }

    public void setFund(int fund) {
        this.fund = fund;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public List<UserDonation> getUserDonationList() {
        return userDonationList;
    }

    public void setUserDonationList(List<UserDonation> userDonationList) {
        this.userDonationList = userDonationList;
    }

    //define toString()
    @Override
    public String toString() {
        return "Donation{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", code='" + code + '\'' +
                ", createdAt='" + createdAt + '\'' +
                ", status=" + status +
                '}';
    }
}
