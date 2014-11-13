package com.parknshop.model;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class Order {
    private int idorder=0;
    private String username;
    private String productname;
    private String storename;
    private int commnum;
    private double price;
    private Date date=new Date();
    private String state;
    public Order()
    {}
    public Order(int idorder,String username,String productname,String storename, int commnum,double price){
    	setIdorder(idorder);
    	setUsername(username);
    	setProductname(productname);
    	setStorename(storename);
    	setCommnum(commnum);
    	setPrice(price);
    	setState("undelivered");
    }
    public Order(int idorder,String username,String productname,String storename, int commnum,double price ,String state){
    	setIdorder(idorder);
    	setUsername(username);
    	setProductname(productname);
    	setStorename(storename);
    	setCommnum(commnum);
    	setPrice(price);
    	setState(state);
    }
    public Order(int idorder,String username,String productname,String storename, int commnum,double price ,String state,Date date){
    	setIdorder(idorder);
    	setUsername(username);
    	setProductname(productname);
    	setStorename(storename);
    	setCommnum(commnum);
    	setPrice(price);
    	setState(state);
    	setDate(date);
    }
    public void setState(String state)
    {
    	this.state=state;
    }
    public String getState()
    {
    	return state;
    }
    public void setDate(Date date)
    {
    	this.date=date;
    }
    public Date getDate()
    {
    	return date;
    }
    public void setIdorder(int order)
    {
    	idorder=order;
    }
    public int getIdorder()
    {
    	return idorder;
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
    public void setPrice(double price)
    {
    	this.price=price;
    }
    public double getPrice()
    {
    	return price;
    }
    
   

}
