package ex09;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 데이터베이스 커넥션을 생성하고 반환한다
 */
public class ConnectionUtil {
    public static Connection getConnection() {
        Connection con = null;
        // 오라클 드라이버 로딩
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // 데이터베이스 연결 생성
            // url, id, pw
            con = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:orcl", "user01", "1234");

        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return con;
    }

    public void closeConnection(ResultSet rs, PreparedStatement pstmt, Connection con) {
        try {
            if (rs != null)
                rs.close();
            if (pstmt != null)
                pstmt.close();
            if (con != null)
                con.close();
        } catch (Exception e) {
            System.out.println("closeConnection 처리 중 예외 발생");
            e.printStackTrace();
        }
    }
}
