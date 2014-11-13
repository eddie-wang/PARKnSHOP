package com.parknshop.model;

public class Seller extends Customer {

 private String realName;
 private String realId;
 private String email;
 private String telephone;
 private Store  store=null;
 public Seller(){}
 public Seller(Customer customer,String realName,String realId,String email,String telephone ){
	   super(customer);
	   this.setRealName(realName);
	   this.setRealId(realId);
	   this.setEmail(email);
	   this.setTelephone(telephone);
 }
   public void setRealName(String n){
		realName = n ;
	}
	public void setRealId(String a){
		 realId = a ;
		}
	
	public String getRealName(){
		return realName ;
	}
	public String getRealId(){
		return realId;
	}
	public Store getStore()
	{
		return store;
	}
	public void setStore(Store store)
	{
		this.store=store;
	}
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
}
