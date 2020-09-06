package tw.eeit117.wematch.booking;

import java.io.Serializable;

import org.hibernate.Session;

public  class BookingDAO {

	private Session session;
	
	public BookingDAO(Session session) {
		this.session = session;
	}
	
	

	public bookingBean insert(bookingBean bBean) {
		
		session.save(bBean);
		
		
		return null;
		
	
	
	
//		bookingBean bookingBean = session.get(bookingBean.class, bBean.getBookingId(),bBean.getBookingDate(),bBean.getBookingTime(),bBean.getEpt1(),bBean.getEpt2(),bBean.getEpt3(),bBean.getEpt4());


	
	}

}
