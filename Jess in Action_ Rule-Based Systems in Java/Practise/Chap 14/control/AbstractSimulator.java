package control;
public abstract class AbstracSimulator implements Hardware {
    private int[] m_heatpumps;
    private boolean[] m_vents, m_sensors;

    public Simulator(int numberOfFloors) {
        if (numberOfFloors % 3 != 0)
          throw new RuntimeException("Illegal value");

        m_heatpumps = new int[numberOfFloors/3];
        m_vents = new boolean[numberOfFloors];
        m_sensors = new boolean[numberOfFloors];
    }

    public int getHeatPumpState(int heatPump) {
         return m_heatpumps[heatPump-1];
    }

    public void setHeatPumpState(int heatPump, int state) {
        switch (state) {
        case OFF: case HEATING: case COOLING:
            m_heatpumps[heatPump-1] = state; break;
        default:
            throw new RuntimeException("Illegal value");
        }
    }

    public int getNumberOfHeatPumps() {
        return m_heatpumps.length;
    }

    public boolean getVentState(int vent) {
        return m_vents[vent-1];
    }

    public void setVentState(int vent, boolean state) {
        m_vents[vent-1] = state;
    }

}
