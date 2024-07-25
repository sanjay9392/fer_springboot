package com.rs.jdbc.preparedstatement.ex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class UpdateExample {

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
			String query = "UPDATE EMPLOYEE SET SALARY =?,DEPARTMENT=? WHERE ID=? ";
			preparedStatement = connection.prepareStatement(query);

			// 3.1 set parameter values into the preparedStatement object
			preparedStatement.setFloat(1, 60000);
			preparedStatement.setString(2, "DOTNET");
			preparedStatement.setInt(3, 8);
			// 4.Execute the statement

			int noOfRecAffected = preparedStatement.executeUpdate();
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
