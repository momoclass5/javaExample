package com.human;

// 패키지가 다른경우 import구문을 이용하여 위치를 알려줌!
import com.human.ex01.Ex01;

// 실행 클래스
public class Application {
    // 실행 메서드
    public static void main(String[] args) {
        
        // 생성 : 기능이 구현되어 있는 클래스를 
        Ex01 e = new Ex01();
        e.print();
    }
}
