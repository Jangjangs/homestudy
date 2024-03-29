package com.google.mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/security-context.xml"})

@Log4j
public class MemberTests {
	
	@Setter(onMethod_= @Autowired )
	private PasswordEncoder passwordEncoder; 
	
	@Setter(onMethod_= @Autowired )
	private DataSource dataSource;
	
	//@Test
	public void testInsertMember() {
		String sql = " insert into tbl_member(userid, userpw, username) values(?,?,?) ";
		
		for(int i=0; i<100; i++) {
			Connection conn = null;
			PreparedStatement stmt = null;
			try {
				conn = dataSource.getConnection();
				stmt = conn.prepareStatement(sql);
				
				if(i<80) {
					stmt.setString(1, "user"+i);
					stmt.setString(2, passwordEncoder.encode("pw"+i));
					stmt.setString(3, "일반사용자"+i);
				} else if(i<90) {
					stmt.setString(1, "manager"+i);
					stmt.setString(2, passwordEncoder.encode("pw"+i));
					stmt.setString(3, "운영자"+i);
				} else {
					stmt.setString(1, "admin"+i);
					stmt.setString(2, passwordEncoder.encode("pw"+i));
					stmt.setString(3, "관리자"+i);
				}
				
				stmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					if (stmt != null)	stmt.close();
					if (conn != null)	conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	@Test
	public void testInsertAuth() {
		String sql = " insert into tbl_member_auth (userid, auth) values (?,?) ";
		
		for(int i=0; i<100; i++) {
			Connection conn = null;
			PreparedStatement stmt = null;
			try {
				conn = dataSource.getConnection();
				stmt = conn.prepareStatement(sql);
				
				if(i<80) {
					stmt.setString(1, "user"+i);
					stmt.setString(2, "ROLE_USER");
				} else if(i<90) {
					stmt.setString(1, "manager"+i);
					stmt.setString(2, "ROLE_MEMBER");
				} else {
					stmt.setString(1, "admin"+i);
					stmt.setString(2, "ROLE_ADMIN");
				}
				
				stmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					if (stmt != null)	stmt.close();
					if (conn != null)	conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
}
