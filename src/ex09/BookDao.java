package ex09;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * getBookList() : 도서 목록 조회
 * insertBook() : 도서 등록
 */
public class BookDao {
    public static void main(String[] args) {
        BookDao dao = new BookDao();

        // for (int i = 0; i < 100; i++) {
        int res = dao.insertBook();
        System.out.println(res + "건 처리되었습니다.");

        // }

        // List<Book> list = dao.getBookList();
        // for (Book book : list) {
        // System.out.println(book);
        // }
    }

    public int insertBook() {
        int res = 0;

        String sql = "INSERT INTO TB_BOOK (B_NO, TITLE, AUTHOR, P_NO) "
                + "VALUES('B'||lpad( seq_tb_book.nextval,5,0), insertBook', '삽입테스트', 'P00003')";
        try (
                Connection con = ConnectionUtil.getConnection();
                PreparedStatement pstmt = con.prepareStatement(sql);) {
            // insert, update, delete의 경우
            // 몇건 처리되었는지 숫자로 반환
            res = pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return res;
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
