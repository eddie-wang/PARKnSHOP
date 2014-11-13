package com.parknshop.model;

import java.util.ArrayList;
import java.util.List;

public class Store {
  private String shopname;
  private String username;
  private String type;
  private boolean isBlacklist; 
  private List<Commodity> clist=new ArrayList<Commodity>();
  private String path=" ";
  public Store()
  {}
  public Store(String shopname,String username,String type)
  {
	  setShopname(shopname);
	  setUsername(username);
	  setType(type);
	  setIsBlacklist(false);
	  
  }
  public void setIsBlacklist(boolean isBlacklist)
  {
	  this.isBlacklist=isBlacklist;
  }
  public boolean getIsBlacklist()
  {
	   return isBlacklist;
  }
  public void setShopname(String shopname)
  {
	  this.shopname=shopname;
  }
  public void setUsername(String username)
  {
	  this.username=username;
  }
  public void setType(String type)
  {
	  this.type=type;
  }
  public String getShopname()
  {
	  return shopname;
  }
  public String getUsername()
  {
	  return username;
  }
  public String getType()
  {
	  return type;
  }
  public  void setClist(List<Commodity> clist)
  {
	  this.clist=clist;
  }
  public List<Commodity> getClist()
  {
	  return clist;
  }
  public void addCommodity(Commodity c)
  {
	  clist.add(c);
  }
  public String getPath()
  {
	  return path;
  }
  public  void setPath(String path)
  {
	  this.path=path;
  }
}
