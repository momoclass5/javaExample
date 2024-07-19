package b_conditional.practice;
    /*
    * switch 문
    * 
    * [표현법]
    *   switch(조건식) {
    *     case 값1 :
    *          .. 실행 코드 1..;
    *          break;
    *     case 값2 :
    *          .. 실행 코드 2..;
    *          break;
    *     case 값3 :
    *          .. 실행 코드 2..;          
    *          break;
    *     [default] :
    *          위 조건을 모두 만족하지 않을 경우 실행하게 될 코드
    *   }
    * 
    * - switch 문은 if문과 마찬가지로 조건문이다.
    * - switch 문은 if문처럼 조건식이 true일 경우에 실행문을 실행하는 것이 아니라, 
    *   조건식의 결과 값(정수, 문자, 문자열)에 따라 실행문이 선택된다.
    * - if문과 다르게 실행 코드를 실행하고 자동으로 빠져나가지 못한다. (break가 필요하다.)
    */
public class SwitchExample {

    public static void main(String[] args) {

        //5=a=b=c;

        String menu = "1";
        
        switch(menu){
            case "1" :
                System.out.println("1을 선택");
            case "2" :
                System.out.println("2를 선택");
            default:
                System.out.println("없는 메뉴 입니다.");
        }
    }

}
