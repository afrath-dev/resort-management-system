package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Reservation;

public class ReservationDAO {

    private Connection conn;

    public ReservationDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean saveReservation(Reservation r) {

        boolean f = false;

        try {
            String sql = "INSERT INTO reservation(user_id,address,contact_no,room_type,check_in,check_out) VALUES(?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, r.getUserId());
            ps.setString(2, r.getAddress());
            ps.setString(3, r.getContactNo());
            ps.setString(4, r.getRoomType());
            ps.setDate(5, r.getCheckIn());
            ps.setDate(6, r.getCheckOut());

            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }


    /* ================= USER DASHBOARD METHOD ================= */

    public List<Reservation> getReservationsByUser(int userId){

        List<Reservation> list = new ArrayList<>();

        try{

            String sql = "SELECT * FROM reservation WHERE user_id=? ORDER BY check_in DESC";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Reservation r = new Reservation();

                r.setId(rs.getInt("res_num"));
                r.setRoomType(rs.getString("room_type"));

                java.sql.Date checkInDate = rs.getDate("check_in");
                r.setCheckIn(checkInDate);

                r.setCheckOut(rs.getDate("check_out"));

                String status = rs.getString("status");

                java.sql.Date today = new java.sql.Date(System.currentTimeMillis());

                if(checkInDate.before(today) && status.equals("Pending")){
                    updateStatus(rs.getInt("res_num"), "Cancelled");
                    status = "Cancelled";
                }

                r.setStatus(status);

                list.add(r);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }
    
    /* ================= UPDATE STATUS ================= */
    
    public boolean cancelReservation(int resNum){

        boolean f = false;

        try{

        	String sql = "UPDATE reservation SET status='Cancelled' WHERE res_num=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, resNum);

            int i = ps.executeUpdate();

            if(i==1){
                f = true;
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return f;
    }
    
    /* ================= PAYMENT ================= */
    
    public Reservation getReservationById(int id){

        Reservation r = null;

        try{

            String sql = "SELECT * FROM reservation WHERE res_num=?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                r = new Reservation();

                r.setId(rs.getInt("res_num"));
                r.setRoomType(rs.getString("room_type"));
                r.setCheckIn(rs.getDate("check_in"));
                r.setCheckOut(rs.getDate("check_out"));

            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return r;
    }
    
    public boolean updateStatus(int id, String status){

        boolean f=false;

        try{

            String sql="UPDATE reservation SET status=? WHERE res_num=?";

            PreparedStatement ps=conn.prepareStatement(sql);

            ps.setString(1,status);
            ps.setInt(2,id);

            int i=ps.executeUpdate();

            if(i==1)
                f=true;

        }catch(Exception e){
            e.printStackTrace();
        }

        return f;
    }
}