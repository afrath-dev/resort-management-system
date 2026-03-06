package com.entity;

import java.sql.Date;

public class Reservation {

    private int id;
    private int userId;
    private String address;
    private String contactNo;
    private String roomType;
    private Date checkIn;
    private Date checkOut;
    private String status;

    // Empty constructor (Required for DAO)
    public Reservation() {
    }

    // Constructor used when saving reservation
    public Reservation(int userId, String address, String contactNo,
                       String roomType, Date checkIn, Date checkOut) {
        this.userId = userId;
        this.address = address;
        this.contactNo = contactNo;
        this.roomType = roomType;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
    }

    // ===== Getters & Setters =====

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }


    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }


    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }


    public Date getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(Date checkIn) {
        this.checkIn = checkIn;
    }


    public Date getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(Date checkOut) {
        this.checkOut = checkOut;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}