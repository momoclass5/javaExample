package com.human.a_variable;

public class VariableType {
    public void type1(){
        // -128 ~ 127
        // 1byte = 8bit
        byte var1 = -128;
        byte var2 = 127;
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
}
