package com.parknshop.model;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class Fun {
	
	 public static double commission(Date date1,Date date2,List<Order> lorder)//要的方法;
	   	{           
	   		        double prices=0;
	                   Iterator<Order> Iorder=lorder.iterator( );
	   				while( Iorder.hasNext())
	   		{
	   				   Order order= Iorder.next( );
	   				
	                     if ( !order.getDate( ).before(date1)&& !order.getDate( ).after(date2) )
	                 {
	                         prices+=order.getPrice()*order.getCommnum();
	                        
	                }

	   		}
	   				return prices;
	   	}
}
