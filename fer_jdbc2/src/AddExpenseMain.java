import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.rs.fer.util.DBUtil;

public class AddExpenseMain {

	public static void main(String[] args) {

		boolean isAddExpense = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// 1.Register the driver

		try {
			//1 & 2
			connection = DBUtil.getConnection();
			// 3.Create the statement
			String query = "INSERT INTO EXPENSE (TYPE,DATE,PRICE,NUMBEROFITEMS,TOTAL,BYWHOM,USERID) VALUES(?,?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(query);

			// 3.1 set parameter values into the preparedStatement object
			preparedStatement.setString(1, "Tea");
			preparedStatement.setString(2, "03-01-2024");
			preparedStatement.setFloat(3, 15);
			preparedStatement.setInt(4, 4);
			preparedStatement.setFloat(5, 60);
			preparedStatement.setString(6, "Me");
			preparedStatement.setInt(7, 1);

			// 4.Execute the statement

			int noOfRecAffected = preparedStatement.executeUpdate();
			if (noOfRecAffected > 0) {
				isAddExpense = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5.Close the connection
			DBUtil.closeConnection(connection);
		}
		// show the status
		if (isAddExpense) {
			System.out.println("Expense added successfully.....! ");
		} else {
			System.out.println("Expense add is failed.....!");
		}

	}

}
