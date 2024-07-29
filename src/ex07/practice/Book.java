package ex07.practice;

import lombok.Data;

/**
 * setter, getter 생성
 * toString 재정의
 */
@Data
public class Book {
    private int no; // 도서번호
    private String title; // 도서명
    private String author; // 작가명
    private boolean rent; // 대여여부 (false : 대여가능, true : 대여 불가능)
    private String rent_str; // 대여여부 문자열

    public Book(int no, String title, String author) {
        this.no = no;
        this.title = title;
        this.author = author;
        // 도서관이 생성되면서 새로만든 책은 대여가 가능한 상태
        rent = false;
        rent_str = "";
    }

    public void setRent(boolean rent) {
        this.rent = rent;

        if (rent) {
            rent_str = "대여중";
        } else {
            rent_str = "";
        }
    }
}
