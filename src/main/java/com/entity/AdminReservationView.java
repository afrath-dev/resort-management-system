package com.entity;

import java.sql.Date;

public class AdminReservationView {

    private String fullName;
    private String address;
    private String contactNo;
    private String roomType;
    private Date checkIn;
    private Date checkOut;
    private String status;

    public AdminReservationView(String fullName, String address,
            String contactNo, String roomType,
            Date checkIn, Date checkOut, String status) {

        this.fullName = fullName;
        this.address = address;
        this.contactNo = contactNo;
        this.roomType = roomType;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.status = status;
    }

    public String getFullName() { return fullName; }
    public String getAddress() { return address; }
    public String getContactNo() { return contactNo; }
    public String getRoomType() { return roomType; }
    public Date getCheckIn() { return checkIn; }
    public Date getCheckOut() { return checkOut; }
    public String getStatus() { return status; }
}