package f_extends.practice;

public class App {
    public static void main(String[] args) {
        Car car = new Car();
        for (int i = 0; i < 10; i++) {
            int res = car.run();
            switch (res) {
                case 1:
                    Tire fl = car.frontLeftTire;
                    String location = fl.location;

                    // 자동형변환
                    car.frontLeftTire = new KumhoTire(car.frontLeftTire.location, 10);
                    System.out.println(car.frontLeftTire.location + "타이어 교체 완료");
                    break;
                case 2:
                    car.backLeftTire = new KumhoTire("뒤 왼", 8);
                    break;
                case 3:
                    car.frontRightTire = new HankookTire("앞 오", 10);
                    break;
                case 4:
                    car.backRightTire = new HankookTire("뒤 오", 8);
                    break;
                default:
                    break;
            }
        }

        System.out.println("=======================");

        // 매개변수에서도 자동 타입변환이 발생 할 수 있다
        Car car2 = new Car(new KumhoTire("", 10), new KumhoTire("", 10), new HankookTire("", 10),
                new HankookTire("", 10));

        System.out.println("=========================");
        // 한국타이어를 생성
        HankookTire hankookTire = new HankookTire("FL", 10);
        // 한국타이어가 가지고 있는 고유 속성
        hankookTire.speed = 100;

        // 자동형변환 (자식타입이 부모타입으로 변환)
        Tire t = hankookTire;
        // 부모타입으로 형변환시 부모가 가진 필드와 메서드에만 접근이 가능하다
        // 자식이 가지고 있는 고유한 멤버(속성이나 메서드)에 접근 할 수 없다
        // ERR int speed = t.speed;

        // 단, 재정의한 메서드의 경우 자식메서드가 호출된다!!!!!!!!!
        t.roll();

        // 강제형변환 : 부모타입을 본래 자식 타입으로 변경
        // 타입을 명시
        HankookTire hankookTire2 = (HankookTire) t;
        System.out.println(hankookTire2.speed);

        // 객체의 본래 타입을 확인
        // boolean res = 객체 instanceof 타입
        boolean res = t instanceof KumhoTire;

        // 본래 타입이 맞는지 확인후 형변환을 진행
        // 확인하지 않으면 예외(ClassCastException)가 발생하여 프로그램이 비정상적으로 종료될 수 있다
        if (res) {
            System.out.println("금호타이어로 형변환");
            // 원래 타입으로만 변환이 가능
            // 만들어진 타입으로만 변환이 가능하다
            KumhoTire kumhoTire = (KumhoTire) t;
        }
    }

}
