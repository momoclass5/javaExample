package ex08.practice;

import java.util.ArrayList;
import java.util.List;

import ex02.practice.Book;

public class ListEx {
    public static void main(String[] args) {

        // 리스트를 선언 하는방법
        // 타입을 지정 하지 않은경우
        // Object 타입
        ArrayList list = new ArrayList<>();
        // 인터페이스는 생성이 안됨
        // List list1 = new List();
        list.add("안녕"); // String
        list.add(1234); // Integer
        list.add(true); // Boolean
        list.add(new Book("제목", 20000, 0.5, "작가"));

        // 자식타입으로 변환되기위해서 확인이 필요함
        System.out.println(list.get(0));

        for (Object obj : list) {
            System.out.println(obj);
        }

        // 타입을 지정한 경우 - 지정한 타입만 저장이 가능
        List<Book> bookList = new ArrayList<Book>();
        bookList.add(new Book("제목", 20000, 0.5, "작가"));
        bookList.add(new Book("제목", 20000, 0.5, "작가"));
        bookList.add(new Book("제목", 20000, 0.5, "작가"));
        bookList.add(new Book("제목", 20000, 0.5, "작가"));
        bookList.add(new Book("제목", 20000, 0.5, "작가"));

        System.out.println(list);
        System.out.println(bookList);
        System.out.println("===================");
        // 향상된 for문
        for (Book book : bookList) {
            System.out.println(book);
        }

    }

}
