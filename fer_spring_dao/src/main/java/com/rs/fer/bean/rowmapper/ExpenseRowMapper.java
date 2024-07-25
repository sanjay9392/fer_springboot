package com.rs.fer.bean.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.rs.fer.bean.Expense;

public class ExpenseRowMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet resultSet, int rowNum) throws SQLException {

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
		Expense expense = new Expense();
		expense.setId(id);
		expense.setType(type);
		expense.setDate(date);
		expense.setPrice(price);
		expense.setNumberofitems(numberofitems);
		expense.setTotal(total);
		expense.setBywhom(bywhom);
		expense.setUserid(uId);

		return expense;
	}

}
