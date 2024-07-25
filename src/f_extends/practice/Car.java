package f_extends.practice;

public class Car {
    // 자동차의 부품으로 타이어객체를 사용 하고 있다
    Tire frontLeftTire;
    Tire backLeftTire;
    Tire frontRightTire;
    Tire backRightTire;

    // 생성자를 통한 필드 초기화
    public Car() {
        frontLeftTire = new Tire("앞 왼쪽", 5);
        backLeftTire = new Tire("뒤 왼쪽", 2);
        frontRightTire = new Tire("앞 오른쪽", 3);
        backRightTire = new Tire("뒤 오른쪽", 4);
    }

    int run() {
        // 타이어를 1회선 시키고 바퀴가 터지면 멈춥니다
        if (!frontLeftTire.roll()) {
            stop();
            return 1;
        }
        if (!backLeftTire.roll()) {
            stop();
            return 1;
        }
        if (!frontRightTire.roll()) {
            stop();
            return 1;
        }
        if (!backRightTire.roll()) {
            stop();
            return 1;
        }

        return 0;
    }

    // 펑크가 났을때 실행
    void stop() {
        System.out.println("[정지]");
    }
}
