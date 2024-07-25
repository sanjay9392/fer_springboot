package com.rs.fer.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.rs.fer.bean.Address;
import com.rs.fer.bean.Expense;
import com.rs.fer.bean.User;
import com.rs.fer.service.FERService;
import com.rs.fer.util.DBUtil;

public class FERServiceImpl implements FERService {


	@Override
	public boolean registration(User user) {
		boolean isRegister = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// 1.Register the driver

		try {
			connection = DBUtil.getConnection();

			// 3.Create the statement
			String query = "INSERT INTO USER (FIRSTNAME,MIDDLENAME,LASTNAME,EMAIL,USERNAME,PASSWORD,MOBILE) VALUES(?,?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(query);

			// 3.1 set parameter values into the preparedStatement object
			preparedStatement.setString(1, user.getFirstName());
			preparedStatement.setString(2, user.getMiddleName());
			preparedStatement.setString(3, user.getLastName());
			preparedStatement.setString(4, user.getEmail());
			preparedStatement.setString(5, user.getUsername());
			preparedStatement.setString(6, user.getPassword());
			preparedStatement.setString(7, user.getMobile());

			// 4.Execute the statement

			int noOfRecAffected = preparedStatement.executeUpdate();
			if (noOfRecAffected > 0) {
				isRegister = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5.Close the connection
			DBUtil.closeConnection(connection);
		}
		return isRegister;
	}

	@Override
	public int login(String username, String password) {


		int userId = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// 1.Register the driver

		try {
			connection = DBUtil.getConnection();

			// 3.Create the statement
			String query = "SELECT * FROM USER WHERE USERNAME=? AND PASSWORD=? ";
			preparedStatement = connection.prepareStatement(query);

			// 3.1 set parameter values into the preparedStatement object
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);

			// 4.Execute the statement

			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				userId = resultSet.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5.Close the connection
			DBUtil.closeConnection(connection);
		}
		return userId;
	}

