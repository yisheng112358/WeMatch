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
		ArrayList<String> arrL5 = new ArrayList<String>(12);
		ArrayList<String> arrL6 = new ArrayList<String>(12);
		ArrayList<String> arrL7 = new ArrayList<String>(12);
		ArrayList<String> arrL8 = new ArrayList<String>(12);
		ArrayList<String> arrL9 = new ArrayList<String>(12);
		ArrayList<String> arrL10 = new ArrayList<String>(12);
		ArrayList<String> arrL11 = new ArrayList<String>(12);
		ArrayList<String> arrL12 = new ArrayList<String>(12);
		//讀取bookingBean陣列 需要的值 存到ArrayList
		
		for(bookingBean i:serch) {                  
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
		for(bookingBean i:serch) {
			arrL5.add(i.getEpt5());
		}
		for(bookingBean i:serch) {
			arrL6.add(i.getEpt6());
		}
		for(bookingBean i:serch) {
			arrL7.add(i.getEpt7());
		}
		for(bookingBean i:serch) {
			arrL8.add(i.getEpt8());
		}
		for(bookingBean i:serch) {
			arrL9.add(i.getEpt9());
		}
		for(bookingBean i:serch) {
			arrL10.add(i.getEpt10());
		}
		for(bookingBean i:serch) {
			arrL11.add(i.getEpt11());
		}
		for(bookingBean i:serch) {
			arrL12.add(i.getEpt12());
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
		request.setAttribute("D5", arrL5);
		request.setAttribute("D6", arrL6);
		request.setAttribute("D7", arrL7);
		request.setAttribute("D8", arrL8);
		request.setAttribute("D9", arrL9);
		request.setAttribute("D10", arrL10);
		request.setAttribute("D11", arrL11);
		request.setAttribute("D12", arrL12);
		
	


		RequestDispatcher rd = request.getRequestDispatcher("BookingBrowse2.jsp");
		rd.forward(request, response);

		session.getTransaction().commit();

	}

}
