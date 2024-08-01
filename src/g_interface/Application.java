package g_interface;

import java.rmi.Remote;
import java.util.ArrayList;
import java.util.List;

import g_interface.practice.Audio;
import g_interface.practice.RemoteControl;
import g_interface.practice.Television;

public class Application {
    public static void main(String[] args) {
        // 인터페이스는 직접 생성 할 수 없다
        // 구현체를 이용하여 생성하고 타입으로 사용 할 수 있다
        RemoteControl rc = new Television();
        rc.turnOn();
        rc.setVolume(20);
        rc.turnOff();

        RemoteControl rc1 = new Audio();
        rc1.turnOn();
        rc1.setVolume(20);
        rc1.turnOff();

        List<RemoteControl> list = new ArrayList<RemoteControl>();
        list.add(rc);
        list.add(rc1);

        for (RemoteControl r : list) {
            r.turnOn();
            r.setVolume(20);
            r.turnOff();
        }
    }
}
