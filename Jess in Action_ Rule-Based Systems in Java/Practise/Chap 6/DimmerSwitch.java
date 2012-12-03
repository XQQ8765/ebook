public class DimmerSwitch {
    private int brightness = 0;
    public int getBrightness() { return brightness; }
    public void setBrightness(int b) {
		int old = brightness;
        brightness = b;
        adjustTriac(b);
    }
    private void adjustTriac(int brightness) {
       System.out.println("brightness="+brightness);
    }
}
