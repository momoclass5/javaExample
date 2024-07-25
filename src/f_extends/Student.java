package f_extends;

public class Student extends People {

    public int studentNo;

    public Student(String name, String ssn, int studentNo) {
        // 부모생성자를 호출 할때 사용되는 키워드
        // 생성자의 호출은 첫번째 줄에 나와야 한다
        super(name, ssn);
        this.studentNo = studentNo;
    }

}
