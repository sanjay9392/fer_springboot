import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.rs.fer.util.DBUtil;

public class DeleteExpenseMain {

	public static void main(String[] args) {

		boolean isDeleteExpense = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// 1.Register the driver

		try {
			connection = DBUtil.getConnection();

			// 3.Create the statement
			String query = "DELETE FROM EXPENSE WHERE ID=?";
			preparedStatement = connection.prepareStatement(query);

			// 3.1 set parameter values into the preparedStatement object

			preparedStatement.setInt(1, 6);

			// 4.Execute the statement

			int noOfRecAffected = preparedStatement.executeUpdate();
			if (noOfRecAffected > 0) {
				isDeleteExpense = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5.Close the connection
			DBUtil.closeConnection(connection);
		}
		// show the status
		if (isDeleteExpense) {
			System.out.println("Expense Deleted successfully.....! ");
		} else {
			System.out.println("Expense deletion is failed.....!");
		}

	}

}
