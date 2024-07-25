package ex05.practice;

public class Person {

    protected String name;
    private int age;
    private double height;
    private double weight;

    // 기본생성자
    // 기본생성자가 없는경우, 명시적으로 생성자를 호출 해야 한다.
    /*
     * public Person() {
     * 
     * }
     */
    // 매개변수 있는 생성자
    // 필드를 초기화
    public Person(int age, double height, double weight) {
        this.age = age;
        this.height = height;
        this.weight = weight;
    }

    // 필드의 정보를 문자열로 반환하는 역할
    // 출력하지 않음
    public String information() {
        return name + "/" + age + "/" + height + "/" + weight;
    }

}
