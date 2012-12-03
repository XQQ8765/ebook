package control;

public class Thermometer extends BeanSupport
    implements Runnable {
    private Hardware m_hardware;
    private int m_floor;
    private double m_oldReading;

    public Thermometer(Hardware hw, int floor) {
        m_hardware = hw;
        m_floor = floor;
        new Thread(this).start();
    }

    public int getFloor() {
        return m_floor;
    }

    public double getReading() {
       return m_hardware.getTemperature(m_floor);
    }

    public void run() {
       while (true) {
           double reading = getReading();
           m_pcs.firePropertyChange("reading",
               new Double(m_oldReading),
               new Double(reading));
           m_oldReading = reading;
           try { Thread.sleep(1000); }
           catch (InterruptedException ie) { return; }
       }
    }
}
