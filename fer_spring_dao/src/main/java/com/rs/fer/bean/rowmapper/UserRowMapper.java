package com.rs.fer.bean.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.mysql.cj.jdbc.result.ResultSetMetaData;
import com.rs.fer.bean.Address;
import com.rs.fer.bean.User;

public class UserRowMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet resultSet, int rowNum) throws SQLException {
		User user = new User();

		// get the 'user' column data

		int id = resultSet.getInt(1);
		String firstName = resultSet.getString(2);
		String middleName = resultSet.getString(3);
		String lastName = resultSet.getString(4);
		String email = resultSet.getString(5);
		String username = resultSet.getString(6);
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
		ResultSetMetaData resultSetMetaData = (ResultSetMetaData) resultSet.getMetaData();
		int columnCount = resultSetMetaData.getColumnCount();

		if (columnCount == 8) {
			return user;
		}

		user.setId(id);
		user.setFirstName(firstName);
		user.setMiddleName(middleName);
		user.setLastName(lastName);
		user.setEmail(email);
		user.setUsername(username);
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
		address.setUserid(id);
		// load address object into the user object
		user.setAddress(address);

		return user;
	}

}
