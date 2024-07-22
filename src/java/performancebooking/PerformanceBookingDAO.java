package performancebooking;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import db.DBConn;

public class PerformanceBookingDAO {

    private DBConn dbConn; // Assuming you have a DBConn class for handling database connections

    public PerformanceBookingDAO() {
        this.dbConn = new DBConn();
    }

    // Method to add a new performance booking
    public int addPerformanceBooking(int userID, String performanceID, LocalDateTime performanceDateTime, String objective, String organization) throws SQLException {
        String sql = "INSERT INTO performanceBooking (userID, performanceID, performanceDateTime, objective, organization) VALUES (?, ?, ?, ?, ?)";
        String generatedColumns[] = { "ID" };

        try (Connection connection = dbConn.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql, generatedColumns)) {

            preparedStatement.setInt(1, userID);
            preparedStatement.setString(2, performanceID);
            preparedStatement.setTimestamp(3, java.sql.Timestamp.valueOf(performanceDateTime));
            preparedStatement.setString(4, objective);
            preparedStatement.setString(5, organization);

            preparedStatement.executeUpdate();
            
            ResultSet rs = preparedStatement.getGeneratedKeys();

            if (rs.next()) {
                long id = rs.getLong(1);
                System.out.println("Inserted ID -" + id); // display inserted record
                return (int) id;
            }
            
        } catch (SQLException e) {
            System.out.println(e);

            throw e; // Rethrow the exception to be handled by the caller
        }
		return 0;
    }
    
    // Method to update a performance booking
    public boolean updatePerformanceBooking(int id, String organization, String objective, LocalDateTime bookDateTime, String performanceType) throws SQLException {
        String sql = "UPDATE performanceBooking SET organization = ?, objective = ?, bookDateTime = ?, performanceType = ? WHERE id = ?";

        try (Connection connection = dbConn.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, organization);
            preparedStatement.setString(2, objective);
            preparedStatement.setTimestamp(3, java.sql.Timestamp.valueOf(bookDateTime));
            preparedStatement.setString(4, performanceType);
            preparedStatement.setInt(5, id);

            int affectedRows = preparedStatement.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            throw e; // Rethrow the exception to be handled by the caller
        }
    }
    
    // Method to update a performance booking
    public boolean updatePerformancePaymentReceipt(String paymentReceipt, int bookingId) throws SQLException {
        String sql = "UPDATE performanceBooking SET paymentReceipt = ? WHERE id = ?";

        try (Connection connection = dbConn.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, paymentReceipt);
            preparedStatement.setInt(2, bookingId);

            int affectedRows = preparedStatement.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            throw e; // Rethrow the exception to be handled by the caller
        }
    }
    
    // Method to update a performance booking
    public boolean updatePerformanceBookingStatus(String status, int bookingId) throws SQLException {
        String sql = "UPDATE performanceBooking SET status = ? WHERE id = ?";

        try (Connection connection = dbConn.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, status);
            preparedStatement.setInt(2, bookingId);

            int affectedRows = preparedStatement.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            throw e; // Rethrow the exception to be handled by the caller
        }
    }
    
    public List<PerformanceBooking> selectAllPerformanceBooking() throws SQLException {
        List<PerformanceBooking> bookings = new ArrayList<>();
        String sql = "SELECT id, organization, objective, bookDateTime, performanceType, paymentReceipt, performanceID, userID  FROM performanceBooking";

        try (Connection connection = dbConn.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String organization = resultSet.getString("organization");
                String objective = resultSet.getString("objective");
                LocalDateTime bookDateTime = resultSet.getTimestamp("bookDateTime").toLocalDateTime();
                String performanceType = resultSet.getString("performanceType");
                String paymentReceipt = resultSet.getString("paymentReceipt");
                int performanceID = resultSet.getInt("performanceID");
                int userID = resultSet.getInt("userID");

                PerformanceBooking booking = new PerformanceBooking();
                bookings.add(booking);
            }
        } catch (SQLException e) {
            throw e; // Rethrow the exception to be handled by the caller
        }

        return bookings;
    }


}