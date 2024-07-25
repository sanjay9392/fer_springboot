package com.rs.jdbc.preparedstatement.ex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class BatchUpdateExample {

	public static void main(String[] args) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// 1.Register the driver

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 2.Get the connection

			connection = DriverManager.getConnection("jdbc:mysql://localHost:3306/dec_2023?useSSL=false", "root",
					"root");

			// 3.Create the statement
			String query = "UPDATE EMPLOYEE SET SALARY = SALARY+? WHERE ID=? ";
			preparedStatement = connection.prepareStatement(query);

			// 3.1 set parameter values into the preparedStatement object

			for (int id = 1; id <= 8; id++) {

				preparedStatement.setFloat(1, 3000);
				preparedStatement.setInt(2, id);

				preparedStatement.addBatch();

			}
			// 4.Execute the statement

			int[] noOfRecAffected = preparedStatement.executeBatch();
			System.out.println(noOfRecAffected);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {

			// 5.Close the connection
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
