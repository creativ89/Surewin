package model;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.Query;

/**
 * This class is responsible to interacts with the database
 * to perform the CRUD(Create,Read,Update & Delete) functions of Product
 */

public class testerQuantityDataManager {
	
	static {
		ObjectifyService.register(testerQuantity.class);
	}
		
	public testerQuantityDataManager(){
	}	
	
	/**
     * Retrieves all instances that are stored in the data store
     */
	public List<testerQuantity> retrieveAll() {
    	Objectify ofy = ObjectifyService.begin();

    	Query<testerQuantity> q = ofy.query(testerQuantity.class);

    	return q.list();    
    }
	

    public testerQuantity retrieveLayout(String layout) {
    	//Objectify ofy = ObjectifyService.begin();
    	List<testerQuantity> alltq = retrieveAll();
    	// no entry at all
    	if(alltq == null || alltq.size()==0){
    		testerQuantity tq = new testerQuantity("2",0);
    		add(tq);
    	}
    	
    	alltq = retrieveAll();
    	for(testerQuantity tq : alltq){
    		if(tq.getLayout().equals(layout)){
    			return tq;
    		}
    	}
    	return null;
    }
    
    public int getTotalTester() {
    	int total = 0;
    	List<testerQuantity> alltq = retrieveAll();
    	for(testerQuantity tq : alltq){
    		total=total+tq.getQuantity();
    	}
    	return total;
    }
    
    /**
     * Add an instance to data store
     */
    public void add(testerQuantity tq) {
    	Objectify ofy = ObjectifyService.begin();
    	ofy.put(tq);
    }
    
    /**
     * Remove an instance from data store
     */
    public void remove(Long id) {
    	Objectify ofy = ObjectifyService.begin();
    	ofy.delete(testerQuantity.class, id);    	
    }
    
    /**
     * Update an instance in data store
     */
    public void modify(testerQuantity tq) {
    	Objectify ofy = ObjectifyService.begin();
    	ofy.put(tq);
    }
    
    /**
	 * Remove all instances from data store
	 */
	public void removeAll() {
		Objectify ofy = ObjectifyService.begin();
		Query<testerQuantity> q = ofy.query(testerQuantity.class);
		ofy.delete(q.list());
	}
}
