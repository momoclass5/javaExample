package com.human;

import a_variable.InputOutput;
import a_variable.VariableType;

public class A_App {
    public static void main(String[] args) {
        // 생성
        InputOutput io = new InputOutput();
        io.print();
        System.out.println("===================");


        // 생성
        VariableType v = new VariableType();
        // 실행
        v.type1();
        System.out.println("=================");
        v.type2();
        v.type3();
        v.type4();
        v.type5();
        v.type6();
    }
}
