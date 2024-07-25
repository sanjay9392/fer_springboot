package com.java.dao;

import com.javatpoint.beans.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmpDao {

	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/pagination_jdbc", "root", "root");
		} catch (Exception e) {
			System.out.println(e);
		}
		return connection;
	}

	public static List<Emp> getRecords(int start, int total) {
		List<Emp> list = new ArrayList<Emp>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from emp limit " + (start - 1) + "," + total);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Emp e = new Emp();
				e.setId(resultSet.getInt(1));
				e.setName(resultSet.getString(2));
				e.setSalary(resultSet.getFloat(3));
				list.add(e);
			}

			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public static int getRecordsCount() throws SQLException {
		int count = 0;
		Connection connection = null;
		try {
			connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("select count(*) from emp ");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				count = resultSet.getInt(1);
			}

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			connection.close();
		}
		return count;
	}
}
