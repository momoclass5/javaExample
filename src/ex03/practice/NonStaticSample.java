package ex03.practice;

import java.util.Arrays;

public class NonStaticSample {

    public void printLottoNumbers() {
        // 1~45까지의 임의의 정수 6개가 중복되지 않게 발생시켜 출력하는 메소드
        int[] lotto = new int[6];
        // i= 0 ~ 5 6번 실행
        for (int i = 0; i < lotto.length; i++) {
            lotto[i] = (int) (Math.random() * 45) + 1;
            for (int j = 0; j < i; j++) {
                if (lotto[j] == lotto[i]) {
                    i--;
                    break;
                }
            }
        }
        System.out.println(Arrays.toString(lotto));

        // 응용 --> 오름차순 정렬로 출력
        // int[] sortLotto = sort(lotto);
        sort(lotto, false); // Arrays.sort(lotto);
        System.out.println(Arrays.toString(lotto));

    }

    /**
     * int[]을 매개변수로 받아서 정렬후 정렬된 int[]을 반환
     * 
     * boolean타입의 매개변수를 받아서
     * true : 오름차순
     * false : 내림차순
     * 
     * @param lotto
     * @return
     */
    // private int[] sort(int[] lotto) {
    private void sort(int[] lotto, boolean sort) {
        // 정렬 i=기준이 되는 방
        for (int i = 0; i < lotto.length; i++) {
            // j = 비교대상
            for (int j = i + 1; j < lotto.length; j++) {
                if (sort) {
                    if (lotto[i] > lotto[j]) {
                        int temp = lotto[i];
                        lotto[i] = lotto[j];
                        lotto[j] = temp;
                    }
                } else {
                    if (lotto[i] < lotto[j]) {
                        int temp = lotto[i];
                        lotto[i] = lotto[j];
                        lotto[j] = temp;
                    }
                }

            }
        }
        // return lotto;
    }

    public void outputChar(int num, char c) {
        // 매개변수로 전달받은 문자 c를 전달받은 num 갯수 만큼 출력하는 메소드
    }

    public char alphabette() {
        // 알파벳 범위의 임의의 영문자를 하나 발생시켜 리턴하는 메소드
        // 주의! 소문자 대문자 모두 포함
        return 'a';
    }

    public String mySubstring(String str, int index1, int index2) {
        // 매개변수로 문자열과 시작 인덱스, 끝 인덱스를 전달 받고
        // 해당 인덱스 범위의 문자열을 추출하여 리턴
        // 단, 전달받은 문자열은 반드시 값이 있어야 한다. --> 없으면 null 리턴
        return "";
    }
}
