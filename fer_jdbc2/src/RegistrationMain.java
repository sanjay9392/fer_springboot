import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.rs.fer.util.DBUtil;

public class RegistrationMain {

	public static void main(String[] args) {

		boolean isRegister = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// 1.Register the driver

		try {
			connection = DBUtil.getConnection();

			// 3.Create the statement
			String query = "INSERT INTO USER (FIRSTNAME,MIDDLENAME,LASTNAME,EMAIL,USERNAME,PASSWORD,MOBILE) VALUES(?,?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(query);

			// 3.1 set parameter values into the preparedStatement object
			preparedStatement.setString(1, "SUDHA");
			preparedStatement.setString(2, "REDDY");
			preparedStatement.setString(3, "C");
			preparedStatement.setString(4, "SUDHA@RS.COM");
			preparedStatement.setString(5, "SUDHA");
			preparedStatement.setString(6, "RS");
			preparedStatement.setString(7, "9392414122");

			// 4.Execute the statement

			int noOfRecAffected = preparedStatement.executeUpdate();
			if (noOfRecAffected > 0) {
				isRegister = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5.Close the connection
			DBUtil.closeConnection(connection);
		}
		// show the status
		if (isRegister) {
			System.out.println("User Registration is done successfully.....! ");
		} else {
			System.out.println("User Registration is failed.....!");
		}

	}

}
