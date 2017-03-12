package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.domain.BoardDTO;
import model.domain.NoticeBoardDTO;
import util.DBUtil;

//게시판 확인,추가,수정,삭제
public class BoardDAO {

	/*// 수정,삭제시 본인인지 확인
	public static boolean nickCheck(String usrNick, int bPno)throws Exception{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("SELECT count(*) FROM board_list WHERE usr_nick = ? AND bPno=? OR usr_nick = '관리자' ");
				pstmt.setString(1,  usrNick);
				pstmt.setInt(2,  bPno);
				rset = pstmt.executeQuery();
				int result = rset.getInt(1);
				if(result==1){
					return true;
				}
			}finally{
				DBUtil.close(con,pstmt,rset);
			}
			return false;
		}*/

	// 게시글쓰기
	public static boolean boardWrite(BoardDTO board) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DBUtil.getConnection();
			con.setAutoCommit(false); // 트랜잭션 처리 위해 자동commit종료

			// board_list에 게시글정보 삽입
			// b_pno은 자동증가
			pstmt = con.prepareStatement("INSERT INTO board_list (b_no, usr_nick) VALUES(?,?)");
			pstmt.setInt(1, board.getbNo());
			pstmt.setString(2, board.getbAuthor());
			int result = pstmt.executeUpdate();
			pstmt.close();

