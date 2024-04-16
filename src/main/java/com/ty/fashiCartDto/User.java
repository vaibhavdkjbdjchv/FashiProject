package com.ty.fashiCartDto;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class User 
{
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private int id;
	@Id
	private String userid;
	
	@ManyToMany(cascade = CascadeType.ALL)
	private List<CartProduct> products;

//	public int getId() {
//		return id;
//	}

//	public void setId(int id) {
//		this.id = id;
//	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public List<CartProduct> getProducts() {
		return products;
	}

	public void setProducts(List<CartProduct> products) {
		this.products = products;
	} 
	
	
}
