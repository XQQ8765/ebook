package control;

import java.beans.*;

public abstract class BeanSupport {
    protected PropertyChangeSupport m_pcs =
        new PropertyChangeSupport(this);

    public void
    addPropertyChangeListener(PropertyChangeListener p) {
        m_pcs.addPropertyChangeListener(p);
    }
    public void
    removePropertyChangeListener(PropertyChangeListener p) {
        m_pcs.removePropertyChangeListener(p);
    }
}
