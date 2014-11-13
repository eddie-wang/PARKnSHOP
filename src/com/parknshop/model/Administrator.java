package com.parknshop.model;

public class Administrator {
     private String userNameA;
     private String password;
     public Administrator(){};
     public Administrator(String username,String password)
     { this.setPassword(password);
        this.setUserNameA(username);
      }
     public void setUserNameA(String username)
     {
    	 userNameA=username;
     }
     public String getUserNameA()
     {
    	 return userNameA;
     }
     public void setPassword(String password)
     {
    	 this.password=password;
     }
     public String getPassword()
     {
    	 return password;
     }
}
