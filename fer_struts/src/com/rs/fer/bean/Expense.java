package com.rs.fer.bean;

public class Expense {

	private int id;
	private String type;
	private String date;
	private float price;
	private int numberofitems;
	private float total;
	private String bywhom;
	private int userid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getNumberofitems() {
		return numberofitems;
	}
	public void setNumberofitems(int numberofitems) {
		this.numberofitems = numberofitems;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public String getBywhom() {
		return bywhom;
	}
	public void setBywhom(String bywhom) {
		this.bywhom = bywhom;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	
}
