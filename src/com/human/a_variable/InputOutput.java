package com.human.a_variable;

import java.io.IOException;
import java.util.Scanner;

public class InputOutput {
    public static void main(String[] args) throws IOException {
        InputOutput io = new InputOutput();
        //io.print();
        //io.input();
        //io.inputScanner();
        io.bmi();
    }

    public void bmi(){
        // 사용자의 입력을 받기 위해서 Scanner 생성
        Scanner scan = new Scanner(System.in);
        System.out.println("이름 : ");
        System.out.println( scan.nextLine() );
        System.out.print("키(m) : ");
        // 사용자의 입력을 기다리고 있다가 엔터키가 입력되면 입력된 값을 반환
        // next 다음에 오는 타입이 숫자 타입인 경우, 문자를 입력하면 오류가 발생
        double height = scan.nextDouble();
        System.out.print("몸무계(kg) : ");
        double weight = scan.nextDouble();
        
        /*
        height=1.5;
        // double타입에 int 타입을 대입할 경우, 자동 형변환이 발생 하여
        // 오류가 발생하지 않고 값이 저장됩니다
        height=1111111;
        */
        System.out.println("=================");
        System.out.println("사용자 정보");
        System.out.println("=================");
        System.out.printf("키 : %.2fm, 몸무게 : %.2fkg\n", height, weight);
        
        double bmi = weight / (height*height); 
        System.out.printf("당신의 BMI는 %.1f입니다\n", bmi);

        // bmi값에 따라 비만도 출력
        // 만약 ()안의 값이 참이면 코드블럭을 실행
        // 코드가 한줄인 경우, 코드블럭을 생략 할 수 있다
        if(bmi>25)
            System.out.println("비만 입니다.");
        else if(bmi>23)
            System.out.println("과체중 입니다.");
        else if (bmi>18.5) 
            System.out.println("정상 입니다.");
        else 
            System.out.println("저체중 입니다.");
            
        






    }

    public void input() throws IOException{
        int keyCode;

        // 입력을 대기하고 있다가 키보드의 키가 눌리면
        // 해당 키에 해당하는 키코드를 변수에 저장
        keyCode = System.in.read();
        System.out.println("keyCode : " + keyCode);
        System.out.println((char)keyCode);


    }

    public void inputScanner(){
        Scanner scan = new Scanner(System.in);
        // 엔터키가 입력될때까지 대기 하고 있다가
        // 엔터키가 입력되면 그동안입력된 값을 반환합니다.
        // 1. 변수에 저장후 출력
        System.out.println("이름을 입력해주세요 : ");
        String str = scan.nextLine();
        System.out.println(str);
        // 2. 반환받은값을 바로 출력
        System.out.println("나이를 입력해주세요 : ");
        System.out.println(  scan.nextLine() );


    }

    public void print(){
        // 콘솔창 출력 메서드
        System.out.println("출력후 줄바꿈");
        System.out.print("출력");


        int dan = 2;
        // 형식화된 문자열을 출력
        // 형식문자열(%d 정수, %f 실수, %s)을 뒤에 나오는 변수로 대체
        // %의 갯수만큼 변수또는 값이 올 수 있다!
        System.out.printf("%d * 1 = %d\n", dan, dan * 1);
        System.out.println();
        System.out.println(dan + " * 1 = " + dan *1);

        // \n : 줄바꿈처리
        System.out.printf("이름 : %s, 나이:%d\n", "홍길동", 25);

        System.out.printf("%6d\n", 1234);
        System.out.printf("%6d\n", 12345);
        System.out.printf("%6d\n", 123456);
        System.out.printf("%6d\n", 1234567);
        System.out.printf("%6d\n", 12345678);
    
        // BMI
        System.out.printf("%.2f", 123.123);

        System.out.println();

    }
}
