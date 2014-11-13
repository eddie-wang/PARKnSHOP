package com.parknshop.model;

public class TopProduct {
    private String productname;
    private String shopname;
    private int state;
    public TopProduct(String productname, String shopname,int state)
    {
    	setProductname(productname);
    	setShopname(shopname);
    	setState(state);
    }
    public String getProductname()
    {
    	return productname;
    }
    public void setProductname(String name)
    {
    	productname=name;
    }
    public String getShopname()
    {
    	return shopname;
    }
    public void setShopname(String shopname)
    {
    	this.shopname=shopname;
    }
    public int getstate()
    {
    	return state;
    }
    public void setState(int state)
    {
    	this.state=state;
    }
    
}
