package com.allhotplace.www.dao.face;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.allhotplace.www.util.DBConn;

public class VisitCountDao {
	   
	   private Connection conn = DBConn.getConnection();
	   
	   public void setVisitTotalCount() {
	      String sql = "";
	      sql += "INSERT INTO visitors (visit_date) VALUES (sysdate)";
	      
	      
	      //DB 객체
	      PreparedStatement ps = null; 
	      ResultSet rs = null;
	      
	      int cnt = -1;
	      
	   
	      //DB작업
	      try {
	         conn.setAutoCommit(false);
	         ps = conn.prepareStatement(sql);
	         
	         ps.executeUpdate();
	         
	         conn.commit();
	      } catch (SQLException e) {
	         try {
	            conn.rollback();
	         } catch (SQLException e1) {
	            // TODO Auto-generated catch block
	            e1.printStackTrace();
	         }
	         e.printStackTrace();
	      }finally {
	         try {
	            if(ps!=null) ps.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	   }
	   

	   public int getVisitTodayCount() {
	      String sql = "";
	      sql += "select count(*) from visitors";

	      //DB 객체
	      PreparedStatement ps = null; 
	      ResultSet rs = null;
	      
	      int cnt = -1;
	      
	      try {
	         //DB작업
	         ps = conn.prepareStatement(sql);
	         
	         rs = ps.executeQuery();
	         
	         rs.next();
	         
	         cnt = rs.getInt(1);
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            //DB객체 닫기
	            if(rs!=null)   rs.close();
	            if(ps!=null)   ps.close();
	            
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      
	      return cnt;
	   }

	   public int getVisitTotalCount() {
	      String sql = "";
	      sql += "select count(*) from visitors";
	      sql +=   " where substr(to_char(visit_date), 1, 9) = to_date(sysdate, 'yy/MM/dd')";

	      //DB 객체
	      PreparedStatement ps = null; 
	      ResultSet rs = null;
	      
	      int cnt = -1;
	      
	      try {
	         //DB작업
	         ps = conn.prepareStatement(sql);
	         
	         rs = ps.executeQuery();
	         
	         rs.next();
	         
	         cnt = rs.getInt(1);
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            //DB객체 닫기
	            if(rs!=null)   rs.close();
	            if(ps!=null)   ps.close();
	            
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      
	      return cnt;
	   }
}
