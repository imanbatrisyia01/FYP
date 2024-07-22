/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package instrument;

/**
 *
 * @author user
 */
public class Instrument {
    
    private int instrumentID;
    private String instrumentImage;
    private String instrumentName;
    private String instrumentDescription;
    
    public int getInstrumentID() {
        return instrumentID;
    }

    public void setInstrumentID(int instrumentID) {
        this.instrumentID = instrumentID;
    }

    public String getInstrumentName() {
        return instrumentName;
    }

    public void setInstrumentName(String instrumentName) {
        this.instrumentName = instrumentName;
    }
    
    public String getInstrumentImage() {
        return instrumentImage;
    }

    public void setInstrumentImage(String instrumentImage) {
        this.instrumentImage = instrumentImage;
    }

	public String getInstrumentDescription() {
		return instrumentDescription;
	}

	public void setInstrumentDescription(String instrumentDescription) {
		this.instrumentDescription = instrumentDescription;
	}
    
  
    
}
