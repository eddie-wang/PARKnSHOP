package com.parknshop.model;

public class Shopcart {
	 private String username;
	 private String productname;
	 private String storename;
	 private int commnum;
	 public Shopcart()
	 {}
	 public Shopcart(String username,String productname,String storename,int commnum)
	 {
		 setUsername(username);
		 setProductname(productname);
		 setStorename(storename);
		 setCommnum(commnum);
	 }
	    public void setUsername(String username)
	    {
	    	this.username=username;
	    }
	    public String getUsername()
	    {
	    	return username;
	    }
	    public void setProductname(String productname)
	    {
	    	this.productname=productname;
	    }
	    public String getProductname()
	    {
	    	return productname;
	    }
	    public void setStorename(String storename)
	    {
	    	this.storename=storename;
	    }
	    public String getStorename()
	    {
	    	return storename;
	    }
	    public void setCommnum(int commnum)
	    {
	    	this.commnum=commnum;
	    }
	    public int getCommnum()
	    {
	    	return commnum;
	    }	 
}
