package kr.co.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.Calendar;

@Controller
public class CalendarController {

	@RequestMapping(value= {"index.do","calendar.do"},method= {GET,POST})
		public String main(Model model, @RequestParam(defaultValue = "-1")int param_month,
				@RequestParam(defaultValue = "-1")int param_year) {
		
		Calendar cal=Calendar.getInstance(); //abstract class 이기 때문에 직접 직접 객체화가 되지 않는다.-> static method사용
		
		int today=cal.get(Calendar.DAY_OF_MONTH); //day(일)를 얻을 수 있다.
		
		cal.set(Calendar.DAY_OF_MONTH, 1);//월을 제대로 설정하기 위해 모든 월에 있는 날짜로 설정한다.
		
		//월이 입력되면 
		if(param_month!=-1) {
			//현재 월에 없는 일자가 설정되면 다음 달 1일로 설정된다.
			cal.set(Calendar.MONTH, param_month-1);//월은 0베이스이기 때문에 사람의 월보다 1 적게 설정
		}
		//System.out.println(param_month);
		
		//년이 입력되면 
		if(param_year!=-1) {
			cal.set(Calendar.YEAR, param_year);//년은 1베이스이기 때문에 년은 그대로 설정
		}
		
		
		model.addAttribute("cal",cal); //처음에 요청되었을 때는 현재 날짜가 들어오고
		model.addAttribute("today",today); //오늘의 날짜(일)가 들어온다.
		
		return "index";
	}
	
}
