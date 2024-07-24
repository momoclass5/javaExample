package e_object.practice;

/**
 * 생성자 호출
 * - 생성자가 다른 생성자를 호출 하는 것
 * - this()를 이용해서 생성자를 호출 할 수 있다
 * - 꼭 첫줄에 나와야 한다
 */
public class Car {
    String company = "현대자동차";
    String model;
    String color;
    int maxSpeed;

    public Car() {
    }

    public Car(String model) {
        /*
         * this.model = model;
         * color = "은색";
         * maxSpeed = 200;
         */
        // 생성자의 호출은 무조건 첫번째 줄에 나와야 한다
        // company="SM"; <- 코드가 먼저 오면 Err
        this(model, "은색", 200);
    }

    public Car(String model, String color, int maxSpeed) {
        this.model = model;
        this.color = color;
        this.maxSpeed = maxSpeed;
    }

    public String info() {
        return company + " " + model + " " + color + " " + maxSpeed;
    }
}
