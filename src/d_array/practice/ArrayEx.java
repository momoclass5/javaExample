package d_array.practice;

public class ArrayEx {

    public void lotto(){
        // 무작위 수를 추출해서 배열에 담아봅시다
    }

    /**
     * Arrat (배열)
     *  - 길이가 정해져 있다
     *  - 같은타입만 저장 가능
     */
    	/*
	 * 배열
	 * 
	 * [표현법]
	 *   1) 배열의 선언
	 *      자료형[] 배열명;
	 *      자료형 배열명[];
	 *      
	 *   2) 배열의 할당
	 *      배열명 = new 자료형[배열크기];
	 *      
	 *   3) 배열의 선언과 할당을 동시에 진행
	 *      자료형[] 배열명 = new 자료형[배열크기];
	 *      자료형 배열명[] = new 자료형[배열크기];
	 *      
	 *   4) 배열의 초기화
	 *      4-1) 인덱스를 이용한 초기화
	 *           배열명[0] = 값1;
	 *           배열명[1] = 값2;
	 *           ...
	 *           
	 *      4-2) 선언과 동시에 초기화
	 *           자료형[] 배열명 = {값1, 값2, 값3, ... };
	 *           자료형 배열명[] = {값1, 값2, 값3, ... };
	 *           자료형[] 배열명 = new 자료형[] {값1, 값2, 값3, ... };
	 *           자료형 배열명[] = new 자료형[] {값1, 값2, 값3, ... };
	 *           
	 *      4-3) 반복문을 이용한 초기화
	 *      
	 */	
    public void array1() {
        /*
         * 배열 선언 : 자료형[] 배열명;
         */
        int[] lotto;
        //int lotto1[]; 

        /*
         * 배열 생성 : new 자료형[배열의크기];
         */
        lotto = new int[6];
        // 인덱스를 이용한 초기화 방법
        lotto[0] = 10;
        lotto[1] = 20;
        


        // 배열의 선언과 생성을 동시에!
        int[] lotto1 = new int[6];              // 배열의 길이만 결정
        int[] lotto2 = new int[] {1,2,3,4,5};   // 값도 지정
        int lotto3[] = {1,2,3,4,5};             // 값도 지정

        int num1, num2, num3, num4, num5, num6;
        



    }


    /**
     * 오버로딩
     *  매서드의 이름이 같아도 매개변수의 타입과 갯수가 다르면 여러개를 만들수 있다
     * 
     * 오버라이딩
     *   부모가 가진 메서드를 자식이 재정의
     */

    /**
     * 오버로딩
     */
    //public String toString(int i, int j, int k) {
    public String toString(int[] arr) {
        return super.toString();
    }
    public String toString(int a, int b) {
        return super.toString();
    }

    /**
     * 부모의 메서드를 재정의 
     *  = 부모메서드의 선언부와 자식메서드의 선언부가 동일
     * @ : 어노테이션
     */
    @Override
    public String toString() {
        // super 부모
        return "배열연습";
    }
}
