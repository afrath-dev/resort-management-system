package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.entity.AdminReservationView;

public class AdminDAO {

    private Connection conn;

    public AdminDAO(Connection conn) {
        this.conn = conn;
    }

    // ==============================
    // 1️⃣ Get Total Users Count
    // ==============================
    public int getUserCount() {

        int count = 0;
        String sql = "SELECT COUNT(*) FROM user_dtls";

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    // ==============================
    // 2️⃣ Get Total Reservations Count
    // ==============================
    public int getReservationCount() {

        int count = 0;
        String sql = "SELECT COUNT(*) FROM reservation";

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    // ==============================
    // 3️⃣ Admin Login Validation
    // ==============================
    public boolean login(String email, String password) {

        boolean isValid = false;
        String sql = "SELECT * FROM admin_dtls WHERE email=? AND password=?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    isValid = true;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isValid;
    }

    // ==============================
    // 4️⃣ Get All Reservation Details (JOIN)
    // ==============================
    public List<AdminReservationView> getAllReservations() {

        List<AdminReservationView> list = new ArrayList<>();

        String sql = "SELECT u.full_name, r.address, r.contact_no, "
                   + "r.room_type, r.check_in, r.check_out, r.status "
                   + "FROM reservation r "
                   + "JOIN user_dtls u ON r.user_id = u.id "
                   + "ORDER BY r.check_in DESC";

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                String fullName = rs.getString("full_name");
                String address = rs.getString("address");
                String contactNo = rs.getString("contact_no");
                String roomType = rs.getString("room_type");
                Date checkIn = rs.getDate("check_in");
                Date checkOut = rs.getDate("check_out");
                String status = rs.getString("status");

                AdminReservationView view = new AdminReservationView(
                        fullName,
                        address,
                        contactNo,
                        roomType,
                        checkIn,
                        checkOut,
                        status
                );

                list.add(view);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}