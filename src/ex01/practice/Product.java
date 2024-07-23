package ex01.practice;

import lombok.Data;

@Data
public class Product {

    // 필드 - 생성자를 통해서 객체가 생성될때 기본값으로 자동 초기화
    // private : class 내부에서만 접근 가능
    public String id; // 참조타입의 기본값인 null로 초기화
    private String name;
    private String site;
    private int price; // 정수타입의 기본값 0으로 초기화
    private double tax; // 실수타입의 기본값 0.0으로 초기화

    // 기본생성자 - 매개변수가 없는 생성자
    // 생성자가 없다면 컴파일러에 의해 자동으로 생성되는 생성자
    // 만약 생성자가 하나라도 있다면 자동 생성 하지 않는다
    public Product() {

    }

    // 생성자 = 초기화
    public Product(String p_id, String name, String site, int price, double tax) {
        // 매개변수로 받아온 값을 필드에 저장
        id = p_id;
        // 필드명과 매개변수의 이름이 같을때 메서드 안에서는 매개변수가 우선 된다
        // 필드에 접근하기 위해서 this라는 키워드를 이용한다!!!!!!!!!!
        // 매개변수로 넘어온 name 변수의 값을 필드 name에 저장
        this.name = name;
        this.site = site;
        this.price = price;
        this.tax = tax;

    }

    // 메서드
    public String information() {
        // 변수 - 초기화이후에 사용이 가능
        String str;
        // System.out.println(str);

        return "id : " + id
                + " name : " + name
                + " site : " + site
                + " price : " + price
                + " tax : " + tax;

    }

    // setter, getter
    // 캡슐화
    // 직접 접근을 막고 setter, getter 메서드를 통해서
    // 필드가 가진 값을 세팅 하거나 반환
    // setter : 외부로 부터 값을 받아서 필드에 저장
    // getter : 필드의 값을 외부로 전달
    public void setPrice(int price) {
        // 필드에 매개변수로 넘어온 값을 저장
        this.price = price;
    }

    public void setTax(double tax) {
        this.tax = tax;
    }

    public String getName() {
        return name;
    }

    public int priceAddTax() {
        double res = (price * tax) + price;
        return (int) res;
    }
}
