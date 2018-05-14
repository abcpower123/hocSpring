package com.dangthanhhao.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="Users")
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long userId;
    private String firstName;
    private String lastName;
    private String email;
    private String companyName;
    private String address1;
    private String address2;
    private String city;
    private String state;
    private String zip;
    private String country;
    private String creditCardType;
    private String creditCardNumber;
    private String creditCardExpirationDate;
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCreditCardType() {
		return creditCardType;
	}
	public void setCreditCardType(String creditCardType) {
		this.creditCardType = creditCardType;
	}
	public String getCreditCardNumber() {
		return creditCardNumber;
	}
	public void setCreditCardNumber(String creditCardNumber) {
		this.creditCardNumber = creditCardNumber;
	}
	public String getCreditCardExpirationDate() {
		return creditCardExpirationDate;
	}
	public void setCreditCardExpirationDate(String creditCardExpirationDate) {
		this.creditCardExpirationDate = creditCardExpirationDate;
	}
	public User() {
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", companyName=" + companyName + ", address1=" + address1 + ", address2=" + address2 + ", city="
				+ city + ", state=" + state + ", zip=" + zip + ", country=" + country + ", creditCardType="
				+ creditCardType + ", creditCardNumber=" + creditCardNumber + ", creditCardExpirationDate="
				+ creditCardExpirationDate + "]";
	}
	
    
    // this works, but it mixes the Model and the View
//    public String getAddressHTMLFormat() {
//        String address = firstName + " " + lastName + "<br>";
//
//        if (companyName == null || companyName.equals("") || companyName.equals(" ")) {
//            address += "";
//        } else {
//            address += companyName + "<br>";
//        }
//
//        address += address1 + "<br>";
//
//        if (address2 == null || address2.equals("") || address2.equals(" ")) {
//            address += "";
//        } else {
//            address += address2 + "<br>";
//        }
//
//        address += city + ", " + st + " " + zip + "<br>"
//                + country;
//
//        return address;
//    }
//
//    public void setCreditCardType(String creditCartType) {
//        this.creditCardType = creditCartType;
//    }
//
//    public String getCreditCardType() {
//        return creditCardType;
//    }
//
//    public void setCreditCardNumber(String creditCardNumber) {
//        this.creditCardNumber = creditCardNumber;
//    }
//
//    public String getCreditCardNumber() {
//        return creditCardNumber;
//    }
//
//    public void setCreditCardExpirationDate(String creditCardExpirationDate) {
//        this.creditCardExpirationDate = creditCardExpirationDate;
//    }
//
//    public String getCreditCardExpirationDate() {
//        return creditCardExpirationDate;
//    }
}