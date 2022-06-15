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
		
		Calendar cal=Calendar.getInstance(); //abstract class �̱� ������ ���� ���� ��üȭ�� ���� �ʴ´�.-> static method���
		
		int today=cal.get(Calendar.DAY_OF_MONTH); //day(��)�� ���� �� �ִ�.
		
		cal.set(Calendar.DAY_OF_MONTH, 1);//���� ����� �����ϱ� ���� ��� ���� �ִ� ��¥�� �����Ѵ�.
		
		//���� �ԷµǸ� 
		if(param_month!=-1) {
			//���� ���� ���� ���ڰ� �����Ǹ� ���� �� 1�Ϸ� �����ȴ�.
			cal.set(Calendar.MONTH, param_month-1);//���� 0���̽��̱� ������ ����� ������ 1 ���� ����
		}
		//System.out.println(param_month);
		
		//���� �ԷµǸ� 
		if(param_year!=-1) {
			cal.set(Calendar.YEAR, param_year);//���� 1���̽��̱� ������ ���� �״�� ����
		}
		
		
		model.addAttribute("cal",cal); //ó���� ��û�Ǿ��� ���� ���� ��¥�� ������
		model.addAttribute("today",today); //������ ��¥(��)�� ���´�.
		
		return "index";
	}
	
}