package ex09;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class BookDao {

    public List<Book> getBookList() {
        List<Book> list = null;
        // 데이터 베이스 연결
        try {
            Connection con = ConnectionUtil.getConnection();
            // 쿼리 질의
            PreparedStatement pstmt = con.prepareStatement("select * from tb_book");
            ResultSet rs = pstmt.executeQuery();
            // 결과집합으로 부터 책을 꺼내서 리스트에 담아봅시다

        } catch (SQLException e) {
            // TODO: handle exception
        }
        return list;
    }
}
