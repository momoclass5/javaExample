package f_extends.practice;

public class KumhoTire extends Tire {

    public KumhoTire(String location, int maxRotation) {
        super(location, maxRotation + 2);
    }

    @Override
    public boolean roll() {
        accumulatedRotation++;
        if (accumulatedRotation > maxRotation) {
            System.out.println(location + " 금호타이어 펑크!!!");
            return false;
        } else {
            System.out.println(location + " 금호타이어 수명 : "
                    + (maxRotation - accumulatedRotation));
            return true;
        }
    }
}
