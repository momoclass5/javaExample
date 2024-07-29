package ex08;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import ex08.practice.Library;

public class Application {
    public static void main(String[] args) {
        // SET을 이용한 로또
        // 저장순서는 유지되지 않고 객체를 중복저장 할 수 없다
        // 추첨, 로또 등 중복 제거가 필요한 로직에 사용 될 수있다
        Set<Integer> lotto = new HashSet<Integer>();
        System.out.println("size : " + lotto.size());
        while (lotto.size() < 6) {
            int num = (int) (Math.random() * 45) + 1;
            lotto.add(num);
        }

        System.out.println(lotto);
        System.out.println(lotto.size());

        System.out.println("==================");
        // MAP 인터페이스
        // key, value형태로 구성
        // key는 중복 저장 될수 없다!
        Map<String, Integer> map = new HashMap<>();
        // 객체 추가
        map.put("홍길동", 30);
        // 객체 찾기
        int i = map.get("홍길동");
        System.out.println(i);
        // 객체 삭제
        map.remove("홍길동");

        System.out.println(map.size());

        // Library lib = new Library();
        // lib.menu();

    }
}
