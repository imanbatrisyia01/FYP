package studiobooking;

import db.DBConn;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class StudiobookingDAO {

    private final Connection connection;

    public StudiobookingDAO() throws SQLException {
        connection = DBConn.getConnection();
    }

    // Insert a new studiobooking record
    public void addStudiobooking(int userID, int studioID, LocalDateTime startDateTime, LocalDateTime finishDateTime, String objective, String organization) throws SQLException {
        String sql = "INSERT INTO studiobooking (userID, studioID, startDateTime, finishDateTime, objective, organization) VALUES ( ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, userID);
            preparedStatement.setInt(2, studioID);
            preparedStatement.setTimestamp(3, Timestamp.valueOf(startDateTime));
            preparedStatement.setTimestamp(4, Timestamp.valueOf(finishDateTime));
            preparedStatement.setString(5, objective);
            preparedStatement.setString(6, organization);
            preparedStatement.executeUpdate();
        }
    }
    
    // Check if there is an overlap with existing bookings
    public boolean isBookingOverlap(int studioID, LocalDateTime startDateTime, LocalDateTime finishDateTime) {
        String sql = "SELECT * FROM studiobooking WHERE studioID = ? AND ((startDateTime <= ? AND finishDateTime >= ?) OR (startDateTime <= ? AND finishDateTime >= ?))";
        
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, studioID);
            preparedStatement.setTimestamp(2, Timestamp.valueOf(finishDateTime));
            preparedStatement.setTimestamp(3, Timestamp.valueOf(startDateTime));
            preparedStatement.setTimestamp(4, Timestamp.valueOf(finishDateTime));
            preparedStatement.setTimestamp(5, Timestamp.valueOf(startDateTime));

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next(); // If there is a result, it means there is an overlap
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions or log errors as needed
            return true; // Assume an overlap in case of an exception
        }
    }

    public Studiobooking retrieveById(String sbookingID) throws SQLException {
        Studiobooking studiobooking = new Studiobooking();
        String sql = "SELECT * FROM studioBooking WHERE sbookingID = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, sbookingID);
            try (ResultSet myRs = preparedStatement.executeQuery()) {
                if (myRs.next()) {
                    populateStudiobookingFromResultSet(studiobooking, myRs);
                }
            }
        }
        return studiobooking;
    }

    public List<Studiobooking> retrieveStudiobooking() throws SQLException {
        List<Studiobooking> allStudiobooking = new ArrayList<>();
        String sql = "SELECT * FROM studioBooking";
        try (Statement statement = connection.createStatement();
             ResultSet myRs = statement.executeQuery(sql)) {
            while (myRs.next()) {
                Studiobooking studiobooking = new Studiobooking();
                populateStudiobookingFromResultSet(studiobooking, myRs);
                allStudiobooking.add(studiobooking);
            }
        }
        return allStudiobooking;
    }

    private void populateStudiobookingFromResultSet(Studiobooking studiobooking, ResultSet myRs) throws SQLException {
        studiobooking.setSbookingID(myRs.getInt(1));
        studiobooking.setObjective(myRs.getString(2));
        studiobooking.setOrganization(myRs.getString(3));
        studiobooking.setStartDateTime(myRs.getTimestamp(4));
        studiobooking.setFinishDateTime(myRs.getTimestamp(5));
    }
    
    // Method to update a performance booking
    public boolean updateInstrumentBookingPaymentReceipt(String paymentReceipt, int bookingId) throws SQLException {
        String sql = "UPDATE instrumentbooking SET paymentReceipt = ? WHERE id = ?";
        try 
           {
        	PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, paymentReceipt);
            preparedStatement.setInt(2, bookingId);

            int affectedRows = preparedStatement.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            throw e; // Rethrow the exception to be handled by the caller
        }
    }
    
    public boolean updateStudioBookingStatus(String status, int bookingId) throws SQLException {
        String sql = "UPDATE studiobooking SET status = ? WHERE id = ?";
        try 
           {
        	PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, status);
            preparedStatement.setInt(2, bookingId);

            int affectedRows = preparedStatement.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            throw e; // Rethrow the exception to be handled by the caller
        }
    }
    

    // Other methods for update, delete, and retrieval
}