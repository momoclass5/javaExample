package e_object.practice;

import lombok.Data;

@Data
public class Student {
    private String no;
    private String name;
    private int age;

    // 생성자의 오버로딩
    // 매개변수의 타입과 갯수가 다르다면 같은 이름으로 여러개를 생성할 수 있다
    // 생성자 : 반환타입이 없다
    // 클래스명과 동일한 이름
    // 기본생성자
    public Student() {
    }

    // 매개변수가 있는 생성자
    // 필드 초기화
    public Student(String no, String name, int age) {
        // 필드명과 매개변수명이 같은경우, 매개변수가 우선되므로
        // 필드에 접근 하기 위해 this키워드를 사용한다
        this.no = no;
        this.name = name;
        this.age = age;
    }

    public String info() {
        return no + " " + name + " " + age;
    }

    @Override
    public String toString() {
        return no + " " + name + " " + age;
    }
}
