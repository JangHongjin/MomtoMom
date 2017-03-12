package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * driver=com.mysql.jdbc.Driver
url=jdbc:mysql://127.0.0.1:3306/mom
id=root
pw=apmsetup
 */

public class DBUtil {
   static {
      try {
         Class.forName("com.mysql.jdbc.Driver");
      } catch (Exception c) {
         c.printStackTrace();
      }
   }

   public static Connection getConnection() throws SQLException {
      return DriverManager.getConnection("jdbc:mysql://192.168.207.20/mom?zeroDateTimeBehavior=convertToNull","root","apmsetup");
   }

   // DML용
   public static void close(Connection con, Statement stmt) {
      try {
         if (stmt != null) {
            stmt.close();
            stmt = null;
         }
         if (con != null) {
            con.close();
            con = null;
         }
      } catch (SQLException s) {
         s.printStackTrace();
      }
   }

   // SELECT용
   public static void close(Connection con, Statement stmt, ResultSet rset) {
      try {
         if (rset != null) {
            rset.close();
            rset = null;
         }
         close(con, stmt);
      } catch (SQLException s) {
         s.printStackTrace();
      }
   }
}