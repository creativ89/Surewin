package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

@SuppressWarnings("serial")
public class ProcessCompleteExperiment extends HttpServlet {
	public void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, IllegalStateException {
		
		HttpSession session = request.getSession();
		Long currentTesterId = (Long)session.getAttribute("testerId");
		if(currentTesterId == null){
			response.sendRedirect("experiment/introductionPage.jsp");
			return;
		}
		experimentTestDataManager etdm = new experimentTestDataManager();
		experimentTest currentTester = etdm.retrieve(currentTesterId);
				

		String timeStamp = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(Calendar.getInstance().getTime());		
		currentTester.setEndDateTime(timeStamp);
		
		try {
			Date date1 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(currentTester.getStartDateTime());
			Date date2 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(currentTester.getEndDateTime());
			long timeDiff = getDateDiff(date1,date2,TimeUnit.SECONDS);
			String timeDifferent = String.valueOf(timeDiff);
			currentTester.setDuration(timeDifferent);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		etdm.modify(currentTester);
		
		response.sendRedirect("experiment/introductionPage.jsp");
		//response the user to the experiment page
		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException{
		try{
		processRequest(request, response);
		}catch(IllegalStateException e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException{
		try{
		processRequest(request, response);
		}catch(IllegalStateException e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public long getDateDiff(Date date1, Date date2, TimeUnit timeUnit) {
	    long diffInMillies = date2.getTime() - date1.getTime();
	    return timeUnit.convert(diffInMillies,TimeUnit.MILLISECONDS);
	}
	
}
