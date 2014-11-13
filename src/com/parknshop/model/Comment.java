package com.parknshop.model;

public class Comment {
    private String productname;
    private String shopname;
    private String comment;
    private int score;
    public Comment(String productname, String shopname, String comment, int score)
    {
    	   setProductname(productname);
    	   setShopname(shopname);
    	   setComment(comment);
    	   setScore(score);
    }
    public void setProductname(String productname)
    {
    	this.productname=productname;
    }
    public String getProductname()
    {
    	return productname;
    }
    public void setShopname(String shopname)
    {
    	this.shopname=shopname;
    }
    public String getShopname()
    {
    	return shopname;
    }
    public void setComment(String comment)
    {
    	this.comment=comment;
    }
    public String getComment()
    {
    	return comment;
    }    
    public void setScore(int score)
    {
    	this.score=score;
    }
    public int getScore()
    {
    	return score;
    }    
}
