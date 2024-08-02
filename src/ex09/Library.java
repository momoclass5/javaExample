package ex09;

import java.util.List;

public class Library {
    List<Book> list;
    BookDao dao = new BookDao();

    Library() {
        // 데이터 베이스에 접근해서 도서 목록을 조회
        list = dao.getBookList();
        for (Book book : list) {
            System.out.println(book);
        }
    }
}
