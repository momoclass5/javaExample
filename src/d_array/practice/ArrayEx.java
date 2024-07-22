package d_array.practice;

public class ArrayEx {
    public static void main(String[] args) {
        ArrayEx ae = new ArrayEx();
        ae.lotto3();
    }
    public void lotto3() {
        int[] lotto = new int[6];

        // 0 ~ 5
        for(int i=0;i<lotto.length;i++){
            // 1 ~ 47 까지의 수중 무작위수를 추출
            int num = (int)(Math.random() * 47) + 1;
            lotto[i] = num;

            // 중복체크
            // i의 값만큼 반복
            for(int j=0; j<i; j++){
                if(lotto[j] == num){
                    System.out.println("lotto[j] : " + lotto[j] );
                    System.out.println("num : " + num );
                    System.out.println("중복발생=========================");
                    // 중복발생
                    i--;
                    break;
                }
            }
            System.out.println("i : " + i);
            System.out.println("lotto : ");
            for(int n : lotto){
                System.out.print(n + " ");
            }
            System.out.println();
        }
    }
    

    public void lotto2() {
        // 배열의 합계를 구해줘
        sum(new int[]{1,2,3,4,5});



        // 정수 20개를 저장할수 있는 배열을 생성
        int[] arr = new int[20];
        // i = 0 ~ 19 20번 실행
        for(int i=0;i<arr.length;i++){
            // 배열에 (1~100)무작위 수를 대입
            arr[i] = (int)(Math.random()*100)+1;
        }
        // 배열에 값을 출력
        int sum = 0;
        for(int num : arr){
            System.out.println(num);
            sum += num;
        }
        System.out.println("합계 : " + sum);

        // 배열의 값의 합을 출력
        sum(arr);

        printStr("test");
    }

    public void printStr(String str) {
        System.out.println(str);
        
    }
    public void sum(int[] array) {
        System.out.println("배열의 총 합계를 구합니다.");
        // 반복문을 이용해서 배열을 돌면서 값을 가지고 와서 
        // 배열에 들어있는 숫자들의 합을 출력
        int sum=0;
        for(int num : array){
            sum+=num; // sum = sum + num;
        }
        System.out.println("총 합계 : " + sum);
    }

    public void lotto1() {
        // 정수 6개를 저장할수 있는 배열을 생성
        int[] lotto = new int[6];

        // 배열에 값을 저장
        // lotto[0] ~ lotto[5]
        for(int i=0; i<lotto.length; i++){
            // 1 ~ 47중 무작위수를 추출하고 배열에 담아줍니다
            lotto[i] = (int)(Math.random() * 47) + 1;
        }

        // 배열의 값을 출력
        System.out.println("로또 자동 생성기");
        for(int i : lotto){
            System.out.print(i + " ");
        }

    }

    public void array_error() {
        // 자동으로 방을 초기화
        // 정수 0, 0.0, false, null
        int[] lotto = new int[6];
        // 향상된 for문
        // 배열의 시작부터 끝까지 하나씩 꺼내서 변수에 담고 코드블럭을 실행
        // for(타입 변수명:배열변수명)
        for(int i : lotto){
            System.out.println("i=" + i);
        }

        for(int i=0; i <= lotto.length; i++ ){
            //lotto[6];
            // ArrayIndexOutOfBoundsException
            // lotto.length는 방의 갯수와 동일
            // index는 0부터 시작 하므로 오류가 발생 lotto[lotto.length]
            System.out.println(lotto[i]);
        }

    
    }
    
    public void lotto(){
        // 무작위 수를 추출해서 배열에 담아봅시다
        // 정수 6개가 저장될 공간을 만드시오 변수명은 lotto로 한다!
        // 각 방에는 랜덤함수를 이용해서 1~47까지의 수를 추출하여 수를 저장 한다
        int[] lotto = new int[6];

        lotto[0] = (int)(Math.random()*47) + 1;
        lotto[1] = (int)(Math.random()*47) + 1;
        lotto[2] = (int)(Math.random()*47) + 1;
        lotto[3] = (int)(Math.random()*47) + 1;
        lotto[4] = (int)(Math.random()*47) + 1;
        lotto[5] = (int)(Math.random()*47) + 1;

        // 배열이름.length : 배열의 길이를 반환 = 방의 갯수
        System.out.println("lotto.length : " + lotto.length);
        // 0 ~ 5
        //for(int i=0; i<6;i++){
        for(int i=0; i<lotto.length; i++){
            System.out.println(lotto[i]);
        }


    }

    /**
     * Array (배열)
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
