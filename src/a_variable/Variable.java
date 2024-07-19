package a_variable;

// 1. 클래스 선언
public class Variable {
    // 전역변수 : 필드
    // 클래스 어디서나 사용이 가능한 변수
    // new 연산자를 만나서 생성될 때, 타입의 기본값을 초기화가 됩니다
    int x;
    
    public void var3(){
        // 지역변수 : 코드블럭 안에서만 사용 가능한 변수
        // 초기화(메모리에 저장)를 하지 않으면 사용할 수 없다
        int value;
        // error int res = value + 10;
        int res1 = x + 10; 

        // 변수의 값을 출력
        // 변수명만 입력
        // ""안에 입력하는것은 문자열로 인식 되어짐
        System.out.println("res1");
        System.out.println(res1);

        res1 = 100;
        System.out.println("100으로 변경 : " + res1);


    }
    
    // 메서드
    public void method1(){

    }
    // 생성자
    public Variable(){

    }

    // 2. 메서드 선언
    public void var1(){
        // 타입 변수이름
        /*  
            int 정수
            double 실수
            char 하나의 문자
        */
        // 변수 : 값을 재사용 하기 위해 메모리에 저장
        // 변수 선언
        int x;
        // 값을 대입
        x = 10;


        // 변수 선언과 동시에 대입
        int y = 20;

        // 여러개의 변수를 한번에 선언
        int a,b,c;

        // 값을 대입하지 않고 사용(출력)시 컴파일 오류 발생
        // System.out.println(a);


        // 변수의 값을 출력
        System.out.println("x : " + x);

        // 변수명 규칙
        /*
         * 첫번째 자리에 숫자가 올수 없음 
         *  특수문자중 $,_만 가능 ex) 1a, @a 안됨!
         * 소문자로 시작하고 단어가 연결될 경우 
         *  연결되는 단어의 첫글자를 대문자로 작성 (약속)
         * 대소문자를 구분 
         * 동일한 이름의 변수를 사용할 수 없음
         * 길의제한없음
         * 저장된값이 무엇인지 알기쉽게 이름을 짓도록 한다!
         */
        

        
    }

    public void var2(){
        // 변수 x를 선언하고 10을 대입
        // 변수선언
        int x;
        // System.out.println(x);
        // 변수 초기화 : 변수에 최초로 값이 저장 될때 변수가 메모리에 생성
        x = 10;
        // 변수 y를 선언하고 20을 대입
        int y = 20;
        // 변수의 값을 출력 하기 위해서 변수명을 이용
        System.out.println("x : " + x);
        System.out.println("y : " + y);
        System.out.println("x+y : " + x+y);
        System.out.println("x*y" + x*y);
        System.out.println(x/y); // 나누기
        System.out.println(x%y); // 나머지

    }

    /*
     * 구구단을 출력
     */
    public void gugudan(){
        int x = 3;
        
        // "문자열"
        System.out.println(x + "단");
        System.out.println(x + " * 1 = " + (x * 1));
        System.out.println(x + " * 2 = " + (x * 2));
        System.out.println(x + " * 3 = " + (x * 3));
        System.out.println(x + " * 4 = " + (x * 4));
        System.out.println(x + " * 5 = " + (x * 5));




        
        System.out.println("2단");
        System.out.println("2 * 1 = 2");
        System.out.println("2 * 2 = 4");
        System.out.println("2 * 3 = 6");
        System.out.println("2 * 4 = 8");
        System.out.println("2 * 5 = 10");
        System.out.println("2 * 6 = 12");
        System.out.println("2 * 7 = 14");
        System.out.println("2 * 8 = 16");
        System.out.println("2 * 9 = 18");
    }

}
