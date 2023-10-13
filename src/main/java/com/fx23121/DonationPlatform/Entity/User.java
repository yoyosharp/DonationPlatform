package com.fx23121.DonationPlatform.Entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Table(name = "user")
public class User {

    //Define fields

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "user_name", unique = true)
    @NotNull(message = "User name cannot be empty")
    @Size(min = 1, message = "User name cannot be empty")
    private String userName;

    @Column(name = "password")
    @NotNull(message = "Must have a password")
    @Size(min = 4, message = "Password must have at least 4 characters")
    private String password;

    @Column(name = "full_name")
    @NotNull(message = "Name cannot be empty")
    @Size(min = 1, message = "Name cannot be empty")
    private String fullName;

    @Column(name = "address")
    @NotNull(message = "Address cannot be empty")
    @Size(min = 1, message = "Address cannot be empty")
    private String address;

    @Column(name = "email")
    @NotNull(message = "Email cannot be empty")
    @Pattern(regexp = "^[A-Z0-9+_.-]+@[A-Z0-9.-]+$", message = "Not an email address")
    @Size(min = 1, message = "Email cannot be empty")
    private String email;

    @Column(name = "phone_number")
    @NotNull(message = "Phone number cannot be empty")
    @Size(min = 1, message = "Phone number cannot be empty")
    @Pattern(regexp = "^[0-9]", message = "Wrong phone number format")
    private String phoneNumber;

    @Column(name = "note")
    private String note;

    @Column(name = "created")
    private String createdAt;

    @Column(name = "status")
    private int status;

    @ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH })
    @JoinColumn(name = "role_id")
    private Role roleId;

    @OneToMany(mappedBy = "user",
            cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH })
    private List<UserDonation> userDonationList;

    //Define constructors

    public User() {
    }

    public User(String userName, String password, String fullName, String address, String email, String phoneNumber, String note, String createdAt) {
        this.userName = userName;
        this.password = password;
        this.fullName = fullName;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.note = note;
        this.createdAt = createdAt;
        this.status = 1;
    }

    //define getters/setters


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public Role getRoleId() {
        return roleId;
    }

    public void setRoleId(Role roleId) {
        this.roleId = roleId;
    }

    public List<UserDonation> getUserDonationList() {
        return userDonationList;
    }

    public void setUserDonationList(List<UserDonation> userDonationList) {
        this.userDonationList = userDonationList;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    //define toString()
    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", fullName='" + fullName + '\'' +
                ", createdAt='" + createdAt + '\'' +
                ", status=" + status + '\'' +
                ", roleID=" + roleId +
                '}';
    }
}
