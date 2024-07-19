package a_variable;

import java.util.Scanner;

public class Point {
    public static void main(String[] args) {
        // 생성
        Point p = new Point();
        // 학생 학생1 = new 학생();
        // 사용 - 변수 이름에 쩜을 찍으면 사용가능한 필드, 메서드 목록이 나옵니다
        p.getPoint();

    }

    // 필드, 지역변수
    Scanner scan = new Scanner(System.in, "MS949");

    // 접근제한자를 주지 않은 경우
    // , 같은 패키지 내부에서만 사용 할 수 있다
    // private : 외부에서 접근 불가!
    private void getPoint() {
        // 반복문
        // ()안의 값이 참이면 코드블럭을 반복해서 실행

        // 10번 반복실행
        // 코드 자동정렬 : shift + alt + f
        int i=0;
        while (true) {
            System.out.println(">>>>>>>>>>>>>>>>>>>>    i=" + i);
            if(i==2){
                break;
            }
            // i = i + 1; 
            // 증감연산자를 이용해서 i의 값을 증가 시킴
            //i++;  
            i++;

            System.out.println("성적 계산기");
            // 사용자로 부터 성적을 입력 받는다
            System.out.println("이름 : ");
            String name = scan.nextLine();

            int kor, eng, math;  
            double avg;
            // int 국어, 영어, 수학;
            // 국어성적, 영어성적, 수학성적
            System.out.println("국어성적 : ");
            kor = scan.nextInt();
            System.out.println("영어성적 : ");
            eng = scan.nextInt();
            System.out.println("수학성적 : ");
            math = scan.nextInt();
            // 남겨진 엔터를 제거
            scan.nextLine();

            // 평균을 구한다
            // 정수의 연산 결과는 정수를 반환
            // int타입의 값을 double타입에 대입 하면 자동형변환이 되어짐
            // ✨ 정수와 실수의 연산 -> 정수가 실수로 타입이 변환된후 연산
            avg = (kor + eng + math) / 3.0;
            // 연산자의 우선순위가 동일하다면 왼쪽에서 부터 실행되어 진다!
            // 괄호로 묶거나 변수에 담아서 출력
            System.out.println("이름 : " + name);
            System.out.println("총계 : " + (kor + eng + math));
            System.out.printf("평균점수 : %.2f, 학점:", avg);

            // 등급을 출력한다 (평균이 >=90 A, >=80 B, >=70 c , >=60 D, F)
            if (avg >= 90) {
                System.out.println("A");
            } else if (avg >= 80) {
                System.out.println("B");
            } else if (avg >= 70) {
                System.out.println("C");
            } else if (avg >= 60) {
                System.out.println("D");
            } else {
                System.out.println("F");
            }
        }

    }
}
