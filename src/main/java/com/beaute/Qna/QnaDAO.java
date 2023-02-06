package com.beaute.Qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import com.beaute.dbcp.DBConnectionMgr;

public class QnaDAO {

	private DBConnectionMgr pool;

	public QnaDAO() {
		try { pool = DBConnectionMgr.getInstance(); }
		catch(Exception e) { e.printStackTrace(); }
	}
	
	public boolean insertQna(QnaVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert into btQna (id,name,email,title,body,wdate)"
					+ "values (?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getTitle());
			pstmt.setString(5, vo.getBody());
			
			
			if(pstmt.executeUpdate() == 1) flag = true;
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt); }
		
		return flag;
	}
	
	public Vector<QnaVO> getQnaList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<QnaVO> qlist = new Vector<QnaVO>();
		
		try {
			con = pool.getConnection();
			sql = "select * from btQna";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QnaVO qvo = new QnaVO();
				qvo.setNum(rs.getString(1));
				qvo.setId(rs.getString(2));
				qvo.setName(rs.getString(3));
				qvo.setEmail(rs.getString(4));
				qvo.setTitle(rs.getString(5));
				qvo.setBody(rs.getString(6));
				qvo.setWdate(rs.getString(7));
				
				qlist.add(qvo);
			}
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt, rs); }
		
		return qlist;
	}
	
	public boolean deleteQna(String num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "delete from btQna where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			
			if(pstmt.executeUpdate() == 1) flag = true;
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt); }
		
		return flag;
	}
	
}
