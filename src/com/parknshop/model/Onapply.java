package com.parknshop.model;

public class Onapply {
	private String userNameC;
	private String userNameS;
	private String realId;
	private String shopName;
	private String shopType;
	private String telephone;
	private String email;
	public Onapply()
	{}
	public Onapply(String usernameC ,String usernameS,String realid,String shopname,String shoptype,String email,String telephone)
	{   
		setUserNameC(usernameC);
		setUserNameS(usernameS);
		setRealId(realid);
		setShopName(shopname);
		setShopType(shoptype);
		setEmail(email);
		setTelephone(telephone);
	}
	public String getUserNameC()
	{
		return userNameC;
	}
	public void setUserNameC(String username)
	{
		this.userNameC=username;
	}
	public String getUserNameS()
	{
		return userNameS;
	}
	public void setUserNameS(String username)
	{
		this.userNameS=username;
	}
	public String getRealId()
	{
		return realId;
	}
	public void setRealId(String readId)
	{
		this.realId=readId;
	}
	public String getShopName()
	{
		return shopName;
	}
	public void setShopName(String shopName)
	{
		this.shopName=shopName;
	}
	public String getShopType()
	{
		return shopType;
	}
	public void setShopType(String shopType)
	{
		this.shopType=shopType;
	}
	//----------------------------
	
	public String getTelephone()
	{
		return telephone;
	}
	public void setTelephone(String telephone)
	{
		this.telephone=telephone;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email=email;
	}
	/*public boolean acceptapply()
	{
		
	}*/

}
