package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

@SuppressWarnings("serial")
public class ProcessLogin extends HttpServlet {
	public void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, IllegalStateException {

		//get values from parameters
		String username = ((String)request.getParameter("username")).trim();
		String password = ((String)request.getParameter("password")).trim();
		
		/*
		PrintWriter pw = response.getWriter();
		  pw.println("<html>");
		  pw.println("<head><title>Hello World</title></title>");
		  pw.println("<body>");
		  pw.println("<h1>Hello World</h1>");
		  pw.println(loginUser.getUsername() + loginUser.getPassword());
		  pw.println("</body></html>");
		  */
		
		//retrieve list of users from datastore Manager
		notificationDataManager ndm = new notificationDataManager();
		userDataManager udm = new userDataManager();
		
		
		//validate if there is any admin account
		user admin = udm.retrieve("rosanne");
		notification note = ndm.retrieve("rosanne");
		
		if(admin==null){
			udm.add(new user("rosanne","123","90050043","creativ89@outlook.com","sweet cin","03/12/1990",500));
		}
		if(note==null){
			ndm.removeAll();		
			ndm.add(new notification((long)1,"rosanne","2014-02-23","Won $166 on 01/02/2014!"));
			ndm.add(new notification((long)2,"rosanne","2014-02-23","You have purchased a 4D ticket!"));
			ndm.add(new notification((long)3,"rosanne","2014-02-23","You have reached your limit!"));		
		}
		try{
			user loginUser = udm.retrieve(username);
			//no such user
			if(loginUser == null){
				response.sendRedirect("User-Signin.jsp?errMsg=Incorrect username or password entered. Please try again.");
				return;	
			}
			//user with wrong password
			if(!loginUser.getPassword().equals(password)){
				response.sendRedirect("User-Signin.jsp?errMsg=Invalid password");
				return;	
			//success login user	
			}else{
				HttpSession session = request.getSession();
				session.setAttribute("authenticated", loginUser);
				
				//set unique tester id
				testerQuantityDataManager tqdm = new testerQuantityDataManager();
				testerQuantity tq = tqdm.retrieveLayout("2");
				Long uniqueId = Long.valueOf(tqdm.getTotalTester()+1);
				String timeStamp = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(Calendar.getInstance().getTime());
				
				//assign the user id and set the start date/time
				experimentTest et = new experimentTest(uniqueId,"2",timeStamp,"","");
				experimentTestDataManager etdm = new experimentTestDataManager();
				etdm.add(et);
				
				//change the quantity of the number of tester
				tq.setQuantity(tq.getQuantity()+1);
				tqdm.modify(tq);				
				session.setAttribute("testerId", uniqueId);
				
				response.sendRedirect("User-MainPage.jsp");
				return;
			}
		}catch(NullPointerException e){
			response.sendRedirect("User-Signin.jsp?errMsg=Incorrect username or password entered. Please try again.");	
			return;	
		}
		
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
