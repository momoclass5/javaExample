package com.human.a_variable;

/**
 * while문장
 * 
 * 조건에 따라 반복할때 주로 사용
 * 조건이 참이면 코드블럭을 반복해서 실행
 * while(조건){
 *      코드...
 * }
 * 
 * 1. 조건이 false
 * 2. break 문장을 만났을때
 * 
 * 
 * 반복문
 *  break : 반복문 탈출
 *  continue : 다음 반복으로 이동
 */
public class WhileExample {
    public static void main(String[] args) {
        int i=0;
        
        // 1번찍고 끝
        while (true) {
            System.out.println("오늘도 맑음 " + i);
            i = i + 1;
            // 반복문 탈출
            break;
        }

        // 1 ~ 9 9번 실행
        while (i < 10) {
            System.out.println("오늘도 맑음 " + i);
            i = i + 1;
        }

        // 10 1번 실행
        while (true) {
            System.out.println("오늘도 맑음 " + i);
            i = i + 1;
            // 반복을 종료
            // 코드가 한줄인 경우, 코드블럭을 생략하고 작성 할수 있다
            if(i>10) break;
        }
    }
}
