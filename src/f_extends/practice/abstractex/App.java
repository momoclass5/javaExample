package f_extends.practice.abstractex;

public class App {
    public static void main(String[] args) {
        // 추상클래스는 직접 생성 할 수 없다!
        // Phone phone = new Phone("홍길동");

        SmartPhone sp = new SmartPhone("홍길동");
        // 생성 할 수 없지만 타입으로 이용이 가능하다
        // 타입으로 사용할 경우, 추상클래스를 상속받아 구현된 객체들이 사용 될 수 있다
        Phone p = new SmartPhone("김길동");
    }
}
