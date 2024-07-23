package d_array.practice;

import java.util.Arrays;
import java.util.Scanner;

public class Lotto {

    Scanner scan = new Scanner(System.in);

    public void lotto(){
        System.out.println("로또번호 생성기 ================");
        System.out.println("몇개를 만들까요?");
        int cnt = scan.nextInt();
        scan.nextLine(); // 숫자만 받아오기때문에 뒤에 엔터를 빼줘야 다음 문자 입력을 받을수 있어요
        for(int i=0; i<cnt; i++){
            int[] lotto = getLottoNumber();
            for(int num : lotto){
                System.out.print(num + " ");
            }
            System.out.println();
            //System.out.println( Arrays.toString(lotto) );
            //System.out.println( Arrays.toString( getLottoNumber() ));
        }

        System.out.println("필요한 금액은 " + (cnt * 1000) + "원 입니다.");
    }



    public int[] getLottoNumber(){
        int[] arr = new int[6];
        // 배열에 값을 저장
        // 배열이름[방번호=index] = 값(배열의 타입과 일치하는)
        // arr[0] = 10;`
        // arr[1] = 10;
        // arr[2] = 10;
        // arr[3] = 10;
        // arr[4] = 10;
        // arr[5] = 10;

        for(int i=0; i<arr.length; i++){
            arr[i] = (int)(Math.random() * 47) + 1;
            // 중복을 제거
            for(int j=0; j<i; j++){
                // 중복이 발생했다면 i값을 1감소시켜서
                // 해당 인덱스에 값을 다시한번 입력 하도록 한다
                if(arr[i] == arr[j]){
                    /*
                    System.out.println("중복발생 ================");
                    System.out.println("i : " + arr[i]);
                    System.out.println("j : " + arr[j]);
                    */
                    i--;
                }
            }
        }
        
        
        // Arrays객체를 이용하여 출력해봅시다!   [ 배열요소가 가진값, 값, .....   ]
        //System.out.println( Arrays.toString(arr) );
        // 직접 출력하지 않고 int[](로또번호)을 반환
        return arr;
        // for(int num : arr){
        //     System.out.print(num + " ");
        // }
    }

    public void makeLotto() {
        // null : 참조타입변수는 객체를 참조 - 메모리주소값을 가지고 있다
        // 참조하는 주소가 없다 = 객체를 참조하지 않는다
        // NullPointerException
        int[] arr = null;
        int[] lotto = new int[6];
        System.out.println(arr);
        if(arr != null){
            for(int i=0; i<arr.length; i++){
                System.out.println(arr[i]);
            }
        }
    }
}