	@Override
	public boolean addExpense(Expense expense) {

		boolean isAddExpense = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// 1.Register the driver

		try {
			// 1 & 2
			connection = DBUtil.getConnection();
			// 3.Create the statement
			String query = "INSERT INTO EXPENSE (TYPE,DATE,PRICE,NUMBEROFITEMS,TOTAL,BYWHOM,USERID) VALUES(?,?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(query);

			// 3.1 set parameter values into the preparedStatement object
			preparedStatement.setString(1, expense.getType());
			preparedStatement.setString(2, expense.getDate());
			preparedStatement.setFloat(3, expense.getPrice());
			preparedStatement.setInt(4, expense.getNumberofitems());
			preparedStatement.setFloat(5, expense.getTotal());
			preparedStatement.setString(6, expense.getBywhom());
			preparedStatement.setInt(7, expense.getUserid());

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
		return isAddExpense;
	}

	@Override
	public boolean editExpense(Expense expense) {
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
			preparedStatement.setString(1, expense.getType());
			preparedStatement.setString(2, expense.getDate());
			preparedStatement.setFloat(3, expense.getPrice());
			preparedStatement.setInt(4, expense.getNumberofitems());
			preparedStatement.setFloat(5, expense.getTotal());
			preparedStatement.setString(6, expense.getBywhom());
			preparedStatement.setInt(7, expense.getId());

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
		return isEditExpense;
	}

	@Override
	public boolean deleteExpense(int id) {
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

			preparedStatement.setInt(1, id);

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
		return isDeleteExpense;
	}

	@Override
	public boolean resetPassword(int id, String currrentPassword,String newPassword) {

		boolean isResetPassword = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// 1.Register the driver

		try {
			connection = DBUtil.getConnection();

			// 3.Create the statement
			String query = "UPDATE USER SET PASSWORD=? WHERE ID=? AND PASSWORD=?";
			preparedStatement = connection.prepareStatement(query);

			// 3.1 set parameter values into the preparedStatement object
			preparedStatement.setString(1, newPassword);
			preparedStatement.setString(3, currrentPassword);
			preparedStatement.setInt(2, id);

			// 4.Execute the statement

			int noOfRecAffected = preparedStatement.executeUpdate();
			if (noOfRecAffected > 0) {
				isResetPassword = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5.Close the connection
			DBUtil.closeConnection(connection);
		}
		return isResetPassword;
	}

	@Override
	public List<Expense> getExpenseOptions(int userId) {

		List<Expense> expenses = new ArrayList<>();
		Expense expense = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// 1.Register the driver

		try {
			connection = DBUtil.getConnection();

			// 3.Create the statement
			String query = "SELECT * FROM EXPENSE WHERE USERID=?";
			preparedStatement = connection.prepareStatement(query);

			// 3.1 set parameter values into the preparedStatement object
			preparedStatement.setInt(1, userId);

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

				// b.Load the column data into the expense table
				expense = new Expense();
				expense.setId(id);
				expense.setType(type);
				expense.setDate(date);
				expense.setPrice(price);
				expense.setNumberofitems(numberofitems);
				expense.setTotal(total);
				expense.setBywhom(bywhom);
				expense.setUserid(uId);
				// c.Add expense to the expenses collection object
				expenses.add(expense);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5.Close the connection
			DBUtil.closeConnection(connection);
		}
		return expenses;
	}

	@Override
	public Expense getExpense(int expenseId) {

		Expense expense = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// 1.Register the driver

		try {
			connection = DBUtil.getConnection();

			// 3.Create the statement
			String query = "SELECT * FROM EXPENSE WHERE ID=?";
			preparedStatement = connection.prepareStatement(query);

			// 3.1 set parameter values into the preparedStatement object
			preparedStatement.setInt(1, expenseId);

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

				// b.Load the column data into the expense table
				expense = new Expense();
				expense.setId(id);
				expense.setType(type);
				expense.setDate(date);
				expense.setPrice(price);
				expense.setNumberofitems(numberofitems);
				expense.setTotal(total);
				expense.setBywhom(bywhom);
				expense.setUserid(uId);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5.Close the connection
			DBUtil.closeConnection(connection);
		}
		return expense;
	}

	@Override
	public List<Expense> getExpenseReport(int userId, String expenseType, String fromDate, String toDate) {
		List<Expense> expenses = new ArrayList<>();
		Expense expense = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// 1.Register the driver

		try {
			connection = DBUtil.getConnection();

			// 3.Create the statement
			String query = "SELECT * FROM EXPENSE WHERE USERID=? AND TYPE=? AND DATE BETWEEN ? AND ?";
			preparedStatement = connection.prepareStatement(query);

			// 3.1 set parameter values into the preparedStatement object
			preparedStatement.setInt(1, userId);
			preparedStatement.setString(2, expenseType);
			preparedStatement.setString(3, fromDate);
			preparedStatement.setString(4, toDate);

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

				// b.Load the column data into the expense table
				expense = new Expense();
				expense.setId(id);
				expense.setType(type);
				expense.setDate(date);
				expense.setPrice(price);
				expense.setNumberofitems(numberofitems);
				expense.setTotal(total);
				expense.setBywhom(bywhom);
				expense.setUserid(uId);
				// c.Add expense to the expenses collection object
				expenses.add(expense);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5.Close the connection
			DBUtil.closeConnection(connection);
		}
		return expenses;

	}

	@Override
	public User getUser(int userId) {
		User user = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// 1.Register the driver

		try {
			connection = DBUtil.getConnection();

			// 3.Create the statement
			String query = "SELECT U.*,A.* FROM USER U LEFT JOIN ADDRESS A ON U.ID = A.USERID WHERE U.ID=? ";
			preparedStatement = connection.prepareStatement(query);

			// 3.1 set parameter values into the preparedStatement object
			preparedStatement.setInt(1, userId);

			// 4.Execute the statement

			ResultSet resultSet = preparedStatement.executeQuery();
			// processing the resultSet
			while (resultSet.next()) {
				// get the 'user' column data

				int id = resultSet.getInt(1);
				String firstName = resultSet.getString(2);
				String middleName = resultSet.getString(3);
				String lastName = resultSet.getString(4);
				String email = resultSet.getString(5);
				String userName = resultSet.getString(6);
				String password = resultSet.getString(7);
				String mobile = resultSet.getString(8);

				// get the 'address' column data
				int addrId = resultSet.getInt(9);
				String line1 = resultSet.getString(10);
				String line2 = resultSet.getString(11);
				String city = resultSet.getString(12);
				String state = resultSet.getString(13);
				String pinCode = resultSet.getString(14);
				String country = resultSet.getString(15);
				int uId = resultSet.getInt(16);

				// load user column data into the user object
				user = new User();
				user.setId(id);
				user.setFirstName(firstName);
				user.setMiddleName(middleName);
				user.setLastName(lastName);
				user.setEmail(email);
				user.setUsername(userName);
				user.setPassword(password);
				user.setMobile(mobile);

				// load address column data into the address object
				Address address = new Address();
				address.setId(addrId);
				address.setLine1(line1);
				address.setLine2(line2);
				address.setCity(city);
				address.setState(state);
				address.setPinCode(pinCode);
				address.setCountry(country);
				address.setUserid(uId);
				// load address object into the user object
				user.setAddress(address);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5.Close the connection
			DBUtil.closeConnection(connection);
		}

		return user;
	}

	@Override
	public boolean updateUser(User user) {
		boolean isUpdateProfile = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// 1.Register the driver

		try {
			connection = DBUtil.getConnection();

			// 3.Create the statement
			String query = "UPDATE USER SET FIRSTNAME=?,MIDDLENAME=?,LASTNAME=?,EMAIL=?,MOBILE=? WHERE ID=? ";
			preparedStatement = connection.prepareStatement(query);

			// 3.1 set parameter values into the preparedStatement object
			preparedStatement.setString(1, user.getFirstName());
			preparedStatement.setString(2, user.getMiddleName());
			preparedStatement.setString(3, user.getLastName());
			preparedStatement.setString(4, user.getEmail());
			preparedStatement.setInt(6, user.getId());
			preparedStatement.setString(5, user.getMobile());

			// 4.Execute the statement

			int noOfRecAffected = preparedStatement.executeUpdate();
			if (noOfRecAffected > 0) {
				Address address = user.getAddress();
				int addressId = address.getId();
				if (addressId == 0) {

					// insert address
					query = "INSERT INTO ADDRESS (LINE1,LINE2,CITY,STATE,PINCODE,COUNTRY,USERID) VALUES(?,?,?,?,?,?,?)";
					preparedStatement = connection.prepareStatement(query);

					preparedStatement.setString(1, address.getLine1());
					preparedStatement.setString(2, address.getLine2());
					preparedStatement.setString(3, address.getCity());
					preparedStatement.setString(4, address.getState());
					preparedStatement.setString(5, address.getPinCode());
					preparedStatement.setString(6, address.getCountry());
					preparedStatement.setInt(7, address.getId());

					noOfRecAffected = preparedStatement.executeUpdate();
				} else {
					// update address
					query = "UPDATE ADDRESS SET LINE1=?,LINE2=?,CITY=?,STATE=?,PINCODE=?,COUNTRY=? WHERE ID=? ";
					preparedStatement = connection.prepareStatement(query);

					preparedStatement.setString(1, address.getLine1());
					preparedStatement.setString(2, address.getLine2());
					preparedStatement.setString(3, address.getCity());
					preparedStatement.setString(4, address.getState());
					preparedStatement.setString(5, address.getPinCode());
					preparedStatement.setString(6, address.getCountry());
					preparedStatement.setInt(7, addressId);

					noOfRecAffected = preparedStatement.executeUpdate();
				}
				if (noOfRecAffected > 0) {
					isUpdateProfile = true;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5.Close the connection
			DBUtil.closeConnection(connection);
		}
		return isUpdateProfile;
	}
}
