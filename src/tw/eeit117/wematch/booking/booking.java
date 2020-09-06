package tw.eeit117.wematch.booking;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/booking")
public class booking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	processAction(request,response);
	}




	private void processAction(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("image/jpg");
			String Dumbbells1 = request.getParameter("Dumbbells1");
			String Dumbbells2 = request.getParameter("Dumbbells2");
			String Dumbbells3 = request.getParameter("Dumbbells3");
			String Dumbbells4 = request.getParameter("Dumbbells4");
			String date = request.getParameter("date");
			String time = request.getParameter("time");

			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");


			System.out.println(date);
			System.out.println(time);

			System.out.println(Dumbbells1);
			System.out.println(Dumbbells2);
			System.out.println(Dumbbells3);
			System.out.println(Dumbbells4);
		

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}




	

}
