package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAO {

	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public int register(User u) {

	    int userId = -1;

	    try {
	        String sql = "INSERT INTO user_dtls(full_name,email,password) VALUES(?,?,?)";
	        PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

	        ps.setString(1, u.getFullName());
	        ps.setString(2, u.getEmail());
	        ps.setString(3, u.getPassword());

	        int i = ps.executeUpdate();

	        if (i == 1) {
	            ResultSet rs = ps.getGeneratedKeys();
	            if (rs.next()) {
	                userId = rs.getInt(1);
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return userId;
	}
	
	public User login(String email, String password) {

	    User user = null;

	    try {
	        String sql = "SELECT * FROM user_dtls WHERE email=? AND password=?";
	        PreparedStatement ps = conn.prepareStatement(sql);

	        ps.setString(1, email);
	        ps.setString(2, password);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            user = new User();
	            user.setId(rs.getInt("id"));
	            user.setFullName(rs.getString("full_name"));
	            user.setEmail(rs.getString("email"));
	            user.setPassword(rs.getString("password"));
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return user;
	}
}
