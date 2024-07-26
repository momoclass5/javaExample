package f_extends.practice.abstractex;

/**
 * 추상클래스 (abstract키워드를 이용하여 정의)
 * 
 * 설계의 용도로 사용
 * 생성할 수 없다 = 상속을 통해 자식 클래스만 만들수 있다
 * 
 * 자식들의 타입으로 사용되어지며
 * 타입으로 사용될 경우, 추상클래스를 상속받은 클래스들이 모두 사용될 수 있다
 * ex) 필드의 타입을 추상메서드로 하는 경우
 * 메서듸 타입을 추상메서드로 하는 경우
 */
public abstract class Phone {
    // 필드
    public String owner;

    // 생성자
    public Phone(String owner) {
        this.owner = owner;
    }

    // 메서드
    // 추상메서드
    // 코드블럭이 없고 abstrace키워드가 붙어있는 메서드
    // 자식에게 코드의 작성을 위임!!!
    // 자식클래스가 추상메서드를 구현하지 않으면 오류가 발생!!!
    public abstract void turnOn();

    public void turnOff() {
        System.out.println("폰의 전원을 끕니다.");
    }
}
