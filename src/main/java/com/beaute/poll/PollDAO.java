package com.beaute.poll;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import com.beaute.dbcp.DBConnectionMgr;
import com.beaute.member.MemberVO;

public class PollDAO {
	
	private DBConnectionMgr pool;
	
	public PollDAO() {
		try { pool = DBConnectionMgr.getInstance(); }
		catch(Exception e) { e.printStackTrace(); }
	}
	
	public int getMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int maxNum = 0;
		
		try {
			con = pool.getConnection();
			sql = "select max(num) from btPollList";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				maxNum = rs.getInt(1);
			}
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt, rs); }
		
		return maxNum;
	}
	
	public boolean insertPoll(PollListVO pvo, PollItemVO ivo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert into btPollList (question,sdate,edate,wdate,type)"
					+ "values (?,?,?,now(),?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pvo.getQuestion());
			pstmt.setString(2, pvo.getSdate());
			pstmt.setString(3, pvo.getEdate());
			pstmt.setInt(4, pvo.getType());
			
			if(pstmt.executeUpdate() == 1) {
				sql = "insert into btPollItem values (?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				int listnum = getMaxNum();
				String[] item = ivo.getItem();
				int num = 0;
				for(int i=0; i<item.length; i++) {
					if(item[i] == null || item[i].equals("")) break;
					pstmt.setInt(1, listnum); 
					pstmt.setInt(2, i); 
					pstmt.setString(3, item[i]); 
					pstmt.setInt(4, 0); 
					num = pstmt.executeUpdate(); 
				}
				
				if(num == 1) flag = true;
			}
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt); }
		
		return flag;
	}
	
	public Vector<PollListVO> getPollList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<PollListVO> vlist = new Vector<PollListVO>();
		
		try {
			con = pool.getConnection();
			sql = "select * from btPollList order by num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PollListVO pvo = new PollListVO();
				pvo.setNum(rs.getInt("num"));
				pvo.setQuestion(rs.getString("question"));
				pvo.setSdate(rs.getString("sdate"));
				pvo.setEdate(rs.getString("edate"));
				pvo.setActive(rs.getInt("active"));
				
				vlist.add(pvo);
			}
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt, rs); }
		
		return vlist;
	}
	
	public PollListVO getPoll(int num) { 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		PollListVO pvo = new PollListVO();
		
		try {
			con = pool.getConnection();
			if(num == 0) sql = "select * from btPollList order by num desc";
			else sql = "select * from btPollList where num=" + num;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { 
				pvo.setQuestion(rs.getString("question"));
				pvo.setType(rs.getInt("type"));
				pvo.setActive(rs.getInt("active"));
			}
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt, rs); }
		
		return pvo;
	}
	
	public Vector<String> getItem(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<String> itemList = new Vector<String>();
		
		try {
			con = pool.getConnection();
			sql = "select item from btPollItem where listnum=" + num;
			pstmt = con.prepareStatement(sql);
			if(num > 0) rs = pstmt.executeQuery();
			
			while(rs.next()) { 
				itemList.add(rs.getString(1));
			}
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt, rs); }
		
		return itemList;
	}
	
	public boolean updatePoll(int num, String[] itemnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "update btPollItem set count=count+1 where listnum=? and itemnum=?";
			pstmt = con.prepareStatement(sql);
			
			for(int i=0; i<itemnum.length; i++) {
				if(itemnum[i] == null || itemnum[i].equals("")) break;
				pstmt.setInt(1,  num);
				pstmt.setInt(2,  Integer.parseInt(itemnum[i]));
				int result = pstmt.executeUpdate();
				if(result > 0) flag = true;
			}
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt); }
		
		return flag;
	}
	
	public int getPollCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int total = 0;
		
		try {
			con = pool.getConnection();
			if(num == 0) sql = "select sum(count) from btPollItem";
			else sql = "select sum(count) from btPollItem where listnum=" + num;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) total = rs.getInt(1);
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt, rs); }
		
		return total;
	}
	
	public Vector<PollItemVO> getViewList(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<PollItemVO> itemList = new Vector<PollItemVO>();
		
		try {
			con = pool.getConnection();
			if(num == 0) sql = "select item, count from btPollItem";
			else sql = "select item, count from btPollItem where listnum=" + num;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PollItemVO ivo = new PollItemVO();
				String[] item = new String[1];
				item[0] = rs.getString(1);
				ivo.setItem(item);
				ivo.setCount(rs.getInt(2));
				
				itemList.add(ivo);
			}
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt, rs); }
		
		return itemList;
	}
	
	
}










