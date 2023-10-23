package com.fx23121.DonationPlatform.Entity;

import javax.persistence.*;

@Entity
@Table(name = "user_donation")
public class UserDonation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "created")
    private String createAt;

    @Column(name = "money")
    private Integer money;

    @Column(name = "name")
    private String name;

    @Column(name = "status")
    private int status;

    @Column(name = "text")
    private String text;

    @ManyToOne(cascade = {CascadeType.REFRESH, CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "donation_id")
    private Donation donation;

    @ManyToOne(cascade = {CascadeType.REFRESH, CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "user_id")
    private User user;

    //Constructors

    public UserDonation() {
    }

    public UserDonation(String createAt, int money, String name, int status, String text) {
        this.createAt = createAt;
        this.money = money;
        this.name = name;
        this.status = status;
        this.text = text;
    }
    //getters/setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Donation getDonation() {
        return donation;
    }

    public void setDonation(Donation donation) {
        this.donation = donation;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "UserDonation{" +
                "id=" + id +
                ", createAt='" + createAt + '\'' +
                ", money=" + money +
                ", name='" + name + '\'' +
                ", donation=" + donation +
                ", user=" + user +
                '}';
    }
}
