package com.ty.fashiCartDto;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.GeneratorType;

@Entity
public class CartProduct implements Serializable
{
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private int prono;
	@Id
	private String proId;
//	private String ProType;
	
//	public int getProno() {
//		return prono;
//	}
//	public void setProno(int prono) {
//		this.prono = prono;
//	}
	public String getProId() {
		return proId;
	}
	public void setProId(String proId) {
		this.proId = proId;
	}
	
	
	
}
