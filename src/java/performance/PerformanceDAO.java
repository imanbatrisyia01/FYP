/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package performance;

import db.DBConn;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PerformanceDAO {

    private final Connection connection;
    private int result;

    public PerformanceDAO() {
        connection = DBConn.getConnection();
    }


    
	public int addPerformance(String performanceName,  String performanceDesc, Double price) {
		try {
	        String generatedColumns[] = { "ID" };

			String mySqlQuery = "insert into performancetype(performanceName, performanceDesc, price) values(?, ?, ?)";
			PreparedStatement myPs = connection.prepareStatement(mySqlQuery, generatedColumns);
            myPs.setString(1, performanceName);
            myPs.setString(2, performanceDesc);
            myPs.setDouble(3, price);

			myPs.executeUpdate();
			
            ResultSet rs = myPs.getGeneratedKeys();

            if (rs.next()) {
                long id = rs.getLong(1);
                System.out.println("Inserted ID -" + id); // display inserted record
                return (int) id;
            }
            
		} catch (Exception e) {
			System.out.println("Exception is :" + e);
		}
		return 0;
	}

    public Performance retrieveById(String performanceID) {
        Performance performance = new Performance();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from performancetype where performanceID=" + performanceID;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                performance.setPerformanceID(myRs.getInt(1));
                performance.setPerformanceName(myRs.getString(2));
                performance.setPerformanceDesc(myRs.getString(3));
                performance.setImage(myRs.getString(4));
                performance.setPrice(myRs.getDouble(5));

            }
        } catch (Exception e) {
            System.out.println("Exception is :" + e);
        }
        return performance;
    }

    public List<Performance> retrievePerformance() {
        List<Performance> allPerformance = new ArrayList<Performance>();
        Performance All;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from performancetype";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                All = new Performance();
                All.setPerformanceID(myRs.getInt(1));
                All.setPerformanceName(myRs.getString(2));
                All.setPerformanceDesc(myRs.getString(3));
                All.setImage(myRs.getString(4));
                All.setPrice(myRs.getDouble(5));
                allPerformance.add(All);
            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return allPerformance;
    }

    public int updatePerformance(Performance performance) {
        try {
            String mySqlQuery = "update performanceType set performanceName=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, performance.getPerformanceName());
            myPs.setString(2, performance.getPerformanceDesc());
            myPs.setInt(3, performance.getPerformanceID());

            result = myPs.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;

    }

    public int deletePerformance(String performanceID) {
        try {
            String mySqlQuery = "delete from performanceType where performanceID=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, performanceID);
            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is :" + e);
        }
        return result;
    }
    
	public int updatePerformanceImage(String image, int id) {
		try {
			String mySqlQuery = "update performancetype set image = ? where performanceID = ?";
			PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
			myPs.setString(1, image);
			myPs.setInt(2, id);

			result = myPs.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return result;

	}
}
