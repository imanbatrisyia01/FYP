/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package performance;

/**
 *
 * @author user
 */
public class Performance {
    
    private int performanceID;
    private String performanceName;
    private String performanceDesc;
    private String image;
    private Double price;
    
       public int getPerformanceID() {
        return performanceID;
    }

    public void setPerformanceID(int performanceID) {
        this.performanceID = performanceID;
    }

    public String getPerformanceName() {
        return performanceName;
    }

    public void setPerformanceName(String performanceName) {
        this.performanceName = performanceName;
    }
     public String getPerformanceDesc() {
        return performanceDesc;
    }

    public void setPerformanceDesc(String performanceDesc) {
        this.performanceDesc = performanceDesc;
    }
    
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    public Double getPrice() {
    	return price;
    }
    
    public void setPrice(Double price) {
    	this.price = price;
    }
}
