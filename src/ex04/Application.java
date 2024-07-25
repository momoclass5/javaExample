package ex04;

import ex04.practice.StaticSample;

public class Application {
    public static void main(String[] args) {
        // StaticSample.str;

        // value 값 초기화
        StaticSample.setValue("Java");
        // value 값 출력
        System.out.println("value : " + StaticSample.getValue());

        // value 값 대문자로 변경
        StaticSample.toUpper();
        System.out.println("대문자로 변경 : " + StaticSample.getValue());

        // 길이 출력
        System.out.println("길이 : " + StaticSample.valueLength());

        // PROGRAMMING 을 연결
        System.out.println(StaticSample.valueConcat("PROGRAMMING"));

        // setChar메서드를 실행해 J를 C로 변경
        StaticSample.setChar(0, 'C');

    }
}
