import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.rs.fer.util.DBUtil;

public class ExpenseReportMain {

	public static void main(String[] args) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// 1.Register the driver

		try {

			connection = DBUtil.getConnection();
			// 3.Create the statement
			String query = "SELECT * FROM EXPENSE WHERE USERID=? AND TYPE=? AND DATE BETWEEN ? AND ? ";
			preparedStatement = connection.prepareStatement(query);

			// 3.1 set parameter values into the preparedStatement object
			preparedStatement.setInt(1, 1);
			preparedStatement.setString(2, "Tea");
			preparedStatement.setString(3, "02-01-2024");
			preparedStatement.setString(4, "04-01-2024");

			// 4.Execute the statement

			ResultSet resultSet = preparedStatement.executeQuery();
			// 4.1 processing the resultSet
			while (resultSet.next()) {

				// a.Get the column data
				int id = resultSet.getInt(1);
				String type = resultSet.getString(2);
				String date = resultSet.getString(3);
				float price = resultSet.getFloat(4);
				int numberofitems = resultSet.getInt(5);
				float total = resultSet.getFloat(6);
				String bywhom = resultSet.getString(7);
				int uId = resultSet.getInt(8);

				// b.Print the column data
				System.out.println("ID:" + id);
				System.out.println("Expense Type:" + type);
				System.out.println("Date:" + date);
				System.out.println("Price:" + price);
				System.out.println("Number Of Items:" + numberofitems);
				System.out.println("Total:" + total);
				System.out.println("By Whom:" + bywhom);
				System.out.println("UserID:" + uId);

				System.out.println("..............................................");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5.Close the connection
			DBUtil.closeConnection(connection);
		}

	}

}
