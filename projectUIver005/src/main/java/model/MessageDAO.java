package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.domain.MessageDTO;
import util.DBUtil;

//쪽지 확인,추가,삭제
public class MessageDAO {
   //받은 쪽지함 ArrayList
   public static ArrayList<MessageDTO> getAllReceiveMessage(String rid) throws Exception {
         Connection con = null;
         PreparedStatement pstmt = null;
         ResultSet rset = null;
         ArrayList<MessageDTO> list = null;
         try {
            con = DBUtil.getConnection();
            pstmt = con.prepareStatement("SELECT msg_No, msg_Sid, msg_Con, msg_Date FROM message WHERE msg_Rid=?");
            pstmt.setString(1, rid);
            rset = pstmt.executeQuery();
            
            list = new ArrayList<MessageDTO>();
            while(rset.next()){
               list.add(new MessageDTO(rset.getInt(1), rset.getString(2), " " , rset.getString(3), rset.getString(4)));
            }
         } finally {
            DBUtil.close(con, pstmt);
         }
            return list;
      }
   
   
   //보낸 쪽지함 ArrayList
      public static ArrayList<MessageDTO> getAllSendMessage(String sid) throws Exception {
            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rset = null;
            ArrayList<MessageDTO> list = null;
            try {
               con = DBUtil.getConnection();
               pstmt = con.prepareStatement("SELECT msg_No, msg_Rid, msg_Con, msg_Date FROM message WHERE msg_Sid=?");
               pstmt.setString(1, sid);
               rset = pstmt.executeQuery();
               
               list = new ArrayList<MessageDTO>();
               while(rset.next()){
                  list.add(new MessageDTO(rset.getInt(1), " ",rset.getString(2), rset.getString(3), rset.getString(4)));
               }
            }
            finally {
               DBUtil.close(con, pstmt);
            }
               return list;
         }
      
   
//   //받은 쪽지 1개 확인
//   public static MessageDTO receiveMessageDetail(int msgNo) throws Exception {
//         Connection con = null;
//         PreparedStatement pstmt = null;
//         ResultSet rset=null;
//         MessageDTO msg = null;
//         try {
//            con = DBUtil.getConnection();
//
//            pstmt = con.prepareStatement("SELECT * FROM message WHERE msg_No=?");
//           
//            pstmt.setInt(1, msgNo);
//
//            rset = pstmt.executeQuery();
//            if (rset == null) {
//               //예외발생
//            }
//            msg = new MessageDTO(rset.getInt(1),rset.getString(2),rset.getString(3),rset.getString(4),rset.getString(5));
//         } finally {
//            DBUtil.close(con, pstmt);
//         }
//         return msg;
//      }
//   
   //보낸 쪽지 1개 확인
      public static MessageDTO messageDetail(int msgNo) throws Exception {
            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rset = null;
            MessageDTO msg = new MessageDTO();
            try {
               con = DBUtil.getConnection();

               pstmt = con.prepareStatement("SELECT * FROM message WHERE msg_No=?");
               pstmt.setInt(1, msgNo);
               rset = pstmt.executeQuery();
               if(rset.next()){
            	   msg = new MessageDTO(rset.getInt(1),rset.getString(2),rset.getString(3),rset.getString(4),rset.getString(5));
               }
            } finally {
               DBUtil.close(con, pstmt,rset);
            }
            return msg;
         }
   
   
   //쪽지 추가
   public static boolean writeMessage(MessageDTO message) throws Exception {
      Connection con = null;
      PreparedStatement pstmt = null;
      try {
         con = DBUtil.getConnection();
      
         //message 테이블에 메시지 삽입
         pstmt = con.prepareStatement("INSERT INTO message(msg_Sid, msg_Rid, msg_Con, msg_Date) VALUES(?,?,?,?)");
         pstmt.setString(1, message.getMsgSid());
         pstmt.setString(2, message.getMsgRid());
         pstmt.setString(3, message.getMsgCon());
         pstmt.setString(4, "curdate()");
         int result = pstmt.executeUpdate();
         pstmt.close();
         if (result == 1) {
               return true;
            }
      } finally {
         DBUtil.close(con, pstmt);
      }return false;
   }
   
   //메시지 삭제
   public static boolean deleteMessage(int msgNo) throws Exception {
      Connection con = null;
      PreparedStatement pstmt = null;
      try {
         con = DBUtil.getConnection();
         //메시지 삭제
         //message 테이블에서 삭제
         pstmt = con.prepareStatement("DELETE from message where msg_No=?");
         pstmt.setInt(1, msgNo);
         int result = pstmt.executeUpdate();
         pstmt.close();
         if (result == 1) {
               return true;
            }
      } finally {
         DBUtil.close(con, pstmt);
      }return false;
   }   
}