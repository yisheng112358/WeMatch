package tw.eeit117.wematch.booking;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

@WebServlet("/CheckBooking")
public class CheckBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processAction(request, response);
	}

	private void processAction(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		response.setContentType("image/jpg");
		
		
		PrintWriter out = response.getWriter();
		StandardServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().configure().build();
		SessionFactory factory = new MetadataSources(serviceRegistry).buildMetadata().buildSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();

		BookingDAO bDAO = new BookingDAO(session);

		String date = request.getParameter("date");
		String time = request.getParameter("time");

		List<bookingBean> serch = bDAO.select(date, time);
		
		ArrayList<String> arrL1 = new ArrayList<String>(12);
		ArrayList<String> arrL2 = new ArrayList<String>(12);
		ArrayList<String> arrL3 = new ArrayList<String>(12);
		ArrayList<String> arrL4 = new ArrayList<String>(12);

		    
		for(bookingBean i:serch) {                  //讀取bookingBean陣列 需要的值 存到ArrayList
//			System.out.println("1"+location);
			
			arrL1.add(i.getEpt1());
		}
		
		
		
		for(bookingBean i:serch) {
			arrL2.add(i.getEpt2());
		}
		for(bookingBean i:serch) {
			arrL3.add(i.getEpt3());
		}
		for(bookingBean i:serch) {
			arrL4.add(i.getEpt4());
		}
		
		
//		for(int x=0;x<serch.size();x++) {
//			arrL.add(serch.get(x).getEpt1());
//		}
		request.setAttribute("date", date);
		request.setAttribute("time", time);
		
		request.setAttribute("D1", arrL1);
		request.setAttribute("D2", arrL2);
		request.setAttribute("D3", arrL3);
		request.setAttribute("D4", arrL4);
		
	


		RequestDispatcher rd = request.getRequestDispatcher("BookingBrowse2.jsp");
		rd.forward(request, response);

		session.getTransaction().commit();

	}

}
