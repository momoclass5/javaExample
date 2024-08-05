package ex09;

import java.util.List;

/**
 * 비지니스 로직 작성
 */
public class BookService {
    private BookDao dao = new BookDao();

    public List<Book> getBookList() {
        return dao.getBookList();
    }

    public int insertBook(Book book) {
        int res = dao.insertBook(book);

        return res;
    }
}
