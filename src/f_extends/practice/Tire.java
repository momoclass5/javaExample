package f_extends.practice;

public class Tire {

    public int maxRotation; // 최대회전수
    public int accumulatedRotation; // 누적회전수
    public String location; // 타이어의 위치
    public int loc;

    // 초기화
    public Tire(int loc, int maxRotation) {
        this.maxRotation = maxRotation;
        this.loc = loc;
        switch (loc) {
            case 1:
                location = "앞 왼";
                break;

            default:
                break;
        }
    }

    // 초기화
    public Tire(String location, int maxRotation) {
        this.maxRotation = maxRotation;
        this.location = location;
    }

    /**
     * roll() 메소드
     * 타이어 1회전 - 1번 실행할 때마다 누적 회전수 1 증가
     * boolean 리턴 타입 – 정상 회전일 경우 true, 펑크인 경우 false 리턴
     */
    public boolean roll() {
        accumulatedRotation++;
        if (accumulatedRotation > maxRotation) {
            System.out.println(location + " 타이어 펑크!");
            return false;
        } else {
            System.out.println(location + (maxRotation - accumulatedRotation) + "회 ");
            return true;
        }
        // return false;
    }
}
