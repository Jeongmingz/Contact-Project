package com.big15.contact.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ContactDto implements Serializable {
	private String 	userid;
	private int 	contactid;
	private String 	contactnm;
	private String 	contacttel;
	private String 	contactaddr;
	private String  contactdiv_id;
	private String 	contactdiv_nm;
	private String 	bookmark;

	
	public ContactDto(String contactnm, String contacttel, String contactaddr, String contactdiv_nm) {
		this.contactnm = contactnm;
		this.contacttel = contacttel;
		this.contactaddr = contactaddr;
		this.contactdiv_nm = contactdiv_nm;
	}


	public ContactDto() {
		// TODO Auto-generated constructor stub
	}
}
