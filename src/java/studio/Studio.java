/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package studio;

/**
 *
 * @author user
 */
import java.util.Arrays;

public class Studio {

    private int studioID;
    private String studioName;
    private String studioImg;
    private String studioDescription;
    private String studioSize;
    private String capacity;

    // Constructors
    public Studio() {
    }

    public Studio(String studioName, String studioImg) {
        this.studioName = studioName;
        this.studioImg = studioImg;
    }

    // Getters and Setters
    public int getStudioID() {
        return studioID;
    }

    public void setStudioID(int studioID) {
        this.studioID = studioID;
    }

    public String getStudioName() {
        return studioName;
    }

    public void setStudioName(String studioName) {
        this.studioName = studioName;
    }

    public String getStudioImg() {
        return studioImg;
    }

    public void setStudioImg(String studioImg) {
        this.studioImg = studioImg;
    }

	public String getStudioDescription() {
		return studioDescription;
	}

	public void setStudioDescription(String studioDescription) {
		this.studioDescription = studioDescription;
	}

    public String getStudioSize() {
        return studioSize;
    }

    public void setStudioSize(String studioSize) {
        this.studioSize = studioSize;
    }

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

}
