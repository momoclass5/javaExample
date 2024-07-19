package b_conditional;

import b_conditional.practice.IfExample;

public class App {
    public static void main(String[] args) {
        
        IfExample ie = new IfExample();
        ie.method();
        //ie.printGender();

        // 메서드를 호출할때는 매개변수의 값만 입력
        // 매개변수의 타입은 매서드의 선언부에 설계되어 있다!
        // int i = ie.add(1,2); // -> 메서드의 선언부를 알수 있다
    }

}
