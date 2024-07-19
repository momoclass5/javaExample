package a_variable;

public class CastingExample {
    public static void main(String[] args) {
        
        int intValue = 44032;
        // 자동형변환
        // 값의 허용범위가 작은 타입이 큰타입으로 저장되는경우
        // byte < short < int < long < float < double
        double doubleValue = intValue;
        System.out.println("doubleValue : " + doubleValue);

        // 강제형변환
        // int타입의 값을 char타입의 변수에 대입
        char charValue = (char)intValue;
        System.out.println("charValue : " + charValue);

        double doubleValue2 = 3.14;
        intValue = (int) doubleValue2;
        System.out.println("intValue : " + intValue);

        // 정수타입 변수가 연산식에서 사용될 경우
        byte x=10;
        byte y=20;
        // 연산시 int타입으로 자동 형변환
        // 오류 byte res = x + y;
        int res = x + y;

        // ✨문자열을 기본타입으로 강제 타입 변환
        // 문자열안에 숫자가 들어 있는 경우 에만 가능!!!!
        String s = "hi";
        // int : 기본타입, Integer : 객체타입
        // 문자가 들어 있는경우 오류 발생 : NumberFormatException
        // ERROR int i = Integer.parseInt(s);
        String str = "100";

        byte byteValue = Byte.parseByte(str);
        System.out.println(byteValue);
        short shortValue = Short.parseShort(str);
        System.out.println(shortValue);
        int iValue = Integer.parseInt(str);
        System.out.println(iValue);

        long longValue = Long.parseLong("400000000000");
        System.out.println(longValue);
        float floatValue = Float.parseFloat("12.345");
        System.out.println(floatValue);
        double dValue = Double.parseDouble("12.345");
        System.out.println(dValue);

        // 논리타입 
        // 참 : true, 거짓 : false
        boolean booleanType = Boolean.parseBoolean("true");
        System.out.println(booleanType);

        // 기본타입 -> 문자열로 형변환 하는 방법
        String sss = String.valueOf(100);
        String ss = "100";
        // 더하기 연산시 문자열이 피연산자인 경우, 문자열로 형변환후 결합
        String ssss = 100 + "";




    }
}
