package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.domain.UserDTO;
import util.DBUtil;

//회원 확인,추가,수정,삭제
public class UserDAO {

	// 로그인
	public static String loginCheck(String email, String pw) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String nick = null;
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("SELECT usr_nick FROM user WHERE usr_email=? and usr_pw=?");
			pstmt.setString(1, email);
			pstmt.setString(2, pw);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				nick = rset.getString(1);
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return nick;
	}
	
	// 회원 수정하기
	public static boolean updateUser(UserDTO user) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getConnection();

			pstmt = con
					.prepareStatement("UPDATE user SET usr_pw=?, usr_birth=?, usr_com=?, usr_phone=?, usr_grant=? WHERE usr_nick=?");
			pstmt.setString(1, user.getUsrPw());
			pstmt.setString(2, user.getUsrBirth());
			pstmt.setString(3, user.getUsrCom());
			pstmt.setString(4, user.getUsrPhone());
			pstmt.setString(5, user.getUsrGrant());
			pstmt.setString(6, user.getUsrNick());
			int result = pstmt.executeUpdate();
			if (result == 1) {
				return true;
			}
		} finally {
			DBUtil.close(con, pstmt);
		}
		return false;
	}

	// 회원등급수정(관리자)
	public static boolean updateUserGrant(String usrNick, String usrGrant) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("UPDATE user SET usr_grant =? WHERE usr_nick=?");
			pstmt.setString(1, usrGrant);
			pstmt.setString(2, usrNick);

			int result = pstmt.executeUpdate();
			if (result == 1) {
				return true;
			}
		} finally {
			DBUtil.close(con, pstmt);
		}
		return false;
	}

	// 회원 추가하기(가입)
	public static boolean insertUser(UserDTO user) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getConnection();
			if (getUser(user.getUsrNick()) != null) {		//기존에 존재하는 유저?
				System.out.println("기존에 존재하는 유저 UserDAO.java 91line");
				return false;
			} else {
				System.out.println(user);
				pstmt = con.prepareStatement(
						"INSERT INTO user (usr_nick, usr_email, usr_pw, usr_birth, usr_com, usr_phone) VALUES (?, ?, ?, ?, ?, ?)");
				pstmt.setString(1, user.getUsrNick());
				pstmt.setString(2, user.getUsrEmail());
				pstmt.setString(3, user.getUsrPw());
				pstmt.setString(4, user.getUsrBirth());
				pstmt.setString(5, user.getUsrCom());
				pstmt.setString(6, user.getUsrPhone());
				int result = pstmt.executeUpdate();

				if (result == 1) {
					return true;
				}
			}
		} finally {
			DBUtil.close(con, pstmt);
		}
		return false;
	}

	// 회원 확인하기
	public static UserDTO getUser(String usrNick) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		UserDTO user = null;
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("SELECT * FROM user where usr_nick=?");
			pstmt.setString(1, usrNick);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				user = new UserDTO(0, rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4),
						rset.getString(5), rset.getString(6), rset.getString(7), rset.getInt(8));
			}

		} finally {
			DBUtil.close(con, pstmt);
		}
		return user;
	}
	// 회원 수
	public static int countUser(String searchOption, String keyword) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		try {
			con = DBUtil.getConnection();
			if(searchOption.equals("all")){
				pstmt = con.prepareStatement("SELECT COUNT(*) FROM user "
						+ "WHERE usr_email like '%" + keyword + "%'"
						+ "OR usr_phone like '%" + keyword + "%'"
						+ "OR usr_nick like '%" + keyword + "%'");
			}
			else{
				pstmt = con.prepareStatement("SELECT COUNT(*) FROM user "
						+ "WHERE " + searchOption + " like '%" + keyword + "%'");
			}
			rset = pstmt.executeQuery();

			while (rset.next()) {
				count = rset.getInt(1);
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return count;
	}
	
	// 회원 리스트
	public static List<UserDTO> userList(int start, int end, String searchOption, String keyword) throws Exception{
		System.out.println(111);
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<UserDTO> list = new ArrayList<UserDTO>();//***
		try {
			con = DBUtil.getConnection();

			if(searchOption.equals("all")){
				System.out.println("========");
				String url = "SELECT * FROM ( SELECT @RNUM:=@RNUM+1 AS rn, A.* FROM ( SELECT * FROM user "
						+ "WHERE usr_email like '%" + keyword + "%'"
						+ " OR usr_phone like '%" + keyword + "%'"
						+ " OR usr_nick like '%" + keyword + "%'"
						+ " ORDER BY usr_com DESC, usr_nick DESC "
						+ " ) A, ( SELECT @RNUM:=0 ) R ) B WHERE rn BETWEEN " + start + " AND " + end;
				pstmt = con.prepareStatement(url);
				System.out.println(url);
				
			}
			else{
				System.out.println("------------");
				String url = "SELECT * FROM ( "
						+ "SELECT @RNUM:=@RNUM+1 AS rn, A.* FROM ( "
						+ "SELECT * FROM user "
						+ "WHERE " + searchOption + " like '%" + keyword + "%'"
						+ " ORDER BY usr_com DESC, usr_nick DESC "
						+ " ) A, "
						+ " ( SELECT @RNUM:=0 ) R "
						+ " ) B WHERE rn BETWEEN " + start + " AND " + end;
				System.out.println(url);
				pstmt = con.prepareStatement(url);
				
			}
			//pstmt.setString(1, usrNick);
			rset = pstmt.executeQuery();

			
			while (rset.next()) {
				list.add(new UserDTO(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getString(5),
						rset.getString(6), rset.getString(7), rset.getString(8), rset.getByte(9)));
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		System.out.println("얍얍 " + list);
		return list;
		
	}

	// (*관리자용) 회원 확인
	public static ArrayList<UserDTO> getAllUser() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<UserDTO> list = null;
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("SELECT * FROM user");
			rset = pstmt.executeQuery();

			list = new ArrayList<UserDTO>();
			while (rset.next()) {
				/*list.add(new UserDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4),
						rset.getString(5), rset.getString(6), rset.getString(7), rset.getInt(8)));*/
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return list;
	}

	// 회원 삭제하기
	public static boolean deleteUser(UserDTO user) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getConnection();

			/*
			 * pstmt = con.prepareStatement(
			 * "DELETE FROM user WHERE usr_nick=?");
			 */
			pstmt = con.prepareStatement("UPDATE user SET usr_exist=0 WHERE usr_nick=?");
			pstmt.setString(1, user.getUsrNick());

			int result = pstmt.executeUpdate();
			if (result == 1) {
				return true;
			}
		} finally {
			DBUtil.close(con, pstmt);
		}
		return false;
	}

}