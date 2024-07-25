package com.rs.jdbc.statement.ex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class BatchUpdateExample {

	public static void main(String[] args) {
		Connection connection = null;
		Statement statement = null;
		// 1.Register the driver

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 2.Get the connection

			connection = DriverManager.getConnection("jdbc:mysql://localHost:3306/dec_2023?useSSL=false", "root",
					"root");

			for (int id = 1; id <= 8; id++) {
				// 3.Create the statement

				statement = connection.createStatement();

				// 4.Execute the statement

				String query = "UPDATE EMPLOYEE SET SALARY =SALARY+5000 WHERE ID=" + id;
				int noOfRecAffected = statement.executeUpdate(query);
				System.out.println(noOfRecAffected);
				// close the statement
				statement.close();

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
