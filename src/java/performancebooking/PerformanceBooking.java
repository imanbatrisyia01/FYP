package performancebooking;

import java.time.LocalDateTime;

public class PerformanceBooking {

    private int id;
    private int userID;
    private int performanceID;
    private LocalDateTime performanceDateTime;
    private String objective;
    private String organization;
    private String paymentReceipt;

    // Default constructor
    public PerformanceBooking() {
    }

    // Constructor with all fields
    public PerformanceBooking(int userID, int performanceID, LocalDateTime performanceDateTime, String objective, String organization) {
        this.userID = userID;
        this.performanceID = performanceID;
        this.performanceDateTime = performanceDateTime;
        this.objective = objective;
        this.organization = organization;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getPerformanceID() {
        return performanceID;
    }

    public void setPerformanceID(int performanceID) {
        this.performanceID = performanceID;
    }

    public LocalDateTime getPerformanceDateTime() {
        return performanceDateTime;
    }

    public void setPerformanceDateTime(LocalDateTime performanceDateTime) {
        this.performanceDateTime = performanceDateTime;
    }

    public String getObjective() {
        return objective;
    }

    public void setObjective(String objective) {
        this.objective = objective;
    }

    public String getOrganization() {
        return organization;
    }

    public void setOrganization(String organization) {
        this.organization = organization;
    }
    
    public String getPaymentReceipt() {
        return paymentReceipt;
    }

    public void setPaymentReceipt(String paymentReceipt) {
        this.paymentReceipt = paymentReceipt;
    }

    // toString method
    @Override
    public String toString() {
        return "Performancebooking" +
               "id=" + id +
               ", userID=" + userID +
               ", performanceID=" + performanceID +
               ", performanceDateTime=" + performanceDateTime +
               ", objective='" + objective + '\'' +
               ", organization='" + organization + '\'' +
               '}';
    }

    // Implement equals() and hashCode() if necessary
}