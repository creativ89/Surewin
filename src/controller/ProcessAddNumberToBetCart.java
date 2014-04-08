package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONValue;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.appengine.labs.repackaged.org.json.JSONException;

import model.result;
import model.resultDataManager;

@SuppressWarnings("serial")
public class ProcessAddNumberToBetCart extends HttpServlet {
	public void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, IllegalStateException {

		//get the bet type
		String type = ((String)request.getParameter("betType")).trim();		
		
		//get the draw date
		String drawDate = (String)request.getParameter("drawDate");
		if(drawDate == null || drawDate.equals("")){
			response.sendRedirect("Bet-enter4DDetails.jsp?errMsg=<b>Error!</b> Please enter a date.&betType="+type);
			return;
		}
		
		//get the bet amount
		String betBig= "";
		String betSmall = "";
		
		betBig= ((String)request.getParameter("betBig")).trim();
		betSmall= ((String)request.getParameter("betSmall")).trim();
		//both are zero
		if(betBig.equals("0")&&betSmall.equals("0")){
			response.sendRedirect("Bet-enter4DDetails.jsp?errMsg=<b>Error!</b> Please bet more than $1.&betType="+type+"&drawDate="+drawDate);
			return;
		}
		
		String betNumber = ((String)request.getParameter("betNumber")).trim();
		if(betNumber==null||betNumber.length()!=4){
			response.sendRedirect("Bet-enter4DDetails.jsp?errMsg=<b>Error!</b> "
					+ "You must enter 4 number to bet!&betType="+type+"&drawDate="+drawDate+
					"&betBig="+betBig+"&betSmall="+betSmall);
			return;
		}
		if(betNumber.equals("4459")){
			response.sendRedirect("Bet-enter4DDetails.jsp?errMsg=Number Sold out!&betType="+type+"&drawDate="+drawDate+
					"&betBig="+betBig+"&betSmall="+betSmall);
			return;			
		}
		/*
		String betBig= "";
		String betSmall = "";
		try{
			betBig= ((String)request.getParameter("betBig")).trim();
			betSmall= ((String)request.getParameter("betSmall")).trim();
		}catch(NullPointerException e){
			response.sendRedirect("Bet-enter4DDetails.jsp?errMsg=<b>Error!</b> Please bet more than $1.&drawDate="+drawDate);
			return;
		}
		if(betBig.equals("0") && betSmall.equals("0")){
			response.sendRedirect("Bet-enter4DDetails.jsp?errMsg=<b>Error!</b> Please bet more than $1.&drawDate="+drawDate);
			return;
		}
		
		String betNumber="0000";
		try{
			
			betNumber = ((String)request.getParameter("betNumber")).trim();
		}catch(NullPointerException e){
			response.sendRedirect("Bet-enter4DDetails.jsp?errMsg=<b>Error!</b> Invalid input. Please check again!");
			return;
		}
			
		if(betNumber.equals("4459")){
			response.sendRedirect("Bet-enter4DDetails.jsp?errMsg=The number is sold out. Please select another number!");
			return;			
		}
		*/
		//check if there is any saved match cart
		HttpSession session = request.getSession();
		String betCart = (String)session.getAttribute("betCart");
		
		int id;
		//nothing inside the saved match cart yet
		if(betCart == null){
			id = 1;	
			Map JsonItem = new LinkedHashMap();
			JSONArray itemArray = new JSONArray();
			Map individualNumber = new LinkedHashMap();	
			individualNumber.put("id", Integer.toString(id));
			individualNumber.put("drawDate", drawDate);
			individualNumber.put("betBig", betBig);
			individualNumber.put("betSmall",betSmall);
			individualNumber.put("type",type);
			individualNumber.put("betNumber", betNumber);			
			itemArray.add(individualNumber);				
			JsonItem.put("item", itemArray);
			String ItemValue = JSONValue.toJSONString(JsonItem);
			session.setAttribute("betCart",ItemValue);		
			response.sendRedirect("Bet-enter4DDetails.jsp?betType="+type+"&drawDate="+drawDate+"&betBig="+betBig+"&betSmall="+betSmall);
			return;
		
		}else{
			id = nextId(betCart);
			Object obj = JSONValue.parse(betCart);
			JSONObject reqObj = (JSONObject) obj;		
			JSONArray allItem = (JSONArray) reqObj.get("item");
			
			Map individualNumber = new LinkedHashMap();	
			individualNumber.put("id", Integer.toString(id));
			individualNumber.put("drawDate", drawDate);
			individualNumber.put("betBig", betBig);
			individualNumber.put("betSmall",betSmall);
			individualNumber.put("type",type);
			individualNumber.put("betNumber", betNumber);	
			allItem.add(individualNumber);
			reqObj.put("item", allItem);
			
			String ItemValue = JSONValue.toJSONString(reqObj);			
			session.setAttribute("betCart",ItemValue);			
			response.sendRedirect("Bet-enter4DDetails.jsp?betType="+type+"&drawDate="+drawDate+"&betBig="+betBig+"&betSmall="+betSmall);
			return;			
			
		}
		
		
		/*
		PrintWriter pw = response.getWriter();
		  pw.println("<html>");
		  pw.println("<head><title>Hello World</title></title>");
		  pw.println("<body>");
		  pw.println("<h1>Hello World</h1>");
		  pw.println(drawDate+betNumber1);
		  pw.println("</body></html>");*/
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
	
	//this method returns the next id for the items
	public int nextId(String cart){
			Object obj = JSONValue.parse(cart);
			JSONObject reqObj = (JSONObject) obj;		
			JSONArray allItem = (JSONArray) reqObj.get("item");
			int id = 1;
			
			int numberOfLoop = allItem.size();
			for(int i=0;i<numberOfLoop;i++){ 
				JSONObject test = (JSONObject)allItem.get(i);
				String stringId = (String)test.get("id");
				int nextId = Integer.parseInt(stringId);
				if(nextId >= id){
					id = nextId;
				}
			} 				 
			return id+1;
		}
		
}
