package com.massz.bean;

public class User {

    private int UserId;
    private String username;
    private String password;
    private String gender;
    private String email;
    private String registrationTime;

    private String userType;

    private String Bio;

    public User() {
    }

    public User(int userId, String username, String password, String gender, String email, String registrationTime, String userType, String bio) {
        UserId = userId;
        this.username = username;
        this.password = password;
        this.gender = gender;
        this.email = email;
        this.registrationTime = registrationTime;
        this.userType = userType;
        Bio = bio;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int userId) {
        UserId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRegistrationTime() {
        return registrationTime;
    }

    public void setRegistrationTime(String registrationTime) {
        this.registrationTime = registrationTime;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getBio() {
        return Bio;
    }

    public void setBio(String bio) {
        Bio = bio;
    }
}

