package ex02;

import ex02.practice.Book;

public class Application {
    public static void main(String[] args) {
        // 기본생성자를 이용하여 첫 번째 Book 객체 생성
        Book book1 = new Book();

        // 매개변수 생성자를 이용하여 두 번째 Book 객체 생성 (사용 데이터 참고)
        Book book2 = new Book("자바의정석", 20000, 0.2, "윤상섭");

        // 객체가 가진 필드 값 출력 확인
        System.out.println(book1.information());
        System.out.println(book2.information());
        System.out.println("========================");
        // 첫 번째 객체가 가진 값을 setter를 이용하여 수정
        // 수정된 내용 출력 확인
        book1.setTitle("C언어");
        book1.setPrice(30000);
        book1.setDiscoundRate(0.1);
        book1.setAuthor("홍길동");
        System.out.println("수정된 결과 확인");
        System.out.println(book1.information());
        System.out.println("========================");
        // 각 객체의 할인율을 적용한 책 가격을 계산해서 출력
        // 할인된 가격 = 가격 – (가격 * 할인율)
        book1.printPrice();
        book2.printPrice();
    }
}
