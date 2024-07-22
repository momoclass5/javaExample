package d_array;

import d_array.practice.ArrayEx;
import d_array.practice.ArrayStringEx;

public class App  {
    public static void main(String[] args) {

        ArrayStringEx ase = new ArrayStringEx();
        ase.method1();
        System.out.println("======================");

        ArrayEx ae = new ArrayEx();
        //ae.lotto();
        //ae.array_error();
        //ae.lotto1();
        ae.lotto2();

        // 패키지명을 포함한 풀경로@메모리주소(16진수)
        System.out.println(ae);
        // 참조타입의 변수를 출력문을 통해서 출력시 toString메서드가 출력됩니다!!!
        System.out.println(ae.toString());

    }
}
