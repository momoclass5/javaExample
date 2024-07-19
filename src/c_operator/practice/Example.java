package c_operator.practice;

import java.util.Scanner;

public class Example extends Object{

    public void method(){
        // 증감연산자 : 피연산자의 값을 1증가시키거나 1감소 시킬때 사용
        int x=1;
        int y=1;

        // 값을 증가시키고 연산
        int res1 = ++x + 10;
        // 연산후 값을 증가
        int res2 = y++ + 10;

        System.out.println("res1 : "+ res1);
        System.out.println("res2 : "+ res2);
        System.out.println("x: "+ x);
        System.out.println("y: "+ y);

        ++x; 
        x = x + 1;

        --x;
        x = x-1;

    }

    // 삼항연산자
    // (조건식) ? 참일때반환할값 : 거짓일때반환하는값;
    public void method2(){
        int score = 80;
        // score값이 90보다 크거나 같으면 A를 반환 아니면 B를 반환
        String res = (score>=90) ? "A" : (score>=80)?"B":"C";
        System.out.println(res);
    }

    Scanner s = new Scanner(System.in);
    public void login(){
        while(true){
            System.out.print("아이디 : ");
            String id = s.nextLine();
            System.out.print("비밀번호 : ");
            String pw = s.nextLine();
            id = id.trim(); // 공백제거
            pw = pw.trim();
            // 입력받은값을 화면에 출력
            System.out.printf("id : %s, pw : %s\n", id, pw);
            if(id.equals("java") 
                        && pw.equals("12345")){
                // 만약 id = java, pw = 12345 이면 로그인 성공을 출력
                System.out.println("로그인 성공");
                break;
            }else{
                // 아니면 로그인실패를 출력
                System.out.println("로그인 실패");
            }
        }

    }

    public void method3(){
        int dan = 2;
        // for : 반복문
        // for (초기식; 조건식; 증감식;) {}
        // i는 1부터 10보다 작을때까지 실행해! 코드블럭이 끝날때마다 i값을 1씩 증가시켜
        System.out.println(dan + "단");
        for(int i=1; i < 10 ; i++){
            // 1~9까지 반복실행
            System.out.printf("%d * %d = %d\n", dan, i, dan*i);
        }

    }

}
