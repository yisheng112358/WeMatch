package tw.eeit117.wematch.member;

import java.io.FileInputStream;
import javax.persistence.Entity;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "members")
public class members {
	@Id
	@Column(name = "member_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int member_id;
	
	@Column(name = "member_account")
	private String member_account;
	
	@Column(name = "member_pwd")
	private String member_pwd;
	
	@Column(name = "member_name")
	private String member_name;
	
	@Column(name = "member_email")
	private String member_email;
	
	@Column(name = "nickname")
	private String nickname;
	
	@Column(name = "gender")
	private String gender;
	
	@Column(name = "city")
	private String city;
	
	@Column(name = "birthday")
	private String birthday;
	
	@Column(name = "star_sign")
	private String star_sign;
	
	@Column(name = "blood_type")
	private String blood_type;
	
	@Column(name = "hobbies")
	private String hobbies;
	
	@Column(name = "picture_1")
	private byte[] picture_1;
	
	@Column(name = "picture_2")
	private byte[] picture_2;
	
	@Column(name = "member_status")
	private int member_status;
	
	@Column(name = "self_intro")
	private String self_intro;

	public members() {
	}

	public members(String member_account, String member_pwd, String member_name, String member_email, String nickname,
			String gender, String city, String birthday, String star_sign, String blood_type, String hobbies,
			byte[] picture_1, byte[] picture_2, int member_status, String self_intro) {
		super();
		this.member_account = member_account;
		this.member_pwd = member_pwd;
		this.member_name = member_name;
		this.member_email = member_email;
		this.nickname = nickname;
		this.gender = gender;
		this.city = city;
		this.birthday = birthday;
		this.star_sign = star_sign;
		this.blood_type = blood_type;
		this.hobbies = hobbies;
		this.picture_1 = picture_1;
		this.picture_2 = picture_2;
		this.member_status = member_status;
		this.self_intro = self_intro;
	}

	public String getMember_account() {
		return member_account;
	}

	public void setMember_account(String member_account) {
		this.member_account = member_account;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getStar_sign() {
		return star_sign;
	}

	public void setStar_sign(String star_sign) {
		this.star_sign = star_sign;
	}

	public String getBlood_type() {
		return blood_type;
	}

	public void setBlood_type(String blood_type) {
		this.blood_type = blood_type;
	}

	public String getHobbies() {
		return hobbies;
	}

	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}

	public byte[] getPicture_1() {
		return picture_1;
	}

	public void setPicture_1(byte[] picture_1) {
		this.picture_1 = picture_1;
	}

	public byte[] getPicture_2() {
		return picture_2;
	}

	public void setPicture_2(byte[] picture_2) {
		this.picture_2 = picture_2;
	}

	public int getMember_status() {
		return member_status;
	}

	public void setMember_status(int member_status) {
		this.member_status = member_status;
	}

	public String getSelf_intro() {
		return self_intro;
	}

	public void setSelf_intro(String self_intro) {
		this.self_intro = self_intro;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	


}
