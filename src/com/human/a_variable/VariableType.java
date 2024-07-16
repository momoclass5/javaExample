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
        String str = "문자열";
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
}
