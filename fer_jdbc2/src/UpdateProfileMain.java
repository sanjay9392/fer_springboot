import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.rs.fer.util.DBUtil;

public class UpdateProfileMain {

	public static void main(String[] args) {

		boolean isUpdateProfile = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// 1.Register the driver

		try {
			connection = DBUtil.getConnection();

			// 3.Create the statement
			String query = "UPDATE USER SET FIRSTNAME=?,MIDDLENAME=?,LASTNAME=?,EMAIL=?,MOBILE=? WHERE ID=? ";
			preparedStatement = connection.prepareStatement(query);

			// 3.1 set parameter values into the preparedStatement object
			preparedStatement.setString(1, "SUDHAKHAR");
			preparedStatement.setString(2, "REDDY");
			preparedStatement.setString(3, "CH");
			preparedStatement.setString(4, "SUDHA@GMAIL.COM");
			preparedStatement.setInt(6, 1);
			preparedStatement.setString(5, "9393414122");

			// 4.Execute the statement

			int noOfRecAffected = preparedStatement.executeUpdate();
			if (noOfRecAffected > 0) {
				int addressId = 1;
				if (addressId == 0) {

					// insert address
					query = "INSERT INTO ADDRESS (LINE1,LINE2,CITY,STATE,PINCODE,COUNTRY,USERID) VALUES(?,?,?,?,?,?,?)";
					preparedStatement = connection.prepareStatement(query);

					preparedStatement.setString(1, "100FT");
					preparedStatement.setString(2, "Madha");
					preparedStatement.setString(3, "HYD");
					preparedStatement.setString(4, "TG");
					preparedStatement.setString(5, "52118");
					preparedStatement.setString(6, "IND");
					preparedStatement.setInt(7, 1);

					noOfRecAffected = preparedStatement.executeUpdate();
				} else {
					// update address
					query = "UPDATE ADDRESS SET LINE1=?,LINE2=?,CITY=?,STATE=?,PINCODE=?,COUNTRY=? WHERE ID=? ";
					preparedStatement = connection.prepareStatement(query);

					preparedStatement.setString(1, "100FT Road");
					preparedStatement.setString(2, "Madhaphur");
					preparedStatement.setString(3, "Hydrabad");
					preparedStatement.setString(4, "TS");
					preparedStatement.setString(5, "521185");
					preparedStatement.setString(6, "IN");
					preparedStatement.setInt(7, addressId);

					noOfRecAffected = preparedStatement.executeUpdate();
				}
				if (noOfRecAffected > 0) {
					isUpdateProfile = true;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5.Close the connection
			DBUtil.closeConnection(connection);
		}
		// show the status
		if (isUpdateProfile) {
			System.out.println("Profile Updated successfully.....! ");
		} else {
			System.out.println("Profile Updation is failed.....!");
		}

	}

}
