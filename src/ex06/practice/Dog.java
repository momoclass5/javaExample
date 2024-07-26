package ex06.practice;

public class Dog extends Animal {
    public static final String PLACE = "애견카페";
    private int weight;

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public Dog() {
        super(); // 생성자호출 생략가능
    }

    public Dog(String name, String kind, int weight) {
        // 부모생성자 호출
        super(name, kind);
        this.weight = weight;
    }

    // 클래스는 추상메서드를 가질수 없다
    // 추상클래스는 추상메서드를 가질수 있다 = 생성 할 수 없다!!
    @Override
    public void speak() {
        // super : 부모멤버에 접근할때 사용하는 키워드
        System.out.println(super.toString() + "몸무게는 " + weight + "kg입니다.");
    }

}
