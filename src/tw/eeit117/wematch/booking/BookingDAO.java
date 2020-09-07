package tw.eeit117.wematch.booking;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

public  class BookingDAO {

	private Session session;
	
	public BookingDAO(Session session) {
		this.session = session;
	}
	
	public Session getSession() {
		return session;
		
	}

	public bookingBean insert(bookingBean bBean) {
		
		session.save(bBean);
		return null;
//		bookingBean bookingBean = session.get(bookingBean.class, bBean.getBookingId(),bBean.getBookingDate(),bBean.getBookingTime(),bBean.getEpt1(),bBean.getEpt2(),bBean.getEpt3(),bBean.getEpt4());
}
	
	
	public List<bookingBean> select(String date,String time) {
		
		 Query query = getSession().createQuery("from bookingBean where bookingDate=:date and bookingTime=:time",bookingBean.class);
		
		query.setParameter("date", date);
		query.setParameter("time", time);
		
		return (List <bookingBean>) query.list();
		
		
		
		
		
		
	}

}
