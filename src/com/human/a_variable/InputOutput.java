package com.human.a_variable;

public class InputOutput {
    public void print(){
        // 콘솔창 출력 메서드
        System.out.println("출력후 줄바꿈");
        System.out.print("출력");


        int dan = 2;
        // 형식화된 문자열을 출력
        // 형식문자열(%d 정수, %f 실수, %s)을 뒤에 나오는 변수로 대체
        // %의 갯수만큼 변수또는 값이 올 수 있다!
        System.out.printf("%d * 1 = %d", dan, dan * 1);
        System.out.println(dan + " * 1 = " + dan *1);

        System.out.printf("이름 : %s, 나이:%d", "홍길동", 25);
    }
}
