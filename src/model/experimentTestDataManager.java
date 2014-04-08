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

public class experimentTestDataManager {
	
	static {
		ObjectifyService.register(experimentTest.class);
	}
	
	public experimentTestDataManager(){
	}	

	public List<experimentTest> retrieveAll() {
    	Objectify ofy = ObjectifyService.begin();
    	Query<experimentTest> q = ofy.query(experimentTest.class);
    	return q.list();    
    }
    
	//retrieve a experiment based on id
	public experimentTest retrieve(Long id) {
    	Objectify ofy = ObjectifyService.begin();

    	return ofy.get(experimentTest.class, id);
    }
	
    /**
     * Add an instance to data store
     */
    public void add(experimentTest tq) {
    	Objectify ofy = ObjectifyService.begin();
    	ofy.put(tq);
    }
    
    /**
     * Remove an instance from data store
     */
    public void remove(Long id) {
    	Objectify ofy = ObjectifyService.begin();
    	ofy.delete(experimentTest.class, id);    	
    }
    
    /**
     * Update an instance in data store
     */
    public void modify(experimentTest tq) {
    	Objectify ofy = ObjectifyService.begin();
    	ofy.put(tq);
    }
    
    /**
	 * Remove all instances from data store
	 */
	public void removeAll() {
		Objectify ofy = ObjectifyService.begin();
		Query<experimentTest> q = ofy.query(experimentTest.class);
		ofy.delete(q.list());
	}
}