			if (result == 1) {
				// board_list삽입이 올바르게 동작하였을 경우
				// 해당 게시판테이블에 데이터 삽입
				pstmt = con.prepareStatement("INSERT INTO " + BoardDef.getBoardName(board.getbNo())
						+ "(b_pno, b_no, b_title,b_con,b_date,b_pic,b_author) VALUES((SELECT max(b_pno) FROM board_list),?,?,?,?,?,?)");
				pstmt.setInt(1, board.getbNo());
				pstmt.setString(2, board.getbTitle());
				pstmt.setString(3, board.getbCon());
				pstmt.setString(4, "curdate()");
				pstmt.setString(5, board.getbPic());
				pstmt.setString(6, board.getbAuthor());
				result = pstmt.executeUpdate();
				if (result == 1) {
					return true;
				}
			}
			// 모든 SQL작업이 끝났을 경우 commit
			con.commit();
		} catch (SQLException e) {
			// 중간에 예외처리 발생시 rollback
			con.rollback();
			throw e;
		} finally {
			DBUtil.close(con, pstmt);
		}
		return false;
	}

	// 공지사항 글쓰기
	public static boolean noticeBoardWrite(NoticeBoardDTO board) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DBUtil.getConnection();
			con.setAutoCommit(false); // 트랜잭션 처리 위해 자동commit종료

			// board_list에 게시글정보 삽입
			// b_pno은 자동증가
			pstmt = con.prepareStatement("INSERT INTO board_list (b_no, usr_nick) VALUES(?,?)");
			pstmt.setInt(1, board.getbNo());
			pstmt.setString(2, board.getbAuthor());
			int result = pstmt.executeUpdate();
			pstmt.close();

			if (result == 1) {
				// board_list삽입이 올바르게 동작하였을 경우
				// 해당 게시판테이블에 데이터 삽입
				pstmt = con.prepareStatement("INSERT INTO notice_board "
				+ "(b_pno, b_no, b_title,b_con,b_date,b_pic,b_author,b_flag) VALUES((SELECT max(b_pno) FROM board_list),?,?,?,?,?,?,?)");
				pstmt.setInt(1, board.getbNo());
				pstmt.setString(2, board.getbTitle());
				pstmt.setString(3, board.getbCon());
				pstmt.setString(4, "curdate()");
				pstmt.setString(5, board.getbPic());
				pstmt.setString(6, board.getbAuthor());
				pstmt.setInt(7, board.getbFlag());
				pstmt.executeUpdate();
			}
			// 모든 SQL작업이 끝났을 경우 commit
			con.commit();
		} catch (SQLException e) {
			// 중간에 예외처리 발생시 rollback
			con.rollback();
			throw e;
		} finally {
			DBUtil.close(con, pstmt);
		}
		return true;
	}
	
	//공지사항 수정
	public static boolean updateNoticeBoard(NoticeBoardDTO board) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement(
					"UPDATE notice_board SET b_title=?, b_con=?, b_flag=? WHERE b_pno=?");
			pstmt.setString(1, board.getbTitle());
			pstmt.setString(2, board.getbCon());
			pstmt.setInt(3, board.getbFlag());
			pstmt.setInt(4, board.getbPno());
			int result = pstmt.executeUpdate();
			if (result == 1) {
				return true;
			}
		} finally {
			DBUtil.close(con, pstmt);
		}
		return false;
	}

	// 게시글 수정하기
	public static boolean updateBoard(BoardDTO board) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement(
					"UPDATE " + BoardDef.getBoardName(board.getbNo()) + " SET b_title=?, b_con=? WHERE b_pno=?");
			pstmt.setString(1, board.getbTitle());
			pstmt.setString(2, board.getbCon());
			pstmt.setInt(3, board.getbPno());
			int result = pstmt.executeUpdate();
			System.out.println(
					"UPDATE " + BoardDef.getBoardName(board.getbNo()) + " SET b_title=?, b_con=? WHERE b_pno=?");
			if (result == 1) {
				return true;
			}
		} finally {
			DBUtil.close(con, pstmt);
		}
		return false;
	}

	// 게시글 삭제
	public static boolean deleteBoard(BoardDTO board) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("delete from board_list where b_pno=?");
			pstmt.setInt(1, board.getbPno());
			con.setAutoCommit(false); // 트랜잭션 처리 위해 자동commit종료
			int result = pstmt.executeUpdate();
			if (result == 1) {
				pstmt.close();
				pstmt = con.prepareStatement("delete from " + BoardDef.getBoardName(board.getbNo()) + " where b_pno=?");
				pstmt.setInt(1, board.getbPno());
				if (pstmt.executeUpdate() == 1) {
					con.commit();
					return true;
				}
			}
		} finally {
			DBUtil.close(con, pstmt);

		}
		return false;

	}
	
	// 게시판 목록 확인하기
	public static ArrayList<BoardDTO> getBoardList(String boardName, int pageNo) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BoardDTO> list = null;
		try {
			con = DBUtil.getConnection();
			// 게시글을 게시판번호에 따라 최신 10개씩 출력
			pstmt = con.prepareStatement("SELECT * FROM ? ORDER BY b_pno LIMIT ? , ? ");

			pstmt.setString(1, boardName);
			pstmt.setInt(2, (pageNo - 1) * 10);
			pstmt.setInt(3, pageNo * 10);

			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			while (rset.next()) {
				list.add(new BoardDTO(rset.getInt(1), rset.getInt(2), rset.getString(3), rset.getString(4),
						rset.getString(5), rset.getInt(6), rset.getInt(7), rset.getString(8), rset.getString(9)));
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return list;
	}
	
	//게시글 갯수 확인
	public static int getBoardListCount(String boardName)throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result=0;
		try{
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement("SELECT count(*) FROM ?");
			pstmt.setString(1, boardName);
			
			rset = pstmt.executeQuery();
			if(rset.next()){
				result = rset.getInt(1);
			}
		}finally{
			DBUtil.close(con,pstmt,rset);
		}
		return result;
	}
	
	// 게시글 상세보기!
	public static BoardDTO getBoardDetail(String boardName, int bPno) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		BoardDTO detail = null;
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("SELECT * FROM ? WHERE b_pno =?");
			pstmt.setString(1, boardName);
			pstmt.setInt(2, bPno);
			rset = pstmt.executeQuery();
			if(rset.next()){
			detail = new BoardDTO(rset.getInt(1), rset.getInt(2), rset.getString(3), rset.getString(4),
					rset.getString(5), rset.getInt(6), rset.getInt(7), rset.getString(8), rset.getString(9));
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return detail;
	}
	
	//검색결과의 수가 몇개? (페이징처리위해)
	public static int getSearchListCount(String boardName, String searchCond, String searchContent)throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result=0;
		try {
			
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("SELECT count(*) FROM ? WHERE ? = '%?%' ");
			pstmt.setString(1, boardName);
			pstmt.setString(2, searchCond);
			pstmt.setString(3, searchContent);
			rset = pstmt.executeQuery();
			if(rset.next()){
				result = rset.getInt(1);
			}
		}finally{
			DBUtil.close(con, pstmt,rset);
		}
		return result; 
	}
	
	//검색결과 반환
	public static ArrayList<BoardDTO> searchBoard(String boardName, String searchCond, String searchContent, int pageNo)throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BoardDTO> list = null;
		try {
			
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("SELECT * FROM ? ORDER BY b_pno WHERE ? = '%?%' LIMIT ? , ? ");
			pstmt.setString(1, boardName);
			pstmt.setString(2, searchCond);
			pstmt.setString(3, searchContent);
			pstmt.setInt(4, (pageNo - 1) * 10);
			pstmt.setInt(5, pageNo * 10);
			rset = pstmt.executeQuery();
			while(rset.next()){
				list.add(new BoardDTO(rset.getInt(1), rset.getInt(2), rset.getString(3), rset.getString(4),
					rset.getString(5), rset.getInt(6), rset.getInt(7), rset.getString(8), rset.getString(9)));
			}
		}finally{
			DBUtil.close(con, pstmt,rset);
		}
		return list; 
	}
	
	//게시글 조회수 상승
	public static boolean readNumIncrease(BoardDTO board)throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement(
					"UPDATE ? SET b_readnum = b_readnum+1 WHERE b_pno=?");
			pstmt.setString(1, BoardDef.getBoardName(board.getbNo()));
			pstmt.setInt(2, board.getbPno());
			int result = pstmt.executeUpdate();
			if (result == 1) {
				return true;
			}
		} finally {
			DBUtil.close(con, pstmt);
		}
		return false;
		
	}
	//게시글 좋아요 상승
	public static boolean likeNumIncrease(BoardDTO board)throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement(
					"UPDATE ? SET b_likenum = b_likenum+1 WHERE b_pno=?");
			pstmt.setString(1, BoardDef.getBoardName(board.getbNo()));
			pstmt.setInt(2, board.getbPno());
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
