package com.human;

import com.human.a_variable.Variable;

public class A_variableApp {
    public static void main(String[] args) {
        // 생성
        Variable v = new Variable();
        // 호출 (변수명.메서드명())
        v.var1();
        v.var2();
        System.out.println("======================");
        // 메서드 호출
        v.gugudan();
    }
}
