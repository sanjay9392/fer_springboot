package com.mkyong.user;

public class DBProduct {
	private int productId;
	private String proName;
	private double price;
	
	 private int version;
	 
	 public void setVersion(int version) {
		this.version = version;
	}
	 public int getVersion() {
		return version;
	}

	public void setProductId(int productId)
	{
	    this.productId = productId;
	}
	public int getProductId()
	{
	    return productId;
	}

	public void setProName(String proName)
	{
	    this.proName = proName;
	}
	public String getProName()
	{
	    return proName;
	}

	public void setPrice(double price)
	{
	    this.price = price;
	}
	public double getPrice()
	{
	    return price;
	}

}
