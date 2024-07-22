package d_array.practice;

public class ArrayStringEx {
    public static void main(String[] args) {
        ArrayStringEx ase = new ArrayStringEx();
        ase.method2();
    }

    /**
     * eqauls() 메서드
     * 
     * 참조타입의 경우 == 는 객체의 번지(주소)값을 비교
     * 값 그자체가 비교 되지 않는다
     * 
     */
    public void method2(){
        String[] strArray = new String[3];
        // 리터럴 : 값 그자체를 의미
        strArray[0] = "Java";
        strArray[1] = "Java";
        strArray[2] = new String("Java");

        System.out.println(strArray[0].hashCode());
        System.out.println(strArray[1].hashCode());
        System.out.println(strArray[2].hashCode());
        System.out.println("=========================");
        System.out.println( strArray[0] == strArray[1]);
        System.out.println( strArray[0] == strArray[2]);
        System.out.println(strArray[0].equals(strArray[2]));

    }



    public void method1() {
        printStringArr(new String[]{"a", "b", "c"});

        String[] color = new String[5];
        color[0] = "red";
        color[1] = "yellow";
        color[2] = "black";

        printStringArr(color);

    }

    /**
     * 문자열 배열을 매개변수로 받아와서
     * 배열에 들어있는 문자열을 출력
     * @param strArr
     */
    public void printStringArr(String[] strArr) {
        System.out.println("printStringArr ===============");
        for(String str : strArr){
            System.out.println(str);
        }
    }
}
