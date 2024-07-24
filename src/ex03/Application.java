package ex03;

import ex03.practice.NonStaticSample;

public class Application {
    public static void main(String[] args) {
        NonStaticSample nss = new NonStaticSample();

        // 반환타입이 없는 메서드는 출력할 수 없음
        // 실행하고 끝!!!!!!
        nss.printLottoNumbers();
    }
}
