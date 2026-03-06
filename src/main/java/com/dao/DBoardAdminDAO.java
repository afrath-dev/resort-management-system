package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBoardAdminDAO {

    private Connection conn;

    public DBoardAdminDAO(Connection conn) {
        this.conn = conn;
    }

    public int getUserCount() {

        int count = 0;

        try {
            String sql = "SELECT COUNT(*) FROM user_dtls";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    public int getReservationCount() {

        int count = 0;

        try {
            String sql = "SELECT COUNT(*) FROM reservation";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }
}