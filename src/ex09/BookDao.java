package ex09;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDao {
    public static void main(String[] args) {
        BookDao dao = new BookDao();
        List<Book> list = dao.getBookList();
        for (Book book : list) {
            System.out.println(book);
        }
    }

    public List<Book> getBookList() {
        List<Book> list = null;
        // 데이터 베이스 연결
        try {
            Connection con = ConnectionUtil.getConnection();
            // 쿼리 질의
            PreparedStatement pstmt = con.prepareStatement("select * from tb_book");
            ResultSet rs = pstmt.executeQuery();
            // 결과집합으로 부터 책을 꺼내서 리스트에 담아봅시다
            list = new ArrayList<Book>();

            // 결과집합의 다음행이 있다면 한줄씩 읽어옵니다
            // 반환타입입은 있으면 true, 없으면 false
            while (rs.next()) {
                String b_no = rs.getString("b_no");
                String title = rs.getString("title");
                String author = rs.getString("author");
                String rentyn = rs.getString("rentyn");

                Book book = new Book(b_no, title, author, rentyn);
                list.add(book);
            }

            // 자원반납
            ConnectionUtil.closeConnection(rs, pstmt, con);
        } catch (SQLException e) {
            // TODO: handle exception
        }
        return list;
    }
}
