/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package instrument;

import db.DBConn;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import instrument.Instrument;

/**
 *
 * @author user
 */
public class InstrumentDAO {
    
    private final Connection connection;
    private int result;

    public InstrumentDAO() {
        connection = DBConn.getConnection();
    }


	public int addInstrument(String instrumentName, String instrumentDescription) {
		try {
	        String generatedColumns[] = { "ID" };

			String mySqlQuery = "insert into instrumenttype(instrumentName, instrumentDescription)" + " values(?,?)";
			PreparedStatement myPs = connection.prepareStatement(mySqlQuery, generatedColumns);
			myPs.setString(1, instrumentName);
			myPs.setString(2, instrumentDescription);

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

    public Instrument retrieveById(String instrumentID) {
        Instrument instrument = new Instrument();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from instrumentType where instrumentID=" + instrumentID;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                instrument.setInstrumentID(myRs.getInt(1));
                instrument.setInstrumentName(myRs.getString(2));
                instrument.setInstrumentImage(myRs.getString(3));
                instrument.setInstrumentDescription(myRs.getString(4));
            }
        } catch (Exception e) {
            System.out.println("Exception is :" + e);
        }
        return instrument;
    }

    public List<Instrument> retrieveInstrument() {
        List<Instrument> allInstrument = new ArrayList<Instrument>();
        Instrument All;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from instrumentType";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                All = new Instrument();
                All.setInstrumentID(myRs.getInt(1));
                allInstrument.add(All);
            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return allInstrument;
    }

    public int updateInstrument(Instrument instrument) {
        try {
            String mySqlQuery = "update account set instrumentName=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, instrument.getInstrumentName());
            myPs.setInt(5, instrument.getInstrumentID());

            result = myPs.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;

    }

    public int deleteInstrument(String instrumentID) {
        try {
            String mySqlQuery = "delete from instrumentType where instrumentID=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, instrumentID);
            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is :" + e);
        }
        return result;
    }
    
	public int updateInstrumentImage(String instrumentImage, int id) {
		try {
			String mySqlQuery = "update instrumenttype set instrumentImg = ? where instrumentID = ?";
			PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
			myPs.setString(1, instrumentImage);
			myPs.setInt(2, id);

			result = myPs.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return result;

	}
}
