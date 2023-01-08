package com.big15.contact.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.big15.contact.dto.ContactDto;
import com.big15.contact.dto.SearchDto;
import com.big15.contact.dto.UserDto;
import com.big15.contact.model.contactDao;

@Controller
@RequestMapping("/contact")
@SessionAttributes({ "user", "listContact" })
public class ContactController {

	private contactDao dao;

	private Logger log = LoggerFactory.getLogger(ContactController.class);

	@Autowired
	public ContactController(contactDao dao) {
		this.dao = dao;
	}

	@RequestMapping("")
	public String gologin() {
		return "redirect:/contact/main";
	}

	@RequestMapping("/loginpage")
	public String loginpage(Model model) {
		return "contact/login";
	}

	@RequestMapping("/login")
	public String login(@ModelAttribute UserDto userDto, RedirectAttributes rttr, Model model) {
		UserDto res = null;

		res = dao.login(userDto);

		if (res == null) {
			log.info("===> 회원 로그인 과정에서 문제 발생.");
			rttr.addFlashAttribute("error", "존재하지 않는 계정입니다. 아이디, 비밀번호를 확인해주세요");
			return "redirect:/contact/loginpage";
		} else {
			log.info("===> 회원 로그인 성공 ID :" + userDto.getUserid());
			model.addAttribute("user", res);
			return "redirect:/contact/main";
		}
	}

	@RequestMapping("/signup")
	public String signUp(@ModelAttribute UserDto userDto, RedirectAttributes rttr, Model model) {
		try {
			dao.signup(userDto);
		} catch (Exception e) {
			log.info("===> 회원가입 중 오류 발생");
			rttr.addFlashAttribute("error", "회원가입을 다시 시도해주세요.");
			return "redirect:/contact/loginpage";
		}
		log.info("===> 회원가입 성공 ID :" + userDto.getUserid());
		rttr.addFlashAttribute("success", userDto.getUserid());
		return "redirect:/contact/loginpage";
	}

	@RequestMapping("/logout")
	public String logout(SessionStatus status) {
		if (!status.isComplete()) {
			status.setComplete();
		}
		return "redirect:/contact/loginpage";
	}

	@RequestMapping("/main")
	public String mainPage(@ModelAttribute UserDto userDto, @ModelAttribute SearchDto searchDto,
			@ModelAttribute ContactDto contactDto, SessionStatus status, Model model, RedirectAttributes rttr) {
		UserDto user = (UserDto) model.getAttribute("user");

		List<ContactDto> list = null;

		if (dao.loginCheck(user)) {
			if (searchDto.getSearch() == null) {
				list = dao.select(user.getUserid());
				ArrayList<ContactDto> arrayList = new ArrayList<ContactDto>();
				arrayList.addAll(list);
				model.addAttribute("listContact", arrayList);
				return "contact/main";
			} else {
				list = dao.select(user.getUserid(), searchDto);
				ArrayList<ContactDto> arrayList = new ArrayList<ContactDto>();
				arrayList.addAll(list);
				model.addAttribute("listContact", arrayList);
				return "contact/main";
			}
		} else {
			log.info("===> 비정상 적인 접근입니다.");
			rttr.addFlashAttribute("error", "비 정상적인 접근입니다. 로그인 후 접근하세요. ");
			return "redirect:/contact/loginpage";
		}
	}

	@RequestMapping("/add")
	public String addContact(@ModelAttribute ContactDto contactDto, RedirectAttributes rttr, Model model) {
		UserDto userDto = (UserDto) model.getAttribute("user");

		String userid = userDto.getUserid();
		String errorC = null;

		errorC = dao.add(contactDto, userid);

		if (errorC == null) {
			log.info("===> 연락처 추가 성공");
			rttr.addFlashAttribute("success", "연락처 추가 성공");
			return "redirect:/contact/main";
		} else {
			log.info("===> 연락처 추가 실패");
			rttr.addFlashAttribute("error", "이미 존재하는 전화번호입니다.");
			return "redirect:/contact/main";
		}
	}

	@GetMapping("/delete/{contactid}")
	public String deleteContact(@PathVariable int contactid,RedirectAttributes rttr , Model model) {
		dao.delete(contactid);

		rttr.addFlashAttribute("success","연락처 삭제 성공");

		log.info("===> 연락처 삭제 성공");

		return "redirect:/contact/main";
	}

	@RequestMapping("/edit/{contactid}")
	public String editContact(@PathVariable int contactid, @ModelAttribute ContactDto contactDto,RedirectAttributes rttr , Model model) {
		log.info("===> contactDto : " + contactDto);

		dao.edit(contactDto, contactid);
		
		rttr.addFlashAttribute("success","연락처 수정 성공");

		return "redirect:/contact/main";
	}

	@RequestMapping("/bookmark/{contactid}")
	public String bookmarkContact(@PathVariable int contactid, RedirectAttributes rttr, Model model) {
		log.info("===> bookmarking : " + contactid);

		dao.bookmark(contactid);
		
		return "redirect:/contact/main";
	}
	
	@RequestMapping("/leaveUser")
	public String leaveUser(RedirectAttributes rttr, Model model) {
		UserDto user = (UserDto) model.getAttribute("user");
		
		dao.leaveUser(user);
		
		rttr.addFlashAttribute("out", user.getUsernm()+"님 탈퇴 완료.");
		
		return "redirect:/contact/loginpage";
	}
	
	@RequestMapping("/findUser")
	public String findUser(@ModelAttribute UserDto userDto ,RedirectAttributes rttr , Model model) {
		if(userDto.getUserid() == "") {
			userDto.setUserid(null);
		}
		
		if(userDto.getUserid() == null && userDto.getUsernm() == null && userDto.getUserpw() == null) {
			rttr.addFlashAttribute("error", "비 정상적인 접근입니다. 값을 입력해주세요.");
			return "redirect:/contact/loginpage";
		}
		
		if(!(userDto == null)) {
			String find = dao.findUser(userDto);

			if(find == null) {
				rttr.addFlashAttribute("error", "입력한 정보와 맞는 계정이 없습니다");
				return "redirect:/contact/loginpage";
			}else {
				if(userDto.getUserid() == null) {
					userDto.setUserid(find);
				}
				else if(userDto.getUserpw() == null) {
					userDto.setUserpw(find);
				}
				
				model.addAttribute("user", userDto);
				rttr.addFlashAttribute("find", find);
				return "redirect:/contact/loginpage";
			}
		}
		return null;
	}
}
