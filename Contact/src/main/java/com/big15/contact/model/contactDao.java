package com.big15.contact.model;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.big15.contact.dto.ContactDto;
import com.big15.contact.dto.SearchDto;
import com.big15.contact.dto.UserDto;

@Component
public class contactDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
//	JDBC Connection을 위한 jdbcTemplate 설정.
	public void setTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
//	로그인 기능 구현.
	public UserDto login(UserDto userDto) {
		UserDto res = null;
		
		String sql = "SELECT usernm, userid, userpw, usertel "
			       + "  FROM contact_user"
				   + " WHERE userid = ? "
				   + "   AND userpw = ?";
		try {
			res = jdbcTemplate.queryForObject(
					sql, (resultSet, rowNum) -> {
						UserDto inres = new UserDto();
						inres.setUsernm(resultSet.getString("usernm"));
						inres.setUserid(resultSet.getString("userid"));
						inres.setUserpw(resultSet.getString("userpw"));
						inres.setUsertel(resultSet.getInt("usertel"));
						return inres;
					}, userDto.getUserid(), userDto.getUserpw());
		} catch (Exception e) {
		}

		return res;
	}
	
//	main에서 넘어오는 userDto를 받아 session 이 끊킨 접속일 경우 false 리턴 아닐경우 true 리턴
	public boolean loginCheck(UserDto userDto) {
		if(userDto == null) {
			return false;
		} else {
			return true;
		}
	}
	
//	Userid에 맞는 Contact를 select하는 메소드
	public List<ContactDto> select(String userid) {		
		String sql = "SELECT a.bookmark, a.userid , a.contactid, a.contactnm, a.contacttel, a.contactaddr, b.contactdiv_nm	"
			       + "  FROM contact a, division b																"
				   + " WHERE a.contactdiv_id = b.contactdiv_id 													"
				   + "   AND a.userid = ? 																		"
				   + " ORDER BY bookmark DESC 																	";

		return jdbcTemplate.query(sql, new RowMapper<ContactDto>() {
			@Override
			public ContactDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				ContactDto dto = new ContactDto();
				dto.setBookmark(rs.getString(1));
				dto.setUserid(rs.getString(2));
				dto.setContactid(rs.getInt(3));
				dto.setContactnm(rs.getString(4));
				dto.setContacttel(rs.getString(5));
				dto.setContactaddr(rs.getString(6));
				dto.setContactdiv_nm(rs.getString(7));				
				return dto;
			}
		}, userid);
	}

//	검색기능이 있는 select
	public List<ContactDto> select(String userid, SearchDto searchDto) {
		String searchVal = "%"+searchDto.getSearchVal()+"%";
		String search = searchDto.getSearch();

		String sql = "SELECT a.bookmark, a.userid , a.contactid, a.contactnm, a.contacttel, a.contactaddr, b.contactdiv_nm	"
			       + "  FROM contact a, division b	"
				   + " WHERE a.contactdiv_id = b.contactdiv_id 	"
				   + "   AND a.userid = :userid "
				   + "	 AND " +search+ " like :searchVal "
				   
				   + " ORDER BY bookmark DESC 	";
		
		return jdbcTemplate.query(sql, new RowMapper<ContactDto>() {
			@Override
			public ContactDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				ContactDto dto = new ContactDto();
				dto.setBookmark(rs.getString(1));
				dto.setUserid(rs.getString(2));
				dto.setContactid(rs.getInt(3));
				dto.setContactnm(rs.getString(4));
				dto.setContacttel(rs.getString(5));
				dto.setContactaddr(rs.getString(6));
				dto.setContactdiv_nm(rs.getString(7));	
				return dto;
			}
		}, userid, searchVal);
	}
	
//	회원가입 기능
	public void signup(UserDto userDto) {
		String sql = "INSERT INTO CONTACT_USER " 
				   + "VALUES(?,?,?,?)          ";
		
		jdbcTemplate.update(sql, 
							userDto.getUsernm(), 
							userDto.getUserid(), 
							userDto.getUserpw(), 
							userDto.getUsertel()
							);
	}

