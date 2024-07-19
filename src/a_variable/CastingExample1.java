package a_variable;

public class CastingExample1 {
    public static void main(String[] args) {

        long var1 = 2L;
        float var2 = 1.8F;
        double var3 = 2.5;
        String var4 = "3.9";
        // 문자열 -> 실수타입으로 형변환 -> 정수타입으로 형변환
        int var4int = (int)Double.parseDouble(var4);
        int result = (int)(var1+var2+var3+var4int); // result가 9가 되도록!
        System.out.println("result :" + result);



        System.out.println("=====================");
        int x = 5;
        int y=2;
        // 정수타입의 연산은 정수타입을 반환
        // 실수타입으로 계사하기 위해서 
        // 두 값중 하나라도 실수 타입이여야 함!!
        double res = (double)x/y;
        System.out.println("res : " + res);
    }
}
