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
			String A = request.getParameter("1");
			String B = request.getParameter("2");
			String C = request.getParameter("3");
			String D = request.getParameter("4");
			String E = request.getParameter("0");
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");

			System.out.println(A);
			System.out.println(B);
			System.out.println(C);
			System.out.println(D);
			System.out.println(E);
		

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}




	

}
