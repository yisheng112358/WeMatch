package tw.eeit117.wematch.order;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Receiver")
@Component("Receiver")
public class Receiver {
	@Id
	@Column(name = "receiverId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int receiverId;
	@Column(name = "receiverName")
	private String receiverName;
	@Column(name = "receiverPhone")
	private String receiverPhone;
	@Column(name = "receiverAddress")
	private String receiverAddress;
	@Column(name = "receiverEmail")
	private String receiverEmail;
	@Column(name = "receiverNote")
	private String receiverNote;

	public Receiver() {

	}

	public Receiver(String receiverName, String receiverPhone, String receiverAddress, String receiverEmail,
			String receiverNote) {
		this.receiverName = receiverName;
		this.receiverPhone = receiverPhone;
		this.receiverAddress = receiverAddress;
		this.receiverEmail = receiverEmail;
		this.receiverNote = receiverNote;

	}

	public int getReceiverId() {
		return receiverId;
	}

	@Transient
	public void setReceiverId(int receiverId) {
		this.receiverId = receiverId;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getReceiverPhone() {
		return receiverPhone;
	}

	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}

	public String getReceiverAddress() {
		return receiverAddress;
	}

	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}

	public String getReceiverEmail() {
		return receiverEmail;
	}

	public void setReceiverEmail(String receiverEmail) {
		this.receiverEmail = receiverEmail;
	}

	public String getReceiverNote() {
		return receiverNote;
	}

	public void setReceiverNote(String receiverNote) {
		this.receiverNote = receiverNote;
	}

}
