package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.domain.BoardDTO;
import model.domain.CommentDTO;
import model.domain.UserDTO;
import util.DBUtil;

//댓글 확인,추가,수정,삭제
public class CommentDAO {

   // 댓글 확인
   public static ArrayList<CommentDTO> getAllComment(int boardNo) throws Exception {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<CommentDTO> list = null;
      try {
         con = DBUtil.getConnection();

         pstmt = con.prepareStatement("SELECT * FROM comment WHERE b_pno=?");
          pstmt.setInt(1, boardNo);
         rset = pstmt.executeQuery();

         
         list = new ArrayList<CommentDTO>();
         while(rset.next()){
            list.add(new CommentDTO(rset.getInt(1), rset.getInt(2), rset.getString(3), rset.getString(4), rset.getString(5)));
         }
      }finally{
         DBUtil.close(con, pstmt, rset);
      }
         return list;
   }

   // 댓글 추가
   public static boolean writeComment(CommentDTO comm) throws Exception {
      Connection con = null;
      PreparedStatement pstmt = null;
      try {
         con = DBUtil.getConnection();

         pstmt = con
               .prepareStatement("INSERT INTO comment (b_pno, usr_nick, comm_con, comm_date) VALUES (?, ?, ?, ?)");
         pstmt.setInt(1, comm.getbPno());
         pstmt.setString(2, comm.getUsrNick());
         pstmt.setString(3, comm.getCommCon());
         pstmt.setString(4, "curdate()");

         int result = pstmt.executeUpdate();
         if (result == 1) {
            return true;
         }
      } finally {
         DBUtil.close(con, pstmt);
      }
      return false;
   }

   // 댓글 수정하기
   public static boolean updateComment(CommentDTO comm) throws Exception {
      Connection con = null;
      PreparedStatement pstmt = null;
      try {
         con = DBUtil.getConnection();

         pstmt = con.prepareStatement("UPDATE comment SET comm_con=? WHERE comm_no=?");
         pstmt.setString(1, comm.getCommCon());
         pstmt.setInt(2, comm.getCommNo());
         int result = pstmt.executeUpdate();
         if (result == 1) {
            return true;
         }
      } finally {
         DBUtil.close(con, pstmt);
      }
      return false;
   }

   // 댓글 삭제하기
   public static boolean deleteComment(int commNo) throws Exception {
      Connection con = null;
      PreparedStatement pstmt = null;
      try {
         con = DBUtil.getConnection();

         pstmt = con.prepareStatement("DELETE FROM comment WHERE comm_no=?");
         pstmt.setInt(1, commNo);
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