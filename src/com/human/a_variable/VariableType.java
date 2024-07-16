package com.human.a_variable;

public class VariableType {
    public void type1(){
        // -128 ~ 127
        // 1byte = 8bit
        byte var1 = -128;
        byte var2 = 127;

        // -32,768 ~ 32,767(0이 포함)
        short var = -32768;
        // error byte var2 = 128; 범위를 벗어나는 리터럴인 경우 컴파일 오류

        // 리터럴 : 정수인경우 int
        int var3 = 128;

        System.out.println(var1);
        System.out.println(var2);
        System.out.println(var3);
    }

    public void type2(){
        byte var1 = 10;
        byte var2 = 20;

        int i = 10;
        // 2진수
        int ii = 0b1011;
        // 8진수
        int iii = 013;
        // 16 진수
        int iiii = 0xB3;

        System.out.println("i : " + i);
        System.out.println("ii : " + ii);
        System.out.println("iii : " + iii);
        System.out.println("iiii : " + iiii);


        // byte타입의 연산시 int 타입으로 형변환이 이루어져 int 타입을 반환
        int var3 = var1 + var2;
        byte var4 = (byte)(var1 + var2);
    }

    public void type3(){
        // 문자리터럴 ''
        // 하나의 문자를 저장
        // 유니코드로 변환
        char var1 = 'A';
        int var2 = 'A';
        System.out.println(var1);
        System.out.println(var2);
    }

    public void type4(){
        // 기본타입변수 - 정수형, 실수형, boolean, char
        // 참조타입변수 - 기본타입외에는 참조타입
        // ex) String 
        // 이스케이프문자
        String str = "\"문자열\"";
        System.out.println(str);
    }

    public void type5(){
        // 실수타입
        // 리터럴 : 입력값
        //      정수 : int
        //      실수 : double
        // 리터럴의 타입을 명시
        // F,f를 붙여 줘야 합니다.
        float var1 = 1.5F;
        double var2 = 2.5;

        // 리터럴의 타입을 명시
        // L, l을 붙여 주어 타입을 알려준다.
        long var3 = 3000000000L;
        System.out.println(var2);
        System.out.println(var3);
    }

    public void type6(){
        // 논리 리터럴
        // 참 : true, 거짓 : false
        boolean res = true;
        // ()안의 문장이 참이라면 코드안의 블럭을 실행
        // 10>0
        if(true){
            System.out.println("true");
        }
        if(false){
            System.out.println("false");
        }

    }

}
