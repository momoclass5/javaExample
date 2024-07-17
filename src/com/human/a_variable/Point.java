package com.human.a_variable;

import java.util.Scanner;

public class Point extends Object{
    public static void main(String[] args) {
       // 생성
       Point p = new Point();
       // 사용 - 변수 이름에 쩜을 찍으면 사용가능한 필드, 메서드 목록이 나옵니다
       p.getPoint();


    }


    // 필드, 지역변수
    Scanner scan = new Scanner(System.in);


    // 접근제한자를 주지 않은 경우
    // , 같은 패키지 내부에서만 사용 할 수 있다
    // private : 외부에서 접근 불가!
    private void getPoint(){
        System.out.println("성적 계산기");
        // 사용자로 부터 성적을 입력 받는다
        // 국어성적, 영어성적, 수학성적
        // 평균을 구한다
        // 등급을 출력한다 (평균이 >=90 A, >=80 B, >=70 c , >=60 D, F)




    }
}
