package f_extends.practice.abstractex;

public class SmartPhone extends Phone {

    public SmartPhone(String owner) {
        super(owner);
    }

    public void internetSearch() {
        System.out.println("인터넷 검색을 합니다.");
    }

    @Override
    public void turnOn() {
        System.out.println("스마트폰을 실행합니다.");
    }

}
