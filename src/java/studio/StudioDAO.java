/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package studio;

import db.DBConn;
import java.io.ByteArrayInputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author iman
 */
public class StudioDAO {

    private final Connection connection;
    private int result;

    public StudioDAO() {
        connection = DBConn.getConnection();
    }

    public int addStudio(String studioName, String studioDescription, String studioSize, String capacity) {
        try {
            String generatedColumns[] = {"ID"};

            String mySqlQuery = "insert into studioType(studioName, studioDescription, studioSize, capacity)" + " values(?, ?, ?, ?)";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery, generatedColumns);
            myPs.setString(1, studioName);
            myPs.setString(2, studioDescription);
            myPs.setString(3, studioSize);
            myPs.setString(4, capacity);

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

    public Studio retrieveById(String studioID) {
        Studio studio = new Studio();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from studioType where studioID=" + studioID;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                studio.setStudioID(myRs.getInt(1));
                studio.setStudioName(myRs.getString(2));
                studio.setStudioImg(myRs.getString(3));
                studio.setStudioDescription(myRs.getString(4));
                studio.setStudioSize(myRs.getString(5));
                studio.setCapacity(myRs.getString(6));
            }
        } catch (Exception e) {
            System.out.println("Exception is :" + e);
        }
        return studio;
    }

    public List<Studio> retrieveStudio() {
        List<Studio> allStudio = new ArrayList<>();
        Studio All;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from studioType";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                All = new Studio();
                All.setStudioID(myRs.getInt(1));
                // Assuming studioImg is a blob
//				Blob blob = myRs.getBlob(3);
//				int blobLength = (int) blob.length();
//				byte[] blobAsBytes = blob.getBytes(1, blobLength);
//				All.setStudioImg(blobAsBytes);
                allStudio.add(All);
            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return allStudio;
    }

    public int updateStudio(Studio studio) {
        try {
            String mySqlQuery = "update account set studioName=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, studio.getStudioName());
            // Use setBlob for longblob column (Assuming studioImg is a byte[])
//			ByteArrayInputStream inputStream = new ByteArrayInputStream(studio.getStudioImg());
//			myPs.setBlob(2, inputStream);
            myPs.setInt(3, studio.getStudioID());

            result = myPs.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;

    }

    public int updateStudioImage(String studioImage, int id) {
        try {
            String mySqlQuery = "update studiotype set studioImg = ? where studioID = ?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, studioImage);
            myPs.setInt(2, id);

            result = myPs.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;

    }

    public int deleteStudio(String studioID) {
        try {
            String mySqlQuery = "delete from studiotype where studioID=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, studioID);
            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is :" + e);
        }
        return result;
    }
}
