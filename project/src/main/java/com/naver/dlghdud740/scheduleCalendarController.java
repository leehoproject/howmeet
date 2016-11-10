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

import com.naver.dlghdud740.entities.Member;
import com.naver.dlghdud740.service.MemberDao;

/**
 * Handles requests for the application home page.
 */


@Controller
public class scheduleCalendarController {
	
	@Autowired
	private Member member;
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(scheduleCalendarController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "calendar", method = RequestMethod.GET)
	public String calendar(Locale locale, Model model) {
		return "Calendar/scheduleCalendar";
	}
	
}
