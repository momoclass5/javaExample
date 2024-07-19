package a_variable;

import java.util.Scanner;

public class Menu1 {
    // 실행을 담당
    // 객체를 생성하고 메서드 호출
    public static void main(String[] args) {
        // 생성
        Menu1 m = new Menu1();
        // 호출
        m.menu();
    }

    Scanner s = new Scanner(System.in);

    // 접근제한자 반환타입 메서드명 (매개변수의타입 매개변수의이름)
    public void menu(){
        while (true) {
            printMenu();            // 1. 메뉴를 출력 합니다.

            int menu = s.nextInt(); // 2. 사용자의 입력을 받습니다.
            s.nextLine();           //    숫자를 입력받고 남은 엔터를 제거하는 역할

            // 제어문 switch : 사용자가 입력한 메뉴에 따라 메서드를 호출
            // switch문에서 break는 switch문을 벗어나는 용도로 사용됨!!! -> 반복문탈출 안됨

            switch (menu) {         // 3. 사용자의 입력에 따라 기능을 실행
                case 1:
                    rentBook(); // 도서대여 호출
                    break;
                case 2:
                    returnBook(); // 도서반납 호출
                    break;
                case 3:
                    exitBook(); // 종료 호출
                    break; 
                default:
                    System.out.println("메뉴를 확인후 다시 입력 해주세요");
                    break;
            }
        }

    }

    private void printMenu() {
        System.out.println("XX 도서관에 오신걸 환영합니다.");
        System.out.println("1. 도서 대여");
        System.out.println("2. 도서반납");
        System.out.println("3. 종료");
        System.out.print("메뉴를 선택해주세요 : ");
    }

    private void exitBook() {
        System.err.println("종료 선택");
        System.out.println("정말 종료 하시겠습니까?(Y/N)");
        String res = s.nextLine();
        //if(res.equals("Y")){    <- 대소문자를 비교해서 비교 Y
        // 대소문자를 비교하지않고 비교하는거
        // 문자열을 비교할때는 ==을 사용하지 않고 메서드를 이용해서 비교한다!!!!!!
        if(res.equalsIgnoreCase("Y")){   // <- Y,y
            System.out.println("프로그램을 종료합니다");
            System.exit(-1);
        }
    }

    private void returnBook() {
        // 도서 반납
        System.err.println("도서 반납 선택");
    }

    private void rentBook() {
        // 도서 대여
        System.err.println("도서 대여 선택");
    }

    public void rent(){

    }

}
