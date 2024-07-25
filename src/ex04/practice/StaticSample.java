package ex04.practice;

public class StaticSample {

    public static String str;
    /**
     * 필드는 클래스 내부라면 어디서든지 사용 할수 있다
     */
    private static String value;

    public static String getValue() {
        return value;
    }

    /**
     * 정적 멤버는 정적멤버만 사용이 가능
     * 인스턴스 멤버 - new 연산자를 만나서 힙영역에 생성되는 객체
     * 
     * 정적멤버 - static이 붙은 필드, 메서드
     * 
     * 클래스명.필드명
     * 클래스명.메서드명
     * 
     * @param value
     */
    public static void setValue(String value) {
        // this 인스턴스를 가르킬때 사용
        StaticSample.value = value;
    }

    /**
     * 필드명과 매개변수명이 같은경우
     * 매개변수가 우선되기때문에 필드를 선택하기 위해서
     * this라는 키워드를 사용
     * 
     * 인스턴스 - 생성되는 객체마다 다른값을 가지고 있다
     * 정적멤버(static) - this 를 사용 할 수 없다!!!!!
     * 
     * @param v
     */
    /*
     * public static void setValue(String v) {
     * // this 인스턴스를 가르킬때 사용
     * value = v;
     * }
     */
    public static void toUpper() {
        // value 필드 값을 모두 대문자로 변경
        value = value.toUpperCase();

    }

    public static void setChar(int index, char c) {
        System.out.println("=====================");
        // 전달받은 인덱스 위치의 value 값을 전달받은 문자로 변경하는 static 메소드

        // 문자열 -> char[]
        // char[] -> 문자열
        // 문자열을 문자의 배열로 만들어 줍니다
        char[] valueCharArr = value.toCharArray();
        // 배열이름[방번호]에 새로운 값을 대입
        valueCharArr[index] = c;
        // char[]을 문자열로 변경후 value에 저장
        value = String.valueOf(valueCharArr);
        System.out.println("=====================");

        // StringBuffer의 setCharAt를 이용해서 하나의 문자를 치환
        StringBuffer buffer = new StringBuffer(value);
        buffer.setCharAt(index, c);
        System.out.println(buffer.toString());

        System.out.println(value);

    }

    public static int valueLength() {
        // value 필드 값에 기록되어 있는 문자 갯수 리턴
        return value.length();
    }

    public static String valueConcat(String str) {
        // 문자열 값을 전달받아 value 필드 값과 하나로 합쳐서 리턴
        return value.concat(str);
    }
}
