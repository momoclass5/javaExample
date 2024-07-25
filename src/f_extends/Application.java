package f_extends;

public class Application {
    public static void main(String[] args) {
        Student s = new Student("홍길동", "123456-1234567", 1);
        // 부모필드
        System.out.println("name : " + s.name);
        System.out.println("ssn : " + s.ssn);
        // 자식필드
        System.out.println("no : " + s.studentNo);

        s.name = "홍홍홍";
        s.ssn = "1111111111111";
        s.studentNo = 77777;

        // 부모필드
        System.out.println("name : " + s.name);
        System.out.println("ssn : " + s.ssn);
        // 자식필드
        System.out.println("no : " + s.studentNo);
    }
}
