package com.naver.dlghdud740;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dlghdud740.entities.Member;
import com.naver.dlghdud740.service.MemberDao;

/**
 * Handles requests for the application home page.
 */


@Controller
public class HomeController {
	
	@Autowired
	private Member member;
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "redirect:/home";
	}
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home2(Locale locale, Model model) {	
		return "layout/body";
	}
	
	//회원가입페이지
	@RequestMapping(value = "/member.html", method = RequestMethod.GET)
	public String member(Locale locale, Model model) {	
		return "main/member";
	}
	//회원가입
	@RequestMapping(value = "/memberInsert", method = RequestMethod.GET)
	public ModelAndView memberInsert(@ModelAttribute("member") Member member) {	
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		String msg = "";
		member.setM_phone(member.getM_phone1()+member.getM_phone2()+member.getM_phone3());
		System.out.println(member.getM_phone());
		int result = dao.insertRow(member);
		if(result==1){
			msg="success! Insert your Info.";
		} else {
			msg="fail! yout Info.";
		}
		ModelAndView mav = new ModelAndView("member/member_result");
		
		mav.addObject("msg",msg);
		mav.addObject("result","ok");
		
		return mav;
	}
	//회원가입 결과창
	@RequestMapping(value = "/member_result", method = RequestMethod.GET)
	public String member_result(Locale locale, Model model) {	
		return "/home";
	}
	//동호회만들기
	@RequestMapping(value = "/createmeeting.html", method = RequestMethod.GET)
	public String creategr(Locale locale, Model model) {	
		return "main/createmeeting";
	}
	//모임리스트
	@RequestMapping(value = "/searchmeeting.html", method = RequestMethod.GET)
	public String searchgr(Locale locale, Model model) {	
		return "main/searchmeeting";
	}
	
}
