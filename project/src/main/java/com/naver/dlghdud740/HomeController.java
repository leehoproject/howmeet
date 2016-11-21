package com.naver.dlghdud740;

import java.io.IOException;
import java.util.ArrayList;
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
import com.naver.dlghdud740.entities.Society;
import com.naver.dlghdud740.entities.SocietyPage;
import com.naver.dlghdud740.service.MemberDao;
import com.naver.dlghdud740.service.SocietyDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private Member member;
	
	//모임 페이지 리스트 출력하기 위해 임시로 잡았고 차후 Society 컨트롤러로 옮길 예정
	private Society society;
	private int selectedpage;
	public static String selectbox;
	public static String find;
	
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
	
	//id 중복체크 수정 중 By 이기범
	@RequestMapping(value = "/idconfirm", method = RequestMethod.POST)
	@ResponseBody public int idconfirm( @RequestParam("m_id") String m_id) {
		int count = 1;
		int find = 0;
		System.out.println("--->>"+count+" "+find);
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		try {
			count = dao.selectCount(m_id);
			System.out.println("------------->>>"+m_id+" "+count);
		} catch (Exception e) {
			System.out.println("idconfirm err: "+e.getMessage());
		}
		
		if(count>0)
			find=1;
		else
			find=0;
		
		System.out.println("---------------->>"+find);
		
		return find;
	}
	
	//회원가입 결과창
	@RequestMapping(value = "/member_result", method = RequestMethod.GET)
	public String member_result(Locale locale, Model model) {	
		return "redirect:/home";
	}
	
	//로그인 적용 By 이기범
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
	
	//로그아웃 적용 By 이기범
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {	
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/home";
	}
	
	//정보수정으로 이동 (post방식으로 변경하는 방향 고려) By 이기범
	@RequestMapping(value = "/memberUpdateForm", method = RequestMethod.GET)
	public ModelAndView memberUpdateForm(@RequestParam String m_id) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		Member member = dao.selectOne(m_id);
		ModelAndView mav = new ModelAndView("member/member_update");
		mav.addObject("member",member);
		System.out.println("m_id is : "+m_id);
		return mav;
	}
	
	//정보수정 반영 By 이기범
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public ModelAndView memberUpdate(@ModelAttribute("member") Member member) {	
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		member.setM_phone(member.getM_phone1()+member.getM_phone2()+member.getM_phone3());
		int result = dao.updateRow(member);
		
		String msg = "";
		if(result == 1){
			msg += "성공적으로 수정되었습니다.";
		} else {
			msg += "수정에 실패했습니다.";
		}
		
		ModelAndView mav = new ModelAndView("member/member_result");
		mav.addObject("msg",msg);
		return mav;		
	}
	
	//회원탈퇴 페이지로 이동 By 이기범
	@RequestMapping(value = "/memberDeleteForm", method = RequestMethod.GET)
	public ModelAndView memberDeleteForm(@RequestParam String m_id) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		ModelAndView mav = new ModelAndView("member/member_delete_message");
		mav.addObject("m_id",m_id);
		System.out.println("------------->>>>"+m_id);
		return mav;
	}
	
	//회원탈퇴 진행 By 이기범
	@RequestMapping(value = "/memberDelete", method = RequestMethod.GET)
	public ModelAndView memberDelete(@ModelAttribute("m_id") String m_id) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		ModelAndView mav = new ModelAndView("member/member_result");
		mav.addObject("member",member);
		int result = dao.deleteRow(m_id);
		String msg = "";
		if (result == 1) {
			msg = "그 동안 HowMeet을 이용해주셔서 감사합니다.";
		} else {
			msg = "탈퇴에 실패했습니다.";
		}
		
		mav.addObject("msg",msg);
		System.out.println("result is:"+result);
		
		return mav;
	}
	
	//구글맵
	@RequestMapping(value = "/GoogleMap", method = RequestMethod.GET)
	public String GoogleMap(Locale locale, Model model) {	
		return "main/GoogleMap";
	}
	
	//회원 목록리스트
	@RequestMapping(value = "/member_list", method = RequestMethod.GET)
	public ModelAndView member_list(Locale locale, Model model) {	
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		ArrayList<Member> members= dao.selectAll();
		ModelAndView mav = new ModelAndView("member/member_list");
		mav.addObject("members",members);
		
		return mav;
	}
	
	//게시판 페이지 리스트(차후 모임 컨트롤러로 옮김) By 이기범
	@RequestMapping(value = "/societyPageList", method = RequestMethod.POST)
	public ModelAndView societyPageList(@ModelAttribute("societypage") SocietyPage societypage) {
		SocietyDao dao =sqlSession.getMapper(SocietyDao.class);
		ModelAndView mav = new ModelAndView("main/searchmeeting");
		
		this.selectbox = societypage.getSelectbox();
		this.find = societypage.getFind();
		int rowcount = dao.selectCount(societypage);
		int pageSize = 10;
		int pageCount = 0;
		int absPage = 0;
		
		if(selectedpage == 0)
			selectedpage =1;
		int startrow = (selectedpage - 1) *pageSize;
		int endrow = startrow + 10;
		societypage.setStartrow(startrow);
		societypage.setEndrow(endrow);
		
		ArrayList<Society> societies = dao.selectPageList(societypage);
		
		if(rowcount>0 && rowcount%pageSize != 0)
			absPage = 1;
		pageCount = rowcount / pageSize + absPage;
		int pages [] =new int[pageCount];
		for(int i = 0 ; i< pageCount; i++){
			pages[i] = i+1;
		}
		mav.addObject("selectedpage",selectedpage);
		mav.addObject("societies",societies);
		mav.addObject("pages",pages);
		
		return mav;
	}
	
	@RequestMapping(value = "/societyPageSelect", method = RequestMethod.GET)
	public ModelAndView societyPageSelect(@RequestParam int page,@ModelAttribute("societypage") SocietyPage societypage) {
		SocietyDao dao =sqlSession.getMapper(SocietyDao.class);
		ModelAndView mav = new ModelAndView("main/searchmeeting");
		societypage.setSelectbox(this.selectbox);
		societypage.setFind(this.find);
		int rowcount = dao.selectCount(societypage);
		int pageSize = 10;
		int absPage = 0;
		int startrow = (page - 1) * pageSize;
		int endrow = startrow + 10;
		societypage.setStartrow(startrow);
		societypage.setEndrow(endrow);
		ArrayList<Society> societies = dao.selectPageList(societypage);
		if(rowcount>0 && rowcount%pageSize != 0)
			absPage = 1;
		int pageCount = rowcount / pageSize + absPage;
		int pages [] =new int[pageCount];
		for(int i = 0 ; i< pageCount; i++){
			pages[i] = i+1;
		}
		mav.addObject("societypage",societypage);
		mav.addObject("societies",societies);
		mav.addObject("pages",pages);
		
		return mav;
	}
	
}
