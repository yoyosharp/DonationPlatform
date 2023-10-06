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
    private String createdAt;

    @Column(name = "money")
    private String money;

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

}
