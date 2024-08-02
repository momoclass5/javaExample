package ex09;

import lombok.Data;

@Data
public class Book {
    String b_no;
    String title;
    String author;
    String rentyn;

    public Book(String b_no, String title, String author, String rentyn) {
        this.b_no = b_no;
        this.title = title;
        this.author = author;
        this.rentyn = rentyn;
    }

}
