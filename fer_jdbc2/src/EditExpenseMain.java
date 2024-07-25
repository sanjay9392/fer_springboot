import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.rs.fer.util.DBUtil;

public class EditExpenseMain {

	public static void main(String[] args) {

		boolean isEditExpense = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// 1.Register the driver

		try {

			connection = DBUtil.getConnection();
			// 3.Create the statement
			String query = "UPDATE EXPENSE SET TYPE=?,DATE=?,PRICE=?,NUMBEROFITEMS=?,TOTAL=?,BYWHOM =? WHERE ID=?";
			preparedStatement = connection.prepareStatement(query);

			// 3.1 set parameter values into the preparedStatement object
			preparedStatement.setString(1, "Coffee");
			preparedStatement.setString(2, "04-01-2024");
			preparedStatement.setFloat(3, 20);
			preparedStatement.setInt(4, 4);
			preparedStatement.setFloat(5, 80);
			preparedStatement.setString(6, "Me");
			preparedStatement.setInt(7, 2);

			// 4.Execute the statement

			int noOfRecAffected = preparedStatement.executeUpdate();
			if (noOfRecAffected > 0) {
				isEditExpense = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5.Close the connection
			DBUtil.closeConnection(connection);
		}
		// show the status
		if (isEditExpense) {
			System.out.println("Expense edited successfully.....! ");
		} else {
			System.out.println("Expense edit is failed.....!");
		}

	}

}
