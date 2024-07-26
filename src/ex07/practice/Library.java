package ex07.practice;

import java.util.Scanner;

public class Library {
    // 책을 여러권 보관할 수 있는 책꽂이를 생성
    Book[] bookList = new Book[10];
    Scanner scan = new Scanner(System.in);

    public Library() {
        // 배열에 책을 생성
        bookList[0] = new Book(1, "오늘도맑음1", "하레와구우1");
        bookList[1] = new Book(2, "오늘도맑음2", "하레와구우2");
        bookList[2] = new Book(3, "오늘도맑음3", "하레와구우3");
        bookList[3] = new Book(4, "오늘도맑음4", "하레와구우4");
        bookList[4] = new Book(5, "오늘도맑음5", "하레와구우5");
        bookList[5] = new Book(6, "오늘도맑음6", "하레와구우6");
    }

    // 메뉴 출력
    public void showMenu() {

        System.out.println("1. 도서대여");
        System.out.println("2. 도서반납");
        System.out.println("3. 도서추가");
        System.out.println("4. 도서삭제");
        System.out.println("9. 종료");
        // 사용자로 부터 입력
    }

    // 도서 대여
    public void rentBook() {
        System.out.println("도서번호를 입력해주세요");
        // 스캐너로 번호(인덱스)를 입력 받는다
        // 해당 인덱스에 있는 도서의 상태가 대여중이면
        // 메세지 처리를 하고 (이미 대여중입니다.)
        // 아니면 도서의 상태를 대여(true)로 변경
    }

    // 도서반납
    public void returnBook() {
        System.out.println("도서번호를 입력해주세요");
        // 스캐너로 번호(인덱스)를 입력 받는다
        // 해당 인덱스에 있는 도서의 상태가 대여중이면
        // 도서의 상태를 반납(false)으로 변경
        // 아니면 메세지 처리를 하고 (이미 대여중입니다.)

    }

    // 배열정보를 하나의 문자열로 생성하여 반환
    // 메서드 재정의
    @Override
    public String toString() {
        String str = "";
        for (Book b : bookList) {
            // str += b.toString() ;
            // null 에다 .찍으면 NullPointerException
            // null 참조변수가 아무것도 참조하고 있지 않은경우
            str = str + b + "\n";
        }
        return str;
    }
}
