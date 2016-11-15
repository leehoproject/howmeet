package com.naver.dlghdud740;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		return "member/member_insert";
	}
	
	//회원가입
	@RequestMapping(value = "/memberInsert", method = RequestMethod.GET)
	public ModelAndView memberInsert(@ModelAttribute("member") Member member) {	
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		member.setM_phone(member.getM_phone1()+member.getM_phone2()+member.getM_phone3());
		int result = dao.insertRow(member);
		String msg = "";
		if(result==1){
			msg=member.getM_id()+"님 회원가입을 완료 하였습니다.";
		} else {
			msg="회원가입 실패";
		}
		ModelAndView mav = new ModelAndView("member/member_result");
		mav.addObject("msg",msg);
		mav.addObject("result","ok");
		
		return mav;
	}
	
	//id 중복체크
	@RequestMapping(value = "/idconfirm", method = RequestMethod.POST)
	@ResponseBody public int idconfirm( @RequestParam("m_id") String m_id) {
		int count = 0;
		int find = 0;
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		try {
			count = dao.selectCount(m_id);
		} catch (Exception e) {
			System.out.println("idconfirm err: "+e.getMessage());
		}
		if(count>0)
			find=1;
		else
			find=0;
		return find;
	}
	
	//회원가입 결과창
	@RequestMapping(value = "/member_result", method = RequestMethod.GET)
	public String member_result(Locale locale, Model model) {	
		return "redirect:/home";
	}
	
	//로그인 적용
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("member") Member member,HttpSession session) {	
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		Member data = dao.selectLogin(member);
		
		if(data == null){
			return "redirect:/loginfail";
		} else {
			session.setAttribute("sessionid", data.getM_id());
			session.setAttribute("sessionpass", data.getM_pw());
			session.setAttribute("sessionname", data.getM_name());
			session.setAttribute("sessionemail", data.getM_email());
			return "redirect:/home";
		}
		
	}
	
	//로그아웃 적용
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {	
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/home";
	}
	
	//정보수정으로 이동
	@RequestMapping(value = "/memberUpdateForm", method = RequestMethod.GET)
	public ModelAndView memberUpdateForm(@RequestParam String m_id) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		Member member = dao.selectOne(m_id);
		ModelAndView mav = new ModelAndView("member/member_update");
		mav.addObject("member",member);
		return mav;
	}
	
	//모임리스트
	@RequestMapping(value = "/searchmeeting.html", method = RequestMethod.GET)
	public String searchgr(Locale locale, Model model) {	
		return "main/searchmeeting";
	}
	
	//구글맵
	@RequestMapping(value = "/GoogleMap", method = RequestMethod.GET)
	public String GoogleMap(Locale locale, Model model) {	
		return "main/GoogleMap";
	}
}
