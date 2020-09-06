package tw.eeit117.wematch.booking;

import java.util.Arrays;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Booking")
@Component
public class bookingBean {
	private Integer bookingId;
	private String bookingDate;
	private String bookingTime;
	private String ept1;
	private String ept2;
	private String ept3;
	private String ept4;

	public bookingBean() {
	}

	public bookingBean(String bookingDate, String bookingTime, String ept1, String ept2, String ept3, String ept4) {
		this.bookingDate = bookingDate;
		this.bookingTime = bookingTime;
		this.ept1 = ept1;
		this.ept2 = ept2;
		this.ept3 = ept3;
		this.ept4 = ept4;

	}

	@Id
	@Column(name = "bookingId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getBookingId() {
		return bookingId;
	}

	public void setBookingId(Integer bookingId) {
		this.bookingId = bookingId;
	}

	@Column(name = "bookingDate")
	public String getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}

	@Column(name = "bookingTime")
	public String getBookingTime() {
		return bookingTime;
	}

	public void setBookingTime(String bookingTime) {
		this.bookingTime = bookingTime;
	}

	@Column(name = "ept1")
	public String getEpt1() {
		return ept1;
	}

	public void setEpt1(String ept1) {
		this.ept1 = ept1;
	}

	@Column(name = "ept2")
	public String getEpt2() {
		return ept2;
	}

	public void setEpt2(String ept2) {
		this.ept2 = ept2;
	}

	@Column(name = "ept3")
	public String getEpt3() {
		return ept3;
	}

	public void setEpt3(String ept3) {
		this.ept3 = ept3;
	}

	@Column(name = "ept4")
	public String getEpt4() {
		return ept4;
	}

	public void setEpt4(String ept4) {
		this.ept4 = ept4;
	}

	@Override
	public String toString() {
		return "bookingBean [bookingId=" + bookingId + ", bookingDate=" + bookingDate + ", bookingTime=" + bookingTime
				+ ", ept1=" + ept1 + ", ept2=" + ept2 + ", ept3=" + ept3 + ", ept4=" + ept4 + " ]";
	}

}
