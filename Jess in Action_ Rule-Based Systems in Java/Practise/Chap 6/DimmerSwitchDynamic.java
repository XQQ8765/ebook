import java.beans.*;

public class DimmerSwitchDynamic {
    private int brightness = 0;
    public int getBrightness() { return brightness; }
    public void setBrightness(int b) {
		int old = brightness;
        brightness = b;
        adjustTriac(b);
		pcs.firePropertyChange("brightness", new Integer(old), new Integer(b));
    }
    private void adjustTriac(int brightness) {
       System.out.println("brightness="+brightness);
    }

	private PropertyChangeSupport pcs = new PropertyChangeSupport(this);
	public void addPropertyChangeListener(PropertyChangeListener p) {
		pcs.addPropertyChangeListener(p);
	}
	public void removePropertyChangeListener(PropertyChangeListener p) {
		pcs.removePropertyChangeListener(p);
	}
}
