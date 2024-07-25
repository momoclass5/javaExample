package f_extends;

public class People {
    public String name;
    public String ssn;

    /*
     * public People() {
     * 
     * }
     */

    /**
     * 기본생성자가 없는경우(생성자를 하나라도 만든경우)
     * 부모의 생성자를 명시적으로 호출 해야함!
     * 
     * @param name
     * @param ssn
     */
    public People(String name, String ssn) {
        this.name = name;
        this.ssn = ssn;
    }
}
