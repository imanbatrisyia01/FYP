/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package instrumentbooking;

import db.DBConn;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class InstrumentbookingDAO {

    private final Connection connection;
    private int result;

    public InstrumentbookingDAO() throws SQLException {
        connection = DBConn.getConnection();
    }

    // Insert a new Instrumentbooking record
    public void addInstrumentbooking(int userID, int instrumentID, LocalDateTime startDateTime, LocalDateTime finishDateTime, String objective, String organization) throws SQLException {
        String sql = "INSERT INTO instrumentbooking (userID, instrumentID, startDateTime, finishDateTime, objective, organization) VALUES ( ?, ?, ?, ?, ?, ?)";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, userID);
            preparedStatement.setInt(2, instrumentID);
            preparedStatement.setTimestamp(3, Timestamp.valueOf(startDateTime));
            preparedStatement.setTimestamp(4, Timestamp.valueOf(finishDateTime));
            preparedStatement.setString(5, objective);
            preparedStatement.setString(6, organization);
            preparedStatement.executeUpdate();
        }
    }

    public boolean isInstrumentBookingOverlap(int instrumentID, LocalDateTime startDateTime, LocalDateTime finishDateTime) throws SQLException {
        // Your SQL query to check for overlapping bookings
        String sql = "SELECT * FROM instrumentBooking WHERE instrumentID = ? AND ((startDateTime >= ? AND startDateTime < ?) OR (finishDateTime > ? AND finishDateTime <= ?))";

        try ( PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, instrumentID);
            preparedStatement.setTimestamp(2, Timestamp.valueOf(startDateTime));
            preparedStatement.setTimestamp(3, Timestamp.valueOf(finishDateTime));
            preparedStatement.setTimestamp(4, Timestamp.valueOf(startDateTime));
            preparedStatement.setTimestamp(5, Timestamp.valueOf(finishDateTime));

            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next(); // If there's any result, it means there's an overlap
            }
        }
    }

    public Instrumentbooking retrieveById(String id) throws SQLException {
        Instrumentbooking instrumentbooking = new Instrumentbooking();
        String sql = "SELECT * FROM instrumentbooking WHERE id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, id);
            try ( ResultSet myRs = preparedStatement.executeQuery()) {
                if (myRs.next()) {
                    populateInstrumentbookingFromResultSet(instrumentbooking, myRs);
                }
            }
        }
        return instrumentbooking;
    }

    public List<Instrumentbooking> retrieveInstrumentbooking() throws SQLException {
        List<Instrumentbooking> allInstrumentbooking = new ArrayList<>();
        String sql = "SELECT * FROM instrumentbooking";
        try ( Statement statement = connection.createStatement();  ResultSet myRs = statement.executeQuery(sql)) {
            while (myRs.next()) {
                Instrumentbooking instrumentbooking = new Instrumentbooking();
                populateInstrumentbookingFromResultSet(instrumentbooking, myRs);
                allInstrumentbooking.add(instrumentbooking);
            }
        }
        return allInstrumentbooking;
    }

    public int deleteInstrumentBooking(String id) {
        try {
            String mySqlQuery = "DELETE FROM instrumentbooking WHERE id=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, id);
            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is :" + e);
        }
        return result;
    }

    private void populateInstrumentbookingFromResultSet(Instrumentbooking instrumentbooking, ResultSet myRs) throws SQLException {
        instrumentbooking.setId(myRs.getInt(1));
        instrumentbooking.setObjective(myRs.getString(2));
        instrumentbooking.setOrganization(myRs.getString(3));
        instrumentbooking.setStartDateTime(myRs.getTimestamp(4));
        instrumentbooking.setFinishDateTime(myRs.getTimestamp(5));
    }

    public boolean updateInstrumentBookingPaymentReceipt(String paymentReceipt, int bookingId) throws SQLException {
        String sql = "UPDATE instrumentbooking SET paymentReceipt = ? WHERE id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, paymentReceipt);
            preparedStatement.setInt(2, bookingId);

            int affectedRows = preparedStatement.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            throw e; // Rethrow the exception to be handled by the caller
        }
    }

    // Other methods for update, delete, and retrieval
}
