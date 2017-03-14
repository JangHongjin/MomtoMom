package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.domain.BoardDTO;
import model.domain.NoticeBoardDTO;
import model.domain.UserDTO;
import util.DBUtil;

//게시판 확인,추가,수정,삭제
public class BoardDAO {

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
						+ "(b_pno, b_no, b_title,b_con,b_date,b_pic,b_author) VALUES((SELECT max(b_pno) FROM board_list),?,?,?,curdate(),?,?)");
				pstmt.setInt(1, board.getbNo());
				pstmt.setString(2, board.getbTitle());
				pstmt.setString(3, board.getbCon());
				pstmt.setString(4, board.getbPic());
				pstmt.setString(5, board.getbAuthor());
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

	// 공지사항 수정
	public static boolean updateNoticeBoard(NoticeBoardDTO board) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("UPDATE notice_board SET b_title=?, b_con=?, b_flag=? WHERE b_pno=?");
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
			pstmt = con.prepareStatement("DELETE FROM board_list WHERE b_pno=?");
			System.out.println("------------------------");
			pstmt.setInt(1, board.getbPno());
			con.setAutoCommit(false); // 트랜잭션 처리 위해 자동commit종료
			int result = pstmt.executeUpdate();
			if (result == 1) {
				pstmt.close();
				System.out.println("------------------------");
				System.out.println(board.getbPno());
				System.out.println(getBno(board.getbPno()));
				System.out.println(BoardDef.getBoardName(getBno(board.getbPno())));
				pstmt = con.prepareStatement("DELETE FROM " + BoardDef.getBoardName(board.getbNo()) + " WHERE b_pno=?");
				pstmt.setInt(1, board.getbPno());
				if (pstmt.executeUpdate() == 1) {
					pstmt.close();
					pstmt=con.prepareStatement("DELETE FROM comment WHERE b_pno=?");
					pstmt.setInt(1, board.getbPno());
					pstmt.executeUpdate();
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
	public static List<BoardDTO> getBoardList(String boardName, String searchOption, String keyword) throws Exception {
		System.out.println(1111);
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		String sql = null;
		try {
			con = DBUtil.getConnection();
			if(searchOption.equals("all")){
				System.out.println(222);
				sql = "SELECT * FROM table_name "
						+ " WHERE b_author like '%" + keyword + "%' "
						+ " OR b_con like '%" + keyword + "%' "
						+ " OR b_title like '%" + keyword + "%' ";
			}else{
				System.out.println(333);
				sql = "SELECT * FROM table_name "
						+ " WHERE " + searchOption + " like '%" + keyword + "%' ";
			}
			System.out.println(444);
			sql = sql.replaceAll("table_name", boardName);
			System.out.println(555);
			pstmt = con.prepareStatement(sql);
			System.out.println(666);
			rset = pstmt.executeQuery();
			System.out.println(777);
			while (rset.next()) {
				list.add(new BoardDTO(rset.getInt(1), rset.getInt(2), rset.getString(3), rset.getString(4),
						rset.getString(5), rset.getInt(6), rset.getInt(7), rset.getString(8), rset.getString(9)));
				System.out.println(888);
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return list;
	}
	// 게시글 갯수 확인 - 재구현
		public static int countArticle(String boardName, String searchOption, String keyword) throws Exception {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = null;
			int result = 0;
			try {
				System.out.println(boardName);
				con = DBUtil.getConnection();
				if(searchOption.equals("all")){
					System.out.println(222);
					sql = "SELECT count(*) FROM table_name "
							+ " WHERE b_author like '%" + keyword + "%' "
							+ " OR b_con like '%" + keyword + "%' "
							+ " OR b_title like '%" + keyword + "%' ";
				}else{
					System.out.println(333);
					sql = "SELECT count(*) FROM table_name "
							+ " WHERE " + searchOption + " like '%" + keyword + "%' ";
				}
				//sql = "SELECT count(*) FROM table_name";
				sql = sql.replaceAll("table_name", boardName);
				pstmt = con.prepareStatement(sql);
				//pstmt.setString(1, boardName);
				System.out.println("999ttt");
				
				rset = pstmt.executeQuery();
				if (rset.next()) {
					result = rset.getInt(1);
				}
			} finally {
				DBUtil.close(con, pstmt, rset);
			}
			return result;
		}

	// 게시글 갯수 확인
	public static int getBoardListCount(String boardName) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = null;
		int result = 0;
		try {
			con = DBUtil.getConnection();
			sql = "SELECT count(*) FROM table_name";
			sql = sql.replaceAll("table_name", boardName);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardName);

			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return result;
	}

	// 게시글 상세보기!
	public static BoardDTO getBoardDetail(String boardName, int bPno) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		BoardDTO detail = null;
		String sql = null;
		try {
			con = DBUtil.getConnection();
			sql = "SELECT * FROM table_name WHERE b_pno =?";
			sql = sql.replaceAll("table_name", boardName);

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bPno);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				detail = new BoardDTO(rset.getInt(1), rset.getInt(2), rset.getString(3), rset.getString(4),
						rset.getString(5), rset.getInt(6), rset.getInt(7), rset.getString(8), rset.getString(9));
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return detail;
	}

	// 검색결과의 수가 몇개? (페이징처리위해)
	public static int getSearchListCount(String boardName, String searchCond, String searchContent) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		try {

			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("SELECT count(*) FROM ? WHERE ? = '%?%' ");
			pstmt.setString(1, boardName);
			pstmt.setString(2, searchCond);
			pstmt.setString(3, searchContent);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return result;
	}

	// 검색결과 반환
	public static ArrayList<BoardDTO> searchBoard(String boardName, String searchCond, String searchContent, int pageNo)
			throws Exception {
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
			while (rset.next()) {
				list.add(new BoardDTO(rset.getInt(1), rset.getInt(2), rset.getString(3), rset.getString(4),
						rset.getString(5), rset.getInt(6), rset.getInt(7), rset.getString(8), rset.getString(9)));
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return list;
	}

	// 게시글 조회수 상승
	public static boolean readNumIncrease(int bPno) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql=null;
		try {
			con = DBUtil.getConnection();
			sql = "UPDATE table_name SET b_readnum = b_readnum+1 WHERE b_pno=?";
			sql = sql.replaceAll("table_name", BoardDef.getBoardName(Mom2momService.getBno(bPno)));
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bPno);
			int result = pstmt.executeUpdate();
			if (result == 1) {
				return true;
			}
		} finally {
			DBUtil.close(con, pstmt);
		}
		return false;

	}

	// 게시글 좋아요 상승
	public static boolean likeNumIncrease(BoardDTO board) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("UPDATE ? SET b_likenum = b_likenum+1 WHERE b_pno=?");
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

	// 댓글 수 반환
	public static int getCommentCount(int bPno) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("SELECT count(*) FROM comment WHERE b_pno=?");
			pstmt.setInt(1, bPno);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt(1);
				return result;
			}

		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return result;
	}
	
	//게시글번호로 게시판번호 반환
	public static int getBno(int bPno)throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("SELECT b_no FROM board_list WHERE b_pno=?");
			pstmt.setInt(1, bPno);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt(1);
				return result;
			}

		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return result;
	}
}