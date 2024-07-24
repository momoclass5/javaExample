package e_object.practice;

public class ClassMate {
    Student[] students = new Student[10];
    Teacher t;

    /**
     * Student를 매개변수로 받아서 배열에 세틍
     * 
     * @param s
     */
    public void setStucent(Student s) {
        for (int i = 0; i < students.length; i++) {
            // 배열에 방이 비어 있으면
            if (students[i] == null) {
                students[i] = s;
            }
        }

    }
}
