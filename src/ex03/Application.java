package ex03;

import java.util.Arrays;

import ex03.practice.NonStaticSample;

public class Application extends Object {
    // 인스턴스 멤버(인스턴스 필드, 인스턴스 메서드)
    int age = 10;
    // 정적 멤버(정적 필드, 정적 메서드)
    static double pi = 3.14159;

    public static void main(String[] args) {

        // 정적멤버는 정적멤버만 사용 할 수 있다
        // System.out.println(age);
        System.out.println(pi);
        // 외부에 있는 정적 멤버를 사용 하는 방법
        // 클래스이름.메서드이름
        System.out.println(NonStaticSample.nonstatic_pi);

        // 정적멤버는 생성하지 않고 사용 할 수있다
        Arrays.toString(new int[] { 1, 2, 3 });

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
