package studiobooking;

import java.sql.Timestamp;

public class Studiobooking {
    
    private int sbookingID;
    private String organization;
    private Timestamp startDateTime;
    private Timestamp finishDateTime;// Use Timestamp
    private String objective;

    public int getSbookingID() {
        return sbookingID;
    }

    public void setSbookingID(int sbookingID) {
        this.sbookingID = sbookingID;
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
