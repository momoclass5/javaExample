package ex01;

public class Application {
    public static void main(String[] args) {

        // 기본생성자를 이용하여 객체(인스턴스)를 생성
        // 기본생성자를 이용하면 빈 객체가 생성 된다
        // 가지고 있는 필드가 기본타입의 값으로 세팅 되어 짐!
        Product p1 = new Product();
        System.out.println(p1.information());
        String info = p1.information();
        System.out.println(info);

        // 매개변수 있는 생성자를 통해 객체의 필드를 초기화 할수 있다
        p1 = new Product("ssgnote9", "갤럭시노트9", "경기도 수원", 960000, 10.0);

        System.out.println(p1.information());

        // 생성과 동시에 필드를 초기화
        Product p2 = new Product("igxnote5", "LG스마트폰", "경기도 평택", 780000, 0.7);
        System.out.println(p2.information());

        Product p3 = new Product("ktsnote3", "KT스마트폰3", "서울시 강남", 250000, 0.3);
        System.out.println(p3.information());
        System.out.println("===================");
        p1.setPrice(1200000);
        System.out.println(p1.information());
        p2.setPrice(1200000);
        System.out.println(p2.information());
        p3.setPrice(1200000);
        System.out.println(p3.information());
        System.out.println("===================");
        p1.setTax(0.05);
        p2.setTax(0.05);
        p3.setTax(0.05);
        System.out.println(p1.information());
        System.out.println(p2.information());
        System.out.println(p3.information());

        // 부가세율을 적용한 가격을 계산후 출력
        // 상품명 =
        // 부가세포함 가격 =
        System.out.println("상품명 = " + p1.getName());
        System.out.printf("부가세 포함 가격 = %,d원\n", p1.priceAddTax());
        System.out.println("상품명 = " + p2.getName());
        System.out.printf("부가세 포함 가격 = %,d원\n", p2.priceAddTax());
        System.out.println("상품명 = " + p3.getName());
        System.out.printf("부가세 포함 가격 = %,d원\n", p3.priceAddTax());

        System.out.println(p3.id);
        p3.id = "바뀜?!";
        System.out.println(p3.id);

    }
}
