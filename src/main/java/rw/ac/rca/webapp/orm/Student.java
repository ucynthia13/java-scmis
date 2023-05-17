 /**
 * 
 */
package rw.ac.rca.webapp.orm;

import java.util.Date;
import java.util.List;

import javax.persistence.*;

 @Entity
@Table(name = "student")
public class Student extends Person{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8680703317249517930L;

	private String email;
	private String gender;
	private int isInternational;
	
	public Student() {
	}

	public Student(String fname, String lname, Date dob, String email, String gender, int isInternational){
		this.setFirstName(fname);
		this.setLastName(lname);
		this.setDateOfBirth(dob);
		this.setEmail(email);
		this.setGender(gender);
		this.setIsInternational(isInternational);
	}
	
	@OneToMany(cascade= CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "student")
	private List<Enrol> enrols;
	
	@ManyToOne
	@JoinColumn(name = "address_id")
	private Address address;

	 public Student(int studentid) {
		 this.setId(studentid);
	 }


	 public List<Enrol> getEnrols() {
   		return enrols;
	}
	public void setEnrollments(List<Enrol> enrols) {
		this.enrols = enrols;
	}

	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getIsInternational() {
		return isInternational;
	}

	public void setIsInternational(int isInternational) {
		this.isInternational = isInternational;
	}

//	@Override
//	String getAllNames() {
//		return getFirstName()+ " "+ getLastName();
//	}
	
}
