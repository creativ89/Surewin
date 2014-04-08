package model;

import java.io.Serializable;

import javax.persistence.Id;

import com.googlecode.objectify.annotation.Cached;
@Cached

@SuppressWarnings("serial")

public class experimentTest implements Serializable{
    @Id private Long id;
    private String layout;
    private String startDateTime;
    private String endDateTime;
    private String duration;

    public experimentTest() {}
    
    public experimentTest(Long id, String layout,String startDateTime, String endDateTime, String duration) {
    	this.id = id;
    	this.layout=layout;
    	this.startDateTime = startDateTime;
    	this.endDateTime = endDateTime;
    	this.duration = duration;
    	
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

	public String getStartDateTime() {
		return startDateTime;
	}

	public void setStartDateTime(String startDateTime) {
		this.startDateTime = startDateTime;
	}

	public String getEndDateTime() {
		return endDateTime;
	}

	public void setEndDateTime(String endDateTime) {
		this.endDateTime = endDateTime;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	
}
