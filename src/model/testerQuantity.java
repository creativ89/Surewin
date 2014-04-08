package model;

import java.io.Serializable;

import javax.persistence.Id;

import com.googlecode.objectify.annotation.Cached;
@Cached

@SuppressWarnings("serial")

public class testerQuantity implements Serializable{
    @Id private Long id;
    private String layout;
    private int quantity;


    public testerQuantity() {}
    
    public testerQuantity(String layout,int quantity) {
    	this.layout=layout;
    	this.quantity = quantity;
    	
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLayout() {
		return layout;
	}

	public void setLayout(String layout) {
		this.layout = layout;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
    
    
   
}
