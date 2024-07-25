package f_extends.airplane;

public class TypeEx extends Object {
    public static void main(String[] args) {

        // 타입 변수명 = new 타입();
        B b = new B();
        C c = new C();

        D d = new D();
        E e = new E();

        // 부모타입으로 자동 형변환
        A a1 = b;
        A a2 = c;
        A a3 = d;
        A a4 = e;

        B b1 = d;
        C c1 = e;

        // 상속관계에 있지 않은경우 형변환이 불가능 하다!!!
        // B b3 = e;
        // C c2 = d;
    }
}

class A {
}

class B extends A {
}

class C extends A {
}

class D extends B {
}

class E extends C {
}
