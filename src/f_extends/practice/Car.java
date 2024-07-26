package f_extends.practice;

public class Car {
    // 자동차의 부품으로 타이어객체를 사용 하고 있다
    Tire frontLeftTire;
    Tire backLeftTire;
    Tire frontRightTire;
    Tire backRightTire;

    // 상수는 모두 대문자로 되어 있기 때문에 _를 넣어서 구분
    public static final int FRONT_LEFT = 1;

    public Tire getFrontLeftTire() {
        return frontLeftTire;
    }

    // 생성자를 통한 필드 초기화
    public Car() {
        frontLeftTire = new Tire(Car.FRONT_LEFT, 5);
        backLeftTire = new Tire("뒤 왼쪽", 2);
        frontRightTire = new Tire("앞 오른쪽", 3);
        backRightTire = new Tire("뒤 오른쪽", 4);
    }

    // 매개변수의 자동타입변환
    public Car(Tire t1, Tire t2, Tire t3, Tire t4) {
        frontLeftTire = t1;
        frontRightTire = t2;
        backLeftTire = t3;
        backRightTire = t4;

    }

    // 달린다
    /**
     * 
     * @return 0: 정상, [1, 2, 3, 4] : 비정상(바퀴 터짐)
     */
    int run() {
        // 타이어를 1회선 시키고 바퀴가 터지면 멈춥니다
        // 반환값이 true 가 아니면
        if (!frontLeftTire.roll()) {
            stop();
            return 1;
        }
        if (!backLeftTire.roll()) {
            stop();
            return 2;
        }
        if (!frontRightTire.roll()) {
            stop();
            return 3;
        }
        if (!backRightTire.roll()) {
            stop();
            return 4;
        }

        return 0;
    }

    // 멈춘다
    // 펑크가 났을때 실행
    void stop() {
        System.out.println("[정지]");
    }
}
