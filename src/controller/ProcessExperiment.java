package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

@SuppressWarnings("serial")
public class ProcessExperiment extends HttpServlet {
	public void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, IllegalStateException {
	
		//check if the user did properly follow the flow
		String validate = request.getParameter("validate");		
		if(validate == null || !validate.equals("true")){
			response.sendRedirect("experiment/introductionPage.jsp");
			return;
		}

		
		String layout = "";
		testerQuantity tq = new testerQuantity();
		
		//random between layout 1 and 2
		int number = new Random().nextInt(100);
		testerQuantityDataManager tqdm = new testerQuantityDataManager();
		if(number < 50){
			layout ="1";
		}else{
			layout ="2";
		}
		
		tq = tqdm.retrieveLayout(layout);
		Long uniqueId = Long.valueOf(tqdm.getTotalTester()+1);
		String timeStamp = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(Calendar.getInstance().getTime());
		
		//assign the user id and set the start date/time
		experimentTest et = new experimentTest(uniqueId,layout,timeStamp,"","");
		experimentTestDataManager etdm = new experimentTestDataManager();
		etdm.add(et);
		
		//change the quantity of the number of tester
		tq.setQuantity(tq.getQuantity()+1);
		tqdm.modify(tq);
		
		HttpSession session = request.getSession();
		session.setAttribute("layout", layout);
		session.setAttribute("testerId", uniqueId);
		response.sendRedirect("experiment/experiment.jsp");
		return;
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
}
