package ex03;

public class AppTest {
    public static void main(String[] args) {
        String str = "abcd";

        System.out.println(str.toUpperCase());

        str = "ABCD";
        // 소문자로 변경후 반환
        System.out.println(str.toLowerCase());
        // 문자열의 길이를 반환
        System.out.println(str.length());
        // 문자열을 합쳐서 반환하는 메서드
        System.out.println(str.concat("test"));
        // 인덱스의 위치에 해당하는 문자를 반환
        System.out.println(str.charAt(3));
        // 문자열의 인덱스를 초과 하는 경우 오류 발생
        // System.out.println(str.charAt(4));
        System.out.println((int) str.charAt(3));

    }
}
