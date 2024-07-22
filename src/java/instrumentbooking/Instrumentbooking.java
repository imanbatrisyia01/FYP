/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package instrumentbooking;

import java.sql.Timestamp;

public class Instrumentbooking {
    
    private int id;
    private String organization;
    private Timestamp startDateTime;
    private Timestamp finishDateTime;// Use Timestamp
    private String objective;

    public int getIbookingID() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrganization() {
        return organization;
    }

    public void setOrganization(String organization) {
        this.organization = organization;
    }

    public Timestamp getStartDateTime() {
        return startDateTime;
    }

    public void setStartDateTime(Timestamp startDateTime) {
        this.startDateTime = startDateTime;
    }

    public Timestamp getFinishDateTime() {
        return finishDateTime;
    }

    public void setFinishDateTime(Timestamp finishDateTime) {
        this.finishDateTime = finishDateTime;
    }

    public String getObjective() {
        return objective;
    }

    public void setObjective(String objective) {
        this.objective = objective;
    }
    
}
