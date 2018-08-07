package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import dbutil.DBConn;
import dto.Member;

public class MemberDaoImpl implements MemberDao{

	private Connection conn;
	private Statement st;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	@Override
	public boolean join(Member insertMember) {
		
		conn = DBConn.getConnection();
		
		String beforeSql = "SELECT COUNT(*) FROM member"
				+ " WHERE userId='"+insertMember.getUserId()+"'";
		
		String sql="INSERT INTO member (userId, nick, email)"
				+"VALUES(?,?,?)";
		
		try {
			//--- 사전에 PK 중복인지 검사 ---
			st=conn.createStatement();
			rs=st.executeQuery(beforeSql);
			
			while(rs.next()) {
				if(rs.getInt(1)>0) return false;	
			}
			//-------------------------
			
			//--- INSERT 수행(회원가입) ---
			ps=conn.prepareStatement(sql);
			ps.setString(1, insertMember.getUserId());
			ps.setString(2, insertMember.getNick());
			ps.setString(3, insertMember.getEmail());
			ps.executeUpdate();
			//--------------------------
			
			
			//--- INSERT 후 삽입 잘 되었는지 검사 ---
			st=conn.createStatement();
			rs=st.executeQuery(beforeSql);
			
			while(rs.next()) {
				if(rs.getInt(1)>0) return true;
				else return false;				
			}
			//------------------------------
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(ps!=null) ps.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		}		
		return false;
	}

}
