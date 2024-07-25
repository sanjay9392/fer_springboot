import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.rs.fer.util.DBUtil;

public class LoginMain {

	public static void main(String[] args) {

		boolean isValidUser = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// 1.Register the driver

		try {
			connection = DBUtil.getConnection();

			// 3.Create the statement
			String query = "SELECT * FROM USER WHERE USERNAME=? AND PASSWORD=? ";
			preparedStatement = connection.prepareStatement(query);

			// 3.1 set parameter values into the preparedStatement object
			preparedStatement.setString(1, "SUDHA");
			preparedStatement.setString(2, "RS");

			// 4.Execute the statement

			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				isValidUser = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5.Close the connection
			DBUtil.closeConnection(connection);
		}
		// show the status
		if (isValidUser) {
			System.out.println("Welcome to the User:User");
		} else {
			System.out.println("Incorrect UserName/Password.....Please try again...!");
		}

	}

}
