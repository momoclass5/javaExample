package ex05.practice;

import lombok.Data;

@Data
public class Student extends Person {
    private int grade; // 학년 (1,2,3)
    private String major; // 전공 (1:접수, 2:대기, 3: 처리완료, 4:실패)

    /*
     * public Student(){
     * 
     * }
     */
    public Student(String name, int age, double height, double weight, int grade, String major) {
        // 부모의 생성자를 명시적으로 호출
        super(age, height, weight);
        // this.age = 10;
        this.name = name;
        this.grade = grade;
        this.major = major;
    }

    /**
     * 자식이 부모의 메서드를 재정의
     */
    @Override
    public String information() {
        return super.information() + "/" + grade + "/" + major;
    }
}
