package ex05;

import java.util.Scanner;

import ex05.practice.Employee;
import ex05.practice.Person;
import ex05.practice.Student;

public class Application {

    static Scanner scan = new Scanner(System.in, "ms949");

    public static void main(String[] args) {
        Person p = new Person(20, 160, 50);

        // 3명의 학생 정보를 기록할 수 있게 객체 배열 할당 (Student[])
        Student[] sArr = new Student[3];

        // 위의 사용데이터 참고하여 3명의 학생 정보 초기화
        // 배열이름[방번호]
        sArr[0] = new Student("홍길동", 20, 178.2, 70.0, 1, "정보시스템공학과");
        sArr[1] = new Student("김말똥", 21, 187.3, 80, 2, "경영학과");
        sArr[2] = new Student("강개순", 23, 167.0, 45, 4, "정보통신공학과");

        // 위의 학생 정보 모두 출력
        // System.out.println(Arrays.toString(sArr));
        // 배열에 있는 모든 요소를 하나씩 꺼내서 변수에 저장 실행
        for (Student s : sArr) {
            System.out.println(s.information());
        }

        // 최대 10명의 사원 정보를 기록할 수 있게 배열을 할당 (Employee[])
        // 0 ~ 9
        Employee[] eArr = new Employee[10];

        // 사원들의 정보를 키보드로 계속 입력 받고 --> while(true) 무한 반복문을 통해
        int index = 0;
        while (true) {
            // 사용자로부터 입력받은 값을 저장하기위한 변수를 선언
            int age = 0, salary = 0;
            double height = 0.0, weight = 0.0;
            String dept = null, name = null;

            // 정적멤버는 정적멤버만 호출 할 수 있다
            /*
             * Application app = new Application();
             * app.scan.nextLine();
             */

            // 스캐너를 통해 사용자 정보를 입력 받습니다!
            System.out.print("이름을 입력 해주세요 : ");
            name = scan.nextLine();
            System.out.print("부서를 입력 해주세요 : ");
            dept = scan.nextLine();
            System.out.print("나이 : ");
            age = scan.nextInt();
            System.out.print("키 : ");
            height = scan.nextDouble();
            System.out.print("몸무계 : ");
            weight = scan.nextDouble();
            System.out.print("급여 : ");
            salary = scan.nextInt();
            scan.nextLine();

            // 입력받은 정보들을 가지고 매개변수 생성자를 이용하여 객체배열에 객체 생성
            eArr[index] = new Employee(age, height, weight, salary, dept, name);
            System.out.println(eArr[index].information());

            // 한 명씩 추가 될 때마다 카운트함
            index++;

            // 배열의 크기가 10으로 고정되어 있으므로
            // 10번째방은 존재 하지 않는다
            // 접근시 오류가 발생 하므로 메세지를 출력하고 종료한다
            if (index == 10) {
                System.out.println("사원 10명이 모두 입력 되었습니다.");
                break;
            }

            // 계속 추가할 것인지 물어보고, 대소문자 상관없이 ‘y’이면 계속 객체 추가
            System.out.print("사원을 계속 추가 하시겠습니까?(Y/N) : ");
            String isNext = scan.nextLine();
            // ‘n’일 경우 더 이상 그만 입력 받도록..
            if (!isNext.equalsIgnoreCase("Y")) {
                // 반복문 탈출
                break;
            }

        }

        // 배열에 담긴 사원들의 정보를 모두 출력
        for (Employee e : eArr) {
            System.out.println(e.information());
        }

        // 학생과 사원을 하나의 배열에 담을수 있을까?!
        Person[] pArr = new Person[5];
        // 자식타입은 부모타입으로 자동 형 변환이 가능하다
        Person p1 = new Employee(index, index, index, index, null, null);
        Person p2 = new Student(null, index, index, index, index, null);

        //

    }

}
