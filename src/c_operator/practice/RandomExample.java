package c_operator.practice;

public class RandomExample {
    public static void main(String[] args) {
        // static : 정적메서드 
        // 실행하지 않고 사용
        // 정적메서드에서는 정적필드와 정적메서드만 사용 할수 있다
        // 일반메서드의 경우 생성후 호출이 가능하다
        RandomExample re = new RandomExample();
        // 0~99 100번
        /*for(int i=0;i<100;i++){
            re.random1();
        }*/
        // 초기값; 조건식; 증감식
        // for(int i=0;i<100;i++){
        //     re.random2();
        // }

        re.random3();
    }

    public void random3() {
        // 주사위 2개를 굴려서 나온 수를 출력 하세요 (num1, num2)
        // 0.000 ~ 5.999
        double num1 = Math.random() * 6;
        double num2 = Math.random() * 6;

        System.out.println("(" + num1 + ", " + num2 + ")");
        // 0~5 -> 1~6
        System.out.printf("(%d, %d)", (int)num1 + 1, (int)num2 + 1);
    }
    public void random2(){
        // 기능 : 0.0 ~ 1.0사이의 수를 반환
        // 변수선언 : 변수타입 변수명
        // int i = 0;
        // 최소값 0.00..1 최대값 0.99..9
        // 0.001 ~ 0.999
        // 범위를 구하기 위해서 곱하기를 이용
        // 0 ~ 곱한수-1
        double num = Math.random();
        System.out.println(num);
        
    }

    public void random1() {
        // 무작위수를 추출하는 방법
        // 0.0 ~ 1.0 사이의 수를 반환
        // 범위 구하기 
        // 0.001 ~ 0.999
        // 0.006 ~ 5.99
        double num = Math.random() * 6;
        // 형변환
        // 0 ~ 5
        // 1 ~ 6
        System.out.println((int)num + 1);
    }
}
