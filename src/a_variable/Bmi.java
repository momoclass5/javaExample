package a_variable;

import java.util.Scanner;

public class Bmi {
    public static void main(String[] args) {
        Bmi b = new Bmi();
        // 메서드가 반복해서 실행 될수 있도록 코드를 작성 하세요!
        while (true) {
            b.bmi();
        }

    }
    
    Scanner s = new Scanner(System.in);
    
    public void bmi(){
        

        // 여러개의 변수를 선언
        double height, weight, bmi;
        String bmiStr;
        
        // 사용자로 부터 키와 몸무게를 입력 받아서 변수에 저장
        System.out.println("키(m) :");
        height = s.nextDouble();
        System.out.println("몸무게(kg) :");
        weight = s.nextDouble();

        // 사용자의 정보를 출력
        System.out.println("사용자 정보");
        // %d, %f, %s
        System.out.printf("키 : %.2f, 몸무게 : %.2f\n", height, weight);

        if(height >= 100){
            // 단위변경
            height = height/100;

        }

        // 사용자의 입력 정보를 연산하여 bmi를 구합니다
        bmi = weight/(height*height);

        if(bmi>=25){
            bmiStr = "비만";
        } else if(bmi>=23) {
            bmiStr = "과체중";
        } else if(bmi>=18.5){
            bmiStr="정상";
        } else {
            bmiStr="저체중";
        }
        // 비만도출력
        System.out.printf("당신의 Bmi는 %.2f이고, %s입니다.\n", bmi, bmiStr);

        // s.close();
    }


    public void ifTest(){
        // 조건문의 결과 참, 거짓에 의해 코드의 실행여부를 판단     
        // 조건문이 참이면 코드를 실행
        // 참 = true, 거짓 = false
        if(true){
            System.out.println("조건이 참입니다.");
        } else {

        }
        if(false){
            System.out.println("조건이 거짓 입니다.");
        }
    }
}
