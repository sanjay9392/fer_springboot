package com.rs.jdbc.preparedstatement.ex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SelectExample {

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
			String query = "SELECT* FROM EMPLOYEE WHERE ID=?";
			preparedStatement = connection.prepareStatement(query);

			// 3.1 set parameter values into the preparedStatement object
			preparedStatement.setInt(1,6);
			// 4.Execute the statement

			ResultSet resultSet = preparedStatement.executeQuery();

			// 4.1 Processing the resultSet
			while (resultSet.next()) {

				// a.Getting the Column data
				int id = resultSet.getInt(1);
				String name = resultSet.getString(2);
				String pwd = resultSet.getString(3);
				float salary = resultSet.getFloat(4);
				String department = resultSet.getString(5);

				// b.Print the Column data in the console
				System.out.println("ID:" + id);
				System.out.println("Name:" + name);
				System.out.println("Salary:" + salary);
				System.out.println("Department:" + department);

				System.out.println("..................................");
			}
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
