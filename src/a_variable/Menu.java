package a_variable;

import java.util.Scanner;

public class Menu {
    public static void main(String[] args) {
        while(true){
            System.out.println("oo 도서관에 오신걸 환영합니다.================");
            System.out.println("1. 도서대여");
            System.out.println("2. 도서반납");
            System.out.println("3. 종료");
            System.out.println("==============================================");
            System.out.println("메뉴를 선택 해주세요 : ");

            int menu = s.nextInt();
            if(menu>3){
                System.out.println("메뉴가 존재하지 않습니다.");
            } else if(menu==1){
                rent();
            } else if(menu==2){
                returnBook();
            } else if(menu == 3){
                // 반복문 탈출
                break;
                // 프로그램 종료
                //System.exit(-1);

            }
        }
    }

    private static void returnBook() {
        System.out.println("도서 반납을 선택 하셨습니다.");

    }

    private static void rent() {
        System.out.println("도서대여를 선택 하셨습니다.");
    }

    // 정적 필드 = 생성하지않고 사용이 가능
    static Scanner s = new Scanner(System.in);

}
