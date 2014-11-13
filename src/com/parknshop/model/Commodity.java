package com.parknshop.model;

public class Commodity {
  private String productname;
  private String shopname;
  private double price;
  private String type;
  private String details;
  private int salevolume;
  private int stock;
  private String path;
  public Commodity()
  {
  }
  public Commodity(String productname, String shopname,double price,String type,String details,int salevolume,int stock,String path)
  {
	  setProductname(productname);
	  setShopname(shopname);
	  setPrice(price);
	  setType(type);
	  setDetails(details);
	  setSalevolume(salevolume);
	  setStock(stock);
	  setPath(path);
  }
  public String getPath()
  {
	  return path;
  }
  public void setPath(String path)
  {
	  this.path=path;
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
  public void setShopname(String name)
  {
	  shopname=name;
  }
  public double getPrice()
  {
	  return price;
  }
  public void setPrice(double price)
  {
	  this.price=price;
  }
  public String getType()
  {
	  return type;
  }
  public void setType(String type)
  {
	  this.type=type;
  }  
  public String getDetails()
  {
	  return details;
  }
  public void setDetails(String details)
  {
	  this.details=details;
  }  
  public int getSalevolume()
  {
	  return salevolume;
  }
  public void setSalevolume(int salevolume)
  {
	  this.salevolume=salevolume;
  }  
  public int getStock()
  {
	  return stock;
  }
  public void setStock(int stock)
  {
	  this.stock=stock;
  }  
}
