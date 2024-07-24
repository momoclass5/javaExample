package ex03;

import ex03.practice.NonStaticSample;

public class Application extends Object {
    public static void main(String[] args) {
        NonStaticSample nss = new NonStaticSample();

        // 반환타입이 없는 메서드는 출력할 수 없음
        // 실행하고 끝!!!!!!
        nss.printLottoNumbers();

        nss.outputChar(10, 'a');
        System.out.println();
        System.out.println(nss.mySubstring("apple", 2, 5));

        nss.method1(1, 2, 3, 4, 5);
        nss.method1(1, 2, 3);
        nss.method2(new int[] { 1, 2, 3, 4, 5 });
        nss.method1("일", "이", "삼");
    }
}
