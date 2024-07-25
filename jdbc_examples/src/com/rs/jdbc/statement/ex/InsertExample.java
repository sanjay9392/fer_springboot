package com.rs.jdbc.statement.ex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertExample {

	public static void main(String[] args, String root) {
		Connection connection = null;
		Statement statement = null;
		// 1.Register the driver

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 2.Get the connection

			connection = DriverManager.getConnection("jdbc:mysql://localHost:3306/dec_23", root, root);

			// 3.Create the statement

			statement = connection.createStatement();

			// 4.Execute the statement

			String query = "INSERT INTO EMPLOYEE (NAME,PWD) VALUES('NINE','PWD9')";
			int noOfRecEffected = statement.executeUpdate(query);
			System.out.println(noOfRecEffected);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {

			// 5.Close the connection
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
