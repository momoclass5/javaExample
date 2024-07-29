package ex07.practice;

import java.util.Scanner;

import ex07.common.ScannerUtil;

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

        System.out.println("******************");
        System.out.println("도서관에 오신결 환영합니다.");
        System.out.println("******************");
    }

    // 메뉴 출력
    public void showMenu() {

        while (true) {
            // 도서 목록 출력
            System.out.println(this.toString());

            System.out.println("====================");
            System.out.println("메뉴");
            System.out.println("====================");
            System.out.println("1. 도서대여");
            System.out.println("2. 도서반납");
            System.out.println("3. 도서추가");
            System.out.println("4. 도서삭제");
            System.out.println("9. 종료");
            System.out.println("====================");

            // 사용자로 부터 입력
            int menu = ScannerUtil.getInt("메뉴를 입력 해주세요.");

            switch (menu) {
                case 1:
                    // 도서 대여 호출
                    rentBook();
                    break;
                case 2:
                    // 도서 반납 호출
                    returnBook();
                    break;
                case 3:
                    // 도서 삽입
                    insertBook();
                    break;
                case 4:
                    // 도서 삭제
                    deleteBook();
                    break;
                case 9:
                    System.out.println("프로그램을 종료 합니다.");
                    System.exit(-1);

                    break;
                default:
                    System.out.println("메뉴를 확인후 다시 입력 해주세요.");
                    break;
            }
        }
    }

    private void deleteBook() {
        int bookNo = ScannerUtil.getInt("삭제할 도서번호를 입력");
        if (bookList[bookNo] != null) {
            String title = bookList[bookNo].getTitle();
            bookList[bookNo] = null;
            System.out.println(title + " 도서가 삭제되었습니다.");
        } else {
            System.out.println("도서가 존재하지 않습니다.");
        }
    }

    private void insertBook() {
        // 배열에 빈방이 있는지 확인
        int index = -1;
        // 10 : 0-9
        for (int i = 0; i < bookList.length; i++) {
            if (bookList[i] == null) {
                index = i;
                break;
            }
        }
        // 빈방이 없는경우
        if (index < 0) {
            System.out.println("도서를 추가할 수 없습니다.");
            return;
        }

        System.out.println("도서 추가 ======");
        // 도서명, 도서번호, 도서작가
        int no = ScannerUtil.getInt("도서번호");
        String title = ScannerUtil.getString("도서명");
        String author = ScannerUtil.getString("작가");

        // 배열에 새로운 책을 추가!
        bookList[index] = new Book(no, title, author);
        System.out.println("도서등록!!!!!!");

    }

    // 도서 대여
    public void rentBook() {

        int bookNo = 0;
        while (true) {
            // 스캐너로 번호(인덱스)를 입력 받는다
            bookNo = ScannerUtil.getInt("도서번호");
            // 10개 = 0 - 9
            if (bookNo >= bookList.length) {
                System.out.println("책번호를 확인후 다시 입력 해주세요");
            } else {
                break;
            }
        }
        // 해당 인덱스에 있는 도서의 상태가 대여중이면
        Book book = bookList[bookNo];

        if (book != null) {
            // 메세지 처리를 하고 (이미 대여중입니다.)
            // boolean 타입인경우, get이 아니라 is로 생성됨
            if (book.isRent()) {
                System.out.println("이미 대여중입니다.");
            } else {
                // 아니면 도서의 상태를 대여(true)로 변경
                // 대여처리
                // 누가, 언제
                book.setRent(true);
                System.out.println("대여완료!!");
            }
        } else {
            System.out.println(bookNo + "는 비어 있습니다.");
        }
    }

    // 도서반납
    public void returnBook() {

        // 스캐너로 번호(인덱스)를 입력 받는다
        int bookNo = ScannerUtil.getInt("도서번호를 입력해주세요");

        // 해당 인덱스에 있는 도서의 상태가 대여중이면
        Book book = bookList[bookNo];

        if (book.isRent()) {
            // 도서의 상태를 반납(false)으로 변경
            book.setRent(false);
            System.out.println("반납 완료!!!");
        } else {
            // 아니면 메세지 처리를 하고 (이미 대여중입니다.)
            System.out.println("반납 가능한 상태가 아닙니다.");
        }

    }

    // 배열정보를 하나의 문자열로 생성하여 반환
    // 메서드 재정의
    @Override
    public String toString() {
        String str = "";
        // 책번호를 입력받은 인덱스를 이용하여 입력 받도록 처리
        int i = 0;
        for (Book b : bookList) {
            // str += b.toString() ;
            // null 에다 .찍으면 NullPointerException
            // null 참조변수가 아무것도 참조하고 있지 않은경우
            str = str + "[" + i + "]" + b + "\n";
            i++;
        }
        return str;
    }
}
