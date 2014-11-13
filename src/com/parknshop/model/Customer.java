package com.parknshop.model;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
public class Customer {

	String userNameC;
	String password;
	String phoneNumber;
	String email;
	String sex;
	Date birthday;
	String address;
	Boolean isBlacklist;
	List<Commodity> favoritelist=new ArrayList<Commodity>();
	public Customer()
	{};
	public Customer(String userNameC,String password,String PhoneNumber,String email,String sex,Date birthday,int isBlacklist,String address)
	{
		setUserNameC(userNameC);
		setPassword(password);
		setPhoneNumber(PhoneNumber);
		setEmail( email);
		setSex(sex);
		setBirthday(birthday);
		if(isBlacklist==1)
			setIsBlacklist(true);
		else
			setIsBlacklist(false);
		setAddress(address);
		
	}
	public Customer(Customer customer)
	{
		setUserNameC(customer.getUserNameC());
		setPassword(customer.getPassword());
		setPhoneNumber(customer.getPhoneNumber());
		setEmail(customer.getEmail());
		setSex(customer.getSex());
		setBirthday(customer.getBirthday());
		setIsBlacklist(false);
	};
	public void setIsBlacklist(Boolean isSeller)
	{
		this.isBlacklist=isSeller;
	}
	public Boolean getIsBlacklist()
	{
		return isBlacklist;
	}
	public void setUserNameC(String name)
	{
		userNameC=name;
	}
	public String getUserNameC()
	{
		return userNameC;
	}
	public void setPassword(String password)
	{
		this.password=password;
	}
	public String getPassword()
	{
		return password ;
	}
	public void setPhoneNumber(String phoneNumber)
	{
		this.phoneNumber=phoneNumber;
	}
	public String getPhoneNumber()
	{
		return phoneNumber;
	}
	public void setEmail(String email)
	{
		this.email=email;
	}
	public String getEmail()
	{
		return email;
	}
	public void setSex(String sex)
	{
		this.sex=sex;
	}
	public String getSex()
	{
		return sex;
	}
	public void setBirthday(Date birthday)
	{
		this.birthday= birthday;
	}
	public Date getBirthday()
	{
		return birthday;
	}
	public void setAddress(String address)
	{
		this.address=address;
	}
	public String getAddress()
	{
		return address;
	}
	public List<Commodity> getFavoritelist()
	{
		return favoritelist;
	}
	public void  setFavoritelist( List<Commodity> favoritelist)
	{
		 this.favoritelist= favoritelist;
	}
	
//-----------------customer的其他方法待补充--------
}
