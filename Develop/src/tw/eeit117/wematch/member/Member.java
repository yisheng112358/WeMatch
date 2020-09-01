package tw.eeit117.wematch.member;

import java.io.FileInputStream;
import javax.persistence.Entity;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "Member")
public class Member {
	@Id
	@Column(name = "member_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int memberid;
	
	@Column(name = "member_account")
	private String memberAccount;
	
	@Column(name = "member_pwd")
	private String memberPwd;
	
	@Column(name = "member_name")
	private String memberName;
	
	@Column(name = "member_email")
	private String memberEmail;
	
	@Column(name = "gender")
	private String nickname;
	
	@Column(name = "gender")
	private String gender;
	
	@Column(name = "city")
	private String city;
	
	@Column(name = "birthday")
	private String birthday;
	
	@Column(name = "star_sign")
	private String starSign;
	
	@Column(name = "blood_type")
	private String bloodType;
	
	@Column(name = "hobbies")
	private String[] hobbies;
	
	@Column(name = "picture_1")
	private FileInputStream pic1;
	
	@Column(name = "picture_2")
	private FileInputStream pic2;
	
	@Column(name = "member_status")
	private int memberStatus;
	
	@Column(name = "self_intro")
	private String selfIntro;

	public Member() {
	}

	public Member(String memberAccount, String memberPwd, String memberName, String memberEmail, String nickname,
			String gender, String city, String birthday, String starSign, String bloodType, String[] hobbies,
			FileInputStream pic1, FileInputStream pic2, int memberStatus, String selfIntro) {
		super();
		this.memberAccount = memberAccount;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.nickname = nickname;
		this.gender = gender;
		this.city = city;
		this.birthday = birthday;
		this.starSign = starSign;
		this.bloodType = bloodType;
		this.hobbies = hobbies;
		this.pic1 = pic1;
		this.pic2 = pic2;
		this.memberStatus = memberStatus;
		this.selfIntro = selfIntro;
	}
	

	public String getMemberAccount() {
		return memberAccount;
	}

	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
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

	public String getStarSign() {
		return starSign;
	}

	public void setStarSign(String starSign) {
		this.starSign = starSign;
	}

	public String getBloodType() {
		return bloodType;
	}

	public void setBloodType(String bloodType) {
		this.bloodType = bloodType;
	}

	public String[] getHobbies() {
		return hobbies;
	}

	public void setHobbies(String[] hobbies) {
		this.hobbies = hobbies;
	}

	public FileInputStream getPic1() {
		return pic1;
	}

	public void setPic1(FileInputStream pic1) {
		this.pic1 = pic1;
	}

	public FileInputStream getPic2() {
		return pic2;
	}

	public void setPic2(FileInputStream pic2) {
		this.pic2 = pic2;
	}

	public int getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(int memberStatus) {
		this.memberStatus = memberStatus;
	}

	public String getSelfIntro() {
		return selfIntro;
	}

	public void setSelfIntro(String selfIntro) {
		this.selfIntro = selfIntro;
	}

	public int getMemberid() {
		return memberid;
	}

	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}

}
