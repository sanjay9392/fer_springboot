package com.rs.fer.service.impl;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import com.rs.fer.bean.Address;
import com.rs.fer.bean.Expense;
import com.rs.fer.bean.User;
import com.rs.fer.bean.rowmapper.ExpenseRowMapper;
import com.rs.fer.bean.rowmapper.UserRowMapper;
import com.rs.fer.service.FERService;

public class FERServiceImpl implements FERService {
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public boolean registration(User user) {

		String query = "INSERT INTO USER (FIRSTNAME,MIDDLENAME,LASTNAME,EMAIL,USERNAME,PASSWORD,MOBILE) VALUES(?,?,?,?,?,?,?)";
		Object[] objectArray = new Object[] { user.getFirstName(), user.getMiddleName(), user.getLastName(),
				user.getEmail(), user.getUsername(), user.getPassword(), user.getMobile() };
		return jdbcTemplate.update(query, objectArray) > 0;
	}

	@Override
	public boolean login(String username, String password) {

		String query = "SELECT * FROM USER WHERE USERNAME=? AND PASSWORD=? ";
		Object[] objectArray = new Object[] { username, password };
		try {
			User user = (User) jdbcTemplate.queryForObject(query, objectArray, new UserRowMapper());
			return user != null;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean addExpense(Expense expense) {

		String query = "INSERT INTO EXPENSE (TYPE,DATE,PRICE,NUMBEROFITEMS,TOTAL,BYWHOM,USERID) VALUES(?,?,?,?,?,?,?)";
		Object[] objectArray = new Object[] { expense.getType(), expense.getDate(), expense.getPrice(),
				expense.getNumberofitems(), expense.getTotal(), expense.getBywhom(), expense.getUserid() };

		return jdbcTemplate.update(query, objectArray) > 0;
	}

	@Override
	public boolean editExpense(Expense expense) {

		String query = "UPDATE EXPENSE SET TYPE=?,DATE=?,PRICE=?,NUMBEROFITEMS=?,TOTAL=?,BYWHOM =? WHERE ID=?";
		Object[] objectArray = new Object[] { expense.getType(), expense.getDate(), expense.getPrice(),
				expense.getNumberofitems(), expense.getTotal(), expense.getBywhom(), expense.getId() };

		return jdbcTemplate.update(query, objectArray) > 0;
	}

	@Override
	public boolean deleteExpense(int expenseId) {

		String query = "DELETE FROM EXPENSE WHERE ID=?";
		Object[] objectArray = new Object[] { expenseId };

		return jdbcTemplate.update(query, objectArray) > 0;
	}

	@Override
	public boolean resetPassword(String newPassword, int id, String currentPassword) {

		String query = "UPDATE USER SET PASSWORD=? WHERE ID=? AND PASSWORD=?";
		Object[] objectArray = new Object[] { newPassword, id, currentPassword };
		return jdbcTemplate.update(query, objectArray) > 0;
	}

	@Override
	public List<Expense> getExpenseOptions(int userId) {

		String query = "SELECT * FROM EXPENSE WHERE USERID=?";
		Object[] objectArray = new Object[] { userId };

		return jdbcTemplate.query(query, objectArray, new ExpenseRowMapper());
	}

	@Override
	public Expense getExpense(int expenseId) {

		String query = "SELECT * FROM EXPENSE WHERE ID=?";
		Object[] objectArray = new Object[] { expenseId };

		return (Expense) jdbcTemplate.queryForObject(query, objectArray, new ExpenseRowMapper());
	}

	@Override
	public List<Expense> getExpenseReport(int userId, String expenseType, String fromDate, String toDate) {

		String query = "SELECT * FROM EXPENSE WHERE USERID=? AND TYPE=? AND DATE BETWEEN ? AND ?";
		Object[] objectArray = new Object[] { userId, expenseType, fromDate, toDate };

		return jdbcTemplate.query(query, objectArray, new ExpenseRowMapper());

	}

	@Override
	public User getUser(int userId) {

		String query = "SELECT U.*,A.* FROM USER U LEFT JOIN ADDRESS A ON U.ID = A.USERID WHERE U.ID=? ";

		Object[] objectArray = new Object[] { userId };

		return (User) jdbcTemplate.queryForObject(query, objectArray, new UserRowMapper());
	}

	@Override
	public boolean updateUser(User user) {
		boolean isUpdateUser = false;
		int numberOfRec = 0;
		String query = "UPDATE USER SET FIRSTNAME=?,MIDDLENAME=?,LASTNAME=?,EMAIL=?,MOBILE=? WHERE ID=? ";
		Object[] objectArray = new Object[] { user.getFirstName(), user.getMiddleName(), user.getLastName(),
				user.getEmail(), user.getMobile(), user.getId() };
		numberOfRec = jdbcTemplate.update(query, objectArray);

		if (numberOfRec > 0) {
			Address address = user.getAddress();
			int addressId = address.getId();

			if (addressId == 0) {
				String insertQuery = "INSERT INTO ADDRESS (LINE1,LINE2,CITY,STATE,PINCODE,COUNTRY,USERID) VALUES(?,?,?,?,?,?,?)";
				Object[] objectArray1 = new Object[] { address.getLine1(), address.getLine2(), address.getCity(),
						address.getState(), address.getPinCode(), address.getCountry(), address.getUserid() };
				numberOfRec = jdbcTemplate.update(insertQuery, objectArray1);

			} else {
				String updateQuery = "UPDATE ADDRESS SET LINE1=?,LINE2=?,CITY=?,STATE=?,PINCODE=?,COUNTRY=? WHERE ID=? ";
				Object[] objectArray2 = new Object[] { address.getLine1(), address.getLine2(), address.getCity(),
						address.getState(), address.getPinCode(), address.getCountry(), address.getId() };
				numberOfRec = jdbcTemplate.update(updateQuery, objectArray2);
			}
			if (numberOfRec > 0) {
				isUpdateUser = true;
			}
		}
		return isUpdateUser;

	}

}
