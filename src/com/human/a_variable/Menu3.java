package com.human.a_variable;

import java.util.Scanner;

public class Menu3 {

    Scanner scan = new Scanner(System.in);

    public static void main(String[] args) {
        Menu3 menu3 = new Menu3();
        menu3.library();
    }

    public void library(){

        while (true) {
            System.out.println("메뉴를 입력해줘!!!");
            int menu = scan.nextInt();

            if(menu == 1){
                a();
            }else if(menu ==2){
                b();
            }else if(menu == 3){
                c();
            }else{
                System.out.println("메뉴를 잘못입력해써!");
            }
        }
    }

    // 접근제한자를 쓰지 않은경우, 나와 같은 패키지 에서만 사용가능함
    void a(){ System.out.println("a메서드");}
    void b(){ System.out.println("b메서드");}
    void c(){ System.out.println("c메서드");}

}
