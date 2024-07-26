package ex07;

import ex07.practice.Library;

public class Application {
    public static void main(String[] args) {
        // 생성자에 의해서 책 배열이 생성된 도서관이 생성
        Library lib = new Library();
        // println에 참조변수가 들어오면 참조변수의 toString결과가 출력된다
        System.out.println(lib);
        lib.showMenu();
    }
}
