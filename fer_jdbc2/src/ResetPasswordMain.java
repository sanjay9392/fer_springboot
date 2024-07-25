import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.rs.fer.util.DBUtil;

public class ResetPasswordMain {

	public static void main(String[] args) {

		boolean isResetPassword = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// 1.Register the driver

		try {
			connection = DBUtil.getConnection();

			// 3.Create the statement
			String query = "UPDATE USER SET PASSWORD=? WHERE ID=? AND PASSWORD=?";
			preparedStatement = connection.prepareStatement(query);

			// 3.1 set parameter values into the preparedStatement object
			preparedStatement.setString(1, "SANJAY");
			preparedStatement.setString(3, "RS");
			preparedStatement.setInt(2, 2);

			// 4.Execute the statement

			int noOfRecAffected = preparedStatement.executeUpdate();
			if (noOfRecAffected > 0) {
				isResetPassword = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5.Close the connection
			DBUtil.closeConnection(connection);
		}
		// show the status
		if (isResetPassword) {
			System.out.println("Password changed successfully.....! ");
		} else {
			System.out.println("Try for resetpassword is failed.....!");
		}

	}

}
