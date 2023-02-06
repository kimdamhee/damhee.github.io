package com.beaute.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import com.beaute.dbcp.DBConnectionMgr;

public class MemberDAO {
	private DBConnectionMgr pool;
	
	public MemberDAO() {
		try { pool = DBConnectionMgr.getInstance(); }
		catch(Exception e) { e.printStackTrace(); }
	}

	public boolean insertMember(MemberVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert into btMember (id,pwd,name,gender,birth,email,zipcode,addr,hobby,job,regdate)"
					+ "values (?,?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getBirth());
			pstmt.setString(6, vo.getEmail());
			pstmt.setString(7, vo.getZipcode());
			pstmt.setString(8, vo.getAddr());
			
			String[] hobby = vo.getHobby(); //체크한 취미를 얻는다.
			String[] list = {"인터넷", "여행", "게임", "영화", "운동"};
			char[] hb = {'0','0','0','0','0'};
			
			for(int i=0; i < hobby.length; i++) {
				for(int j=0; j < list.length; j++) {
					if(hobby[i].equals(list[j])) { hb[j] = '1'; }
				}
			}
			
			pstmt.setString(9, new String(hb));
			pstmt.setString(10, vo.getJob());
			
			if(pstmt.executeUpdate() == 1) flag = true;
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt); }
		
		return flag;
	}
	
	public boolean checkId(String id) { 
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select id from btMember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			flag = pstmt.executeQuery().next();
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt); }
		
		return flag;
	}
	
	public Vector<ZipcodeVO> zipcodeRead(String area3) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ZipcodeVO> vlist = new Vector<ZipcodeVO>();
		
		try {
			con = pool.getConnection();
			sql = "select * from btZipcode where area3 like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+area3+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) { 
				ZipcodeVO zvo = new ZipcodeVO();
				zvo.setZipcode(rs.getString(1));
				zvo.setArea1(rs.getString(2));
				zvo.setArea2(rs.getString(3));
				zvo.setArea3(rs.getString(4));
				zvo.setArea4(rs.getString(5));
				
				vlist.add(zvo);
			}
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt, rs); }
		
		return vlist;
	}
	
	public boolean loginCheck(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select id from btMember where id=? and pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			flag = rs.next();
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt, rs); }
		
		return flag;
	}
	
	public MemberVO getMyInfo(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO vo = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "select * from btMember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new MemberVO();
				vo.setId(rs.getString("id"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirth(rs.getString("birth"));
				vo.setEmail(rs.getString("email"));
				vo.setZipcode(rs.getString("zipcode"));
				vo.setAddr(rs.getString("addr"));
				String[] hobbys = new String[5];
				String hobby = rs.getString("hobby"); 
				
				for(int i=0; i<hobbys.length; i++) {
					hobbys[i] = hobby.substring(i, i+1);
				}
				vo.setHobby(hobbys);
				vo.setJob(rs.getString("job"));
			}
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt, rs); }
		
		return vo;
	}
	
	public boolean updateMember(MemberVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "update btMember set pwd=?,name=?,gender=?,birth=?,email=?,zipcode=?,addr=?,hobby=?,job=?"
						+"where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getPwd());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getBirth());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getZipcode());
			pstmt.setString(7, vo.getAddr());
			
			String[] hobby = vo.getHobby();
			String[] list = {"인터넷", "여행", "게임", "영화", "운동"};
			char[] hb = {'0','0','0','0','0'};
			
			for(int i=0; i < hobby.length; i++) {
				for(int j=0; j < list.length; j++) {
					if(hobby[i].equals(list[j])) { hb[j] = '1'; }
				}
			}
			
			pstmt.setString(8, new String(hb));
			pstmt.setString(9, vo.getJob());
			pstmt.setString(10, vo.getId());
			
			if(pstmt.executeUpdate() == 1) flag = true;
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt); }
		
		return flag;
	}
	
	
	public boolean deleteMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "delete from btMember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			if(pstmt.executeUpdate() == 1) flag = true;
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt); }
		
		return flag;
	}
	
	public Vector<MemberVO> getMemberList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<MemberVO> mlist = new Vector<MemberVO>();
		
		try {
			con = pool.getConnection();
			sql = "select * from btMember";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberVO mvo = new MemberVO();
				mvo.setId(rs.getString(1));
				mvo.setPwd(rs.getString(2));
				mvo.setName(rs.getString(3));
				mvo.setGender(rs.getString(4));
				mvo.setBirth(rs.getString(5));
				mvo.setEmail(rs.getString(6));
				mvo.setZipcode(rs.getString(7));
				mvo.setAddr(rs.getString(8));
				
				String[] hobbys = new String[5];
				String hobby = rs.getString(9);
				
				for(int i=0; i<hobbys.length; i++) {
					hobbys[i] = hobby.substring(i, i+1);
				}
				
				mvo.setHobby(hobbys);
				mvo.setJob(rs.getString(10));
				
				mlist.add(mvo);
			}
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt, rs); }
		
		return mlist;
	}
}









