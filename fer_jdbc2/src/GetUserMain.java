import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.rs.fer.util.DBUtil;

public class GetUserMain {

	public static void main(String[] args) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// 1.Register the driver

		try {
			connection = DBUtil.getConnection();

			// 3.Create the statement
			String query = "SELECT U.*,A.* FROM USER U LEFT JOIN ADDRESS A ON U.ID = A.USERID WHERE U.ID=? ";
			preparedStatement = connection.prepareStatement(query);

			// 3.1 set parameter values into the preparedStatement object
			preparedStatement.setInt(1, 1);

			// 4.Execute the statement

			ResultSet resultSet = preparedStatement.executeQuery();
			// processing the resultSet
			while (resultSet.next()) {
				// get the 'user' column data

				int id = resultSet.getInt(1);
				String firstName = resultSet.getString(2);
				String middleName = resultSet.getString(3);
				String lastName = resultSet.getString(4);
				String email = resultSet.getString(5);
				String userName = resultSet.getString(6);
				String password = resultSet.getString(7);
				String mobile = resultSet.getString(8);

				// get the 'address' column data
				int addrId = resultSet.getInt(9);
				String line1 = resultSet.getString(10);
				String line2 = resultSet.getString(11);
				String city = resultSet.getString(12);
				String state = resultSet.getString(13);
				String pinCode = resultSet.getString(14);
				String country = resultSet.getString(15);
				int uId = resultSet.getInt(16);

				// show the status
				System.out.println("............Name Info...........");

				System.out.println("FirstName:" + firstName);
				System.out.println("MiddleName:" + middleName);
				System.out.println("LastName:" + lastName);

				System.out.println("............Contact Info...........");

				System.out.println("Email:" + email);
				System.out.println("Mobile:" + mobile);

				System.out.println("............Address Info...........");

				System.out.println("Line 1:" + line1);
				System.out.println("Line 2:" + line2);
				System.out.println("City:" + city);
				System.out.println("State:" + state);
				System.out.println("Pin Code:" + pinCode);
				System.out.println("Country:" + country);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5.Close the connection
			DBUtil.closeConnection(connection);
		}

	}

}
