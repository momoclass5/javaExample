package f_extends.practice;

public class HankookTire extends Tire {

    int speed;

    public HankookTire(String location, int maxRotation) {
        super(location, maxRotation + 1);
    }

    @Override
    public boolean roll() {
        accumulatedRotation++;
        if (accumulatedRotation > maxRotation) {
            System.out.println(location + " 한국타이어 펑크!!!");
            return false;
        } else {
            System.out.println(location + " 한국타이어 수명 : "
                    + (maxRotation - accumulatedRotation));
            return true;
        }
    }

}
