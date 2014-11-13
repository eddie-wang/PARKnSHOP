package com.parknshop.model;

public class TopStore {
	 private String shopowner;
	    private String shopname;
	    private int state;
	    public TopStore(String shopname, String shopowner,int state)
	    {
	    	setShopowner(shopowner);
	    	setShopname(shopname);
	    	setState(state);
	    }
	    public String getShopowner()
	    {
	    	return shopowner;
	    }
	    public void setShopowner(String shopowner)
	    {
	    	this.shopowner=shopowner;
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
