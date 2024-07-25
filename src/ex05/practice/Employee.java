package ex05.practice;

import lombok.Data;

@Data
public class Employee extends Person {

    private int salary; // 급여
    private String dept; // 부서코드(01:총무부, 02:인사부, 03:개발부)

    public Employee(int age, double height, double weight,
            int salary, String dept, String name) {
        super(age, height, weight);
        this.name = name;
        this.salary = salary;
        this.dept = dept;
    }

    @Override
    public String information() {
        return super.information() + "/" + salary + "/" + dept;
    }

}
