package com.naver.dlghdud740;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dlghdud740.entities.Member;
import com.naver.dlghdud740.entities.Memberlist;
import com.naver.dlghdud740.entities.Photo;
import com.naver.dlghdud740.entities.Society;
import com.naver.dlghdud740.entities.deletelist;
import com.naver.dlghdud740.entities.societylist;
import com.naver.dlghdud740.service.MemberDao;
import com.naver.dlghdud740.service.MemberlistDao;
import com.naver.dlghdud740.service.PhotoDao;
import com.naver.dlghdud740.service.SocietyDao;

/**
 * Handles requests for the application home page.
 */


@Controller
public class SocietyContoroller {
	
	@Autowired
	private Society society;
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(SocietyContoroller.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//동호회만들기
	@RequestMapping(value = "/createmeeting", method = RequestMethod.GET)
	public String creategr(Locale locale, Model model) {	
		return "society/society_create";
	}
	//동호회메인
	@RequestMapping(value = "/societymain", method = RequestMethod.GET)
	public ModelAndView societymain(@RequestParam("check") String check,@RequestParam("societyname") String societyname,@RequestParam("sessionid") String sessionid) {	
		String msg ="";
		MemberlistDao mldao = sqlSession.getMapper(MemberlistDao.class);
		PhotoDao pdao = sqlSession.getMapper(PhotoDao.class);
		SocietyDao sdao = sqlSession.getMapper(SocietyDao.class);
		societylist list = new societylist();
		list.setSessionid(sessionid);
		list.setSocietyname(societyname);
		int count= mldao.selectMember(list);
		ArrayList<Memberlist> memberlists= mldao.selectAll(societyname);
		ArrayList<Photo> photos= pdao.selectPhoto(societyname);
		Society society =sdao.selectSociety(societyname);
		if(photos.size()==0){
			msg = "0" ;
		}
		ModelAndView mav = new ModelAndView("society/society_main");
		mav.addObject("memberlists",memberlists);
		mav.addObject("photos",photos);		
		mav.addObject("msg",msg);
		mav.addObject("check",check);
		mav.addObject("societyname",societyname);
		mav.addObject("count",count);
		mav.addObject("society",society);
		return mav;
	}
	//동호회모임 Insert
	@RequestMapping(value = "/SocietyCreate", method = RequestMethod.GET)
	public ModelAndView SocietyCreate(@ModelAttribute("society") Society society) {	
		SocietyDao dao = sqlSession.getMapper(SocietyDao.class);
		int result = dao.insertRow(society);
		String msg = "";
		if(result==1){
			msg=society.getS_name()+"이름으로 동호회를 설립하였습니다.";
		} else {
			msg="동호회 설립 실패";
		}
		ModelAndView mav = new ModelAndView("society/society_result");
		mav.addObject("msg",msg);
		mav.addObject("result","ok");
		
		return mav;
	}
	//모임리스트
	@RequestMapping(value = "/societyFind", method = RequestMethod.GET)
	public ModelAndView searchgr(@RequestParam("category") String category) {
		SocietyDao dao =sqlSession.getMapper(SocietyDao.class);
		ArrayList<Society>societys= dao.selectAll(category);
		ModelAndView mav = new ModelAndView("society/society_find");
		mav.addObject("societys",societys);
		mav.addObject("category",category);
		return mav;
	}
	
	//모임리스트
	@RequestMapping(value = "/findGroup", method = RequestMethod.GET)
	public ModelAndView findGroup(@RequestParam("namefind") String namefind) {
		SocietyDao dao =sqlSession.getMapper(SocietyDao.class);
		ArrayList<Society>societys= dao.findGroup(namefind);
		ModelAndView mav = new ModelAndView("society/society_find");
		mav.addObject("societys",societys);
		return mav;
	}
	
	//사진입력
	@RequestMapping(value = "/insertPhoto", method = RequestMethod.GET)
	public ModelAndView insertPhoto(@ModelAttribute("photo") Photo photo) {	
		PhotoDao dao = sqlSession.getMapper(PhotoDao.class);
		int result = dao.insertPhoto(photo);
		if(result==1){
			System.out.println("yyyyyyes");
		} else {
			System.out.println("nooooooooo");
		}
		ModelAndView mav = new ModelAndView("redirect:/societymain");
		mav.addObject("check","1");
		mav.addObject("societyname",photo.getP_name());
		mav.addObject("sessionid",photo.getP_id());
		return mav;
		}
	
	//멤버확인
	@RequestMapping(value = "selectMember", method = RequestMethod.GET)
	public ModelAndView selectMember(@RequestParam("sessionid") String sessionid,@RequestParam("societyname") String societyname) {
		MemberlistDao dao =sqlSession.getMapper(MemberlistDao.class);
		societylist list = new societylist();
		list.setSessionid(sessionid);
		list.setSocietyname(societyname);
		int count= dao.selectMember(list);
		if(count==0){
			ModelAndView mav = new ModelAndView("redirect:/societyJoin");
			mav.addObject("sessionid",sessionid);
			mav.addObject("societyname",societyname);
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("redirect:/societymain");
			mav.addObject("check","0");
			mav.addObject("societyname",societyname);
			mav.addObject("sessionid",sessionid);
			return mav;
		}
	}
	
	//모임가입
	@RequestMapping(value = "/societyJoin", method = RequestMethod.GET)
	public ModelAndView societyJoin(@RequestParam("sessionid") String sessionid,@RequestParam("societyname") String societyname) {
		MemberlistDao dao =sqlSession.getMapper(MemberlistDao.class);
		societylist list = new societylist();
		list.setSessionid(sessionid);
		list.setSocietyname(societyname);
		int result= dao.joinMember(list);
		dao.memberCount(societyname);
		if(result==1){
			System.out.println("yyyyyyes");
		} else {
			System.out.println("nooooooooo");
		}
		ModelAndView mav = new ModelAndView("redirect:/societymain");
		mav.addObject("check","1");
		mav.addObject("societyname",societyname);
		mav.addObject("sessionid",sessionid);
		return mav;
	}
	
	//모임간리페이지
	@RequestMapping(value = "/societyadmin", method = RequestMethod.GET)
	public String societyadmin() {	
		return "society/society_admin";
	}
	
	//사진삭제
	@RequestMapping(value = "/photodelete", method = RequestMethod.GET)
	public ModelAndView photodelete(@RequestParam("p_seq") String p_seq,@RequestParam("societyname") String societyname,@RequestParam("sessionid") String sessionid) {
		PhotoDao dao =sqlSession.getMapper(PhotoDao.class);
		System.out.println(p_seq);
		System.out.println(societyname);
		deletelist list = new deletelist();
		list.setP_seq(p_seq);
		list.setSocietyname(societyname);
		int result= dao.deletePhoto(list);
		if(result==1){
			System.out.println("yyyyyyes");
		} else {
			System.out.println("nooooooooo");
		}
		ModelAndView mav = new ModelAndView("redirect:/societymain");
		mav.addObject("check","1");
		mav.addObject("societyname",societyname);
		mav.addObject("sessionid",sessionid);
		return mav;
	}
}