//	contact 삭제 기능
	public void delete(int contactid) {
		String sql = "DELETE FROM contact   "
    			   + " WHERE contactid = ?  ";
		
		jdbcTemplate.update(sql, contactid);	
	}

//	contact 추가 기능
	public String add(ContactDto contactDto, String userid){
		String sql =  "INSERT INTO contact									"
				+ "VALUES(												"
				+ "	  ?													"
				+ "	, (SELECT NVL(MAX(contactid)+1, 1) FROM CONTACT)	"
				+ "	, ?													"
				+ "	, ?													"
				+ "	, ?													"
				+ "	, ?													"
				+ " , ' ')												";
		try {
			jdbcTemplate.update(sql, 
					userid,
					contactDto.getContactnm(),
					contactDto.getContacttel(),
					contactDto.getContactaddr(),
					contactDto.getContactdiv_id()
					);
		} catch (Exception e) {
			return "error";
		}
		return null;

	}
	
//	contact 수정 기능
	public void edit(ContactDto contactDto, int contactid) {
		String sql = "UPDATE CONTACT				"
					+ "	 SET CONTACTNM			= ?	"
					+ "	   , CONTACTTEL 		= ?	"
					+ "	   , CONTACTADDR 		= ?	"
					+ "	   , CONTACTDIV_ID 		= ?	"
					+ "WHERE CONTACTID			= ?	";
		
		jdbcTemplate.update(sql, 
				contactDto.getContactnm(),
				contactDto.getContacttel(),
				contactDto.getContactaddr(),
				contactDto.getContactdiv_id(),
				contactid
				);
	}
	
//	contact 북마크(즐겨찾기)기능
	public void bookmark(int contactid) {
		String sql =  "UPDATE CONTACT										"
					+ "	 SET bookmark = CASE					 			"
					+ "  WHEN bookmark = ' ' THEN '-fill'					"
					+ "  WHEN bookmark = '-fill' THEN ' ' ELSE bookmark END	"
					+ " WHERE CONTACTID = ?									";	
		jdbcTemplate.update(sql, contactid);
	}

//	user 탈퇴 기능
	public void leaveUser(UserDto userDto) {
		String sql = "DELETE FROM contact   "
 			  	   + " WHERE userid = ?  ";
		
		jdbcTemplate.update(sql, userDto.getUserid());
		
		sql = "DELETE FROM contact_user   "
			 + " WHERE userid = ?  ";
		
		jdbcTemplate.update(sql, userDto.getUserid());
	}

//	회원정보 찾기 기능
	public String findUser(UserDto userDto) {
		UserDto res = null;
		String  sql = null;
		
		if(userDto.getUserid() == null) {
			sql = "SELECT userid"
				+ "  FROM contact_user"
				+ " WHERE usertel = ? "
				+ "   AND usernm = ?";
			try {
				res = jdbcTemplate.queryForObject(
						sql, (resultSet, rowNum) -> {
							UserDto inres = new UserDto();
							inres.setUserid(resultSet.getString("userid"));
							return inres;
						}, userDto.getUsertel(), userDto.getUsernm());

						return "ID"+res.getUserid();
			} catch (Exception e) {
				return null;
			}
		}
		else {
			sql = "SELECT userpw"
				+ "  FROM contact_user"
				+ " WHERE userid = ? "
				+ "   AND usertel = ? "
				+ "   AND usernm = ? ";
			try {
				res = jdbcTemplate.queryForObject(
						sql, (resultSet, rowNum) -> {
							UserDto inres = new UserDto();
							inres.setUserpw(resultSet.getString("userpw"));
							return inres;
						}, userDto.getUserid(), userDto.getUsertel(), userDto.getUsernm());

				return "PW"+res.getUserpw();
			} catch (Exception e) {
				return null;
			}
		}
	}	
}
