package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Weather;

//서블릿 그자체, 왜냐하면 서블릿을 상속받았기 때문에
@Controller
@RequestMapping("/recommend/")
public class RecommendController {

	@ModelAttribute
	public void initProcess() {

		System.out.println("====================");

	}
	@RequestMapping(value = "weather") // 맨끝단의 url만 가지고 옴, get방식으로 한다.
	public String weather() {
		// TODO Auto-generated method stub
		
	
		return "recommend/weather";
	}

	@RequestMapping(value = "weatherinfo") // 맨끝단의 url만 가지고 옴, get방식으로 한다.
	public String weather_seek(@RequestParam("city")String city, Model model) {
		// TODO Auto-generated method stub
		String URL = "https://weather.naver.com/rgn/cityWetrMain.nhn";
		Document doc = null;
		try {
			doc = Jsoup.connect(URL).get(); // 지정한 url의 html태그를 문자열 형태로 다 가져옴.

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Elements elem = doc.select(".tbl_weather tbody tr");
		String[] str = elem.text().split(" ");
		// 이미지 크롤링
		Elements img = doc.select(".tbl_weather tbody tr td img");
		
		List<String> weatherlist = splite_weather(str);
		Map<String, Weather> weather = new HashMap<String, Weather>();
		
		int index = 0;
		System.out.println("list : " + weatherlist);
		for (String s : weatherlist) {
			Weather objweather = new Weather();
			System.out.println("s : " + s);
			String[] t =s.split(",");
			String region = "";
			
			for(int i = 0; i<t.length;i++){
				if(s.contains("제주")){
					region = t[0];
					objweather.setAmdes(t[1]); 
					objweather.setAmtemp(t[3]); 
					objweather.setAmrain(t[5]);
					objweather.setPmdes(t[6]);
					objweather.setPmtemp(t[8]);
					objweather.setPmrain(t[10]);
					break;
				}
				if(i<2){
					region+=t[i];
				}
				switch(i){
					case 2 : objweather.setAmdes(t[i]); break;
					case 4 : objweather.setAmtemp(t[i]); break;
					case 6 : objweather.setAmrain(t[i]); break;
					case 7 : objweather.setPmdes(t[i]); break;
					case 9 : objweather.setPmtemp(t[i]); break;
					case 11 : objweather.setPmrain(t[i]); break;
				}
			};
			objweather.setAmimg(img.get(index));
			objweather.setPmimg(img.get(index+1));
			index+=2;
			weather.put(region, objweather);
			System.out.println(region + " : "+objweather);
		}
		System.out.println("===========");
		System.out.println(weather);
		System.out.println(city);
		
	//	String citykr = translate_Kr(city);
		
		System.out.println(weather.get(city));
		
		model.addAttribute("weather", weather.get(city));
		return "recommend/weatherForm";
	}

	
	private List<String> splite_weather(String[] s) {
		// TODO Auto-generated method stub
		List<String> weatherstr = new ArrayList<>();
		String tmp = "";
		for (int i = 0; i < s.length; i++) {
			tmp += s[i] + ",";
			// i가 0,12,24,36.. 순을 날씨가 시작 하기 때문에 그 직전에 초기화 하기 위해
			if (i % 12 == 11 && i != 0 || i==s.length-1) {
				//System.out.println(i+" : "+tmp);
				weatherstr.add(tmp);		//제주는 혼자서 지역명이 하나이기 때문에
				tmp = "";
			}
		}
		return weatherstr;
	}

}
