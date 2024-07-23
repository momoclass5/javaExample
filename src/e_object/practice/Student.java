package e_object.practice;

import lombok.Data;

@Data
public class Student {
    private String no;
    private String name;
    private int age;

    public Student() {
    }

    public Student(String no, String name, int age) {
        this.no = no;
        this.name = name;
        this.age = age;
    }

    public String info() {
        return no + " " + name + " " + age;
    }

}
