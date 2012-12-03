package control;
import java.util.Arrays;

public class Simulator extends AbstractSimulator {
     private final double RATE = 0.01;
     private final double HOT = 100, COLD=50;
     private double[] m_temperature;
     double m_outdoor = 90;

     public Simulator(int numberOfFloors) {
         //...
         m_temperature = new double[numberOfFloors];
         Arrays.fill(m_temperature, 70);
         new Thread(this).start();
     }
     //...
     public double getTemperature(int sensor) {
         return m_temperature[sensor-1];
     }

     public void run() {
         while (true) {
             for (int i=0; i<m_temperature.length; ++i) {
                 double temp = m_temperature[i];

                 // Heating and cooling, and heat rising
                 switch (state(i)) {
                 case HEATING:
                     temp += (HOT-temp)*RATE; break;
                 case COOLING:
                     temp += (COLD-temp)*RATE; break;
                 case OFF:
                     temp += (i+1)*0.005; break;
                 }

                 // Outdoor leakage
                 temp += (m_outdoor-temp)*RATE/2;

                 m_temperature[i] = temp;
             }
             try {Thread.sleep(1000);}
             catch (InterruptedException ie) { return;}
         }
     }
     private int state(int floor) {
         if (getVentState(floor + 1))
             return getHeatPumpState(floor/3 + 1);
         else
             return OFF;
    }
}
