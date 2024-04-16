package com.ty.fashiCart.Dao;

import java.util.ArrayList;
import java.util.List;

import javax.lang.model.element.NestingKind;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import com.ty.fashiCartDto.CartProduct;
import com.ty.fashiCartDto.User;

public class User_Cart_Dao 
{
	private EntityManagerFactory factory = Persistence.createEntityManagerFactory("fashi_Project");
	private EntityManager manager = factory.createEntityManager();
	private EntityTransaction transaction = manager.getTransaction();
	
	public void saveUser(String userid) 
	{
		User user = new User();
		user.setUserid(userid);
		
		List<CartProduct> products = new ArrayList<CartProduct>();
		CartProduct product = new CartProduct();
		
		user.setProducts(products);
		
		transaction.begin();
		manager.merge(user);
		transaction.commit();
	}
	
	public void modifyProList(String userid ,String productid) 
	{
		User user = manager.find(User.class, userid);
		
		CartProduct product = new CartProduct();
		product.setProId(productid);
		
		if (!user.getProducts().contains(product)) 
		{
			user.getProducts().add(product);
		}
		
		try {
			
			transaction.begin();
			manager.merge(user);
			transaction.commit();
		} catch (Exception e) {
			// TODO: handle exception
			if (transaction.isActive()) {
				transaction.rollback();
			}
		}
	}
	
	public List<CartProduct> giveListOfProduct(String userid) 
	{
		User user = manager.find(User.class, userid);
		
		
		return user.getProducts();
	}
}
// problem is occering 
//how to add user and cartproduct inside a cart database product
//solve it