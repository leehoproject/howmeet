package com.naver.dlghdud740;

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

import com.naver.dlghdud740.entities.Society;
import com.naver.dlghdud740.service.MemberDao;
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
	//동호회모임 Insert
	@RequestMapping(value = "/SocietyCreate", method = RequestMethod.GET)
	public ModelAndView SocietyCreate(@ModelAttribute("society") Society society) {	
		SocietyDao dao = sqlSession.getMapper(SocietyDao.class);
		System.out.println(society.getS_area());
		System.out.println(society.getS_name());
		System.out.println(society.getS_content());
		System.out.println(society.getS_peoplenum());
		System.out.println(society.getS_hobby());
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
}
