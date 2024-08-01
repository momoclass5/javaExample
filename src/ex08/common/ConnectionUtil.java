package ex08.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 1. 라이브러리 다운로드 - 메이븐저장소 (라이브러리 다운로드)
 * 
 */
public class ConnectionUtil {
    public static void main(String[] args) {
        try {
            // 라이브러리가 잘 추가 되었는지 확인
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // 데이테베이스 접근
            Connection conn = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:orcl",
                    "user01",
                    "1234");
            PreparedStatement pstmt = conn.prepareStatement("select * from emp");
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                System.out.println(rs.getString(1));
                System.out.println(rs.getString(2));
                System.out.println(rs.getString(3));
                System.out.println(rs.getString(4));
                System.out.println(rs.getString(5));
            }
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
}
