package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Division;
import model.Weather;
import service.MybatisRcpDao;

//서블릿 그자체, 왜냐하면 서블릿을 상속받았기 때문에
@Controller
@RequestMapping("/recommend/")
public class RecommendController {

	@Autowired
	MybatisRcpDao dbPro;
	
	@ModelAttribute
	public void initProcess() {

		System.out.println("====================");

	}
	@RequestMapping(value = "weather") // 맨끝단의 url만 가지고 옴, get방식으로 한다.
	public String weather() {
		// TODO Auto-generated method stub
		
	
		return "recommend/weather_region";
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
		//weather 객체에 저장후, hashmap에 지역별 저장
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
			index+=2;//이미지저장 인덱스, 오전 오후 저장하기 위해
			weather.put(region, objweather);
			System.out.println(region + " : "+objweather);
		}
		System.out.println("===========");
		System.out.println(weather);
		System.out.println(city);
		Weather cityWeather = weather.get(city);
		//시간 가져오기
		SimpleDateFormat format = new SimpleDateFormat ( "MM,HH");
		String fmt_time = format.format(System.currentTimeMillis());
		String[] dt = fmt_time.split(",");
		int month = Integer.parseInt(dt[0]);
		int hour = Integer.parseInt(dt[1]);
		System.out.println(fmt_time);
		System.out.println(month);
		System.out.println(hour);
		
		
		System.out.println("===========");
		//레시피 추천 알고리즘
		int rain_index = 0;
		int temp_index = 0;
		int rain = 0;
		int temp = 0;
		System.out.println();
		if(hour<12){								//20% ->20
			rain = Integer.parseInt(cityWeather.getAmrain().substring(0,cityWeather.getAmrain().length()-1));
			temp = Integer.parseInt(cityWeather.getAmtemp().substring(0,cityWeather.getAmtemp().length()-3));
													//4.0℃ ->4
		}else{
			rain = Integer.parseInt(cityWeather.getPmrain().substring(0,cityWeather.getPmrain().length()-1));
			temp = Integer.parseInt(cityWeather.getPmtemp().substring(0,cityWeather.getPmtemp().length()-3));
		}
		switch((int)rain/10){
			case 0:
			case 1:
			case 2: rain_index = 0; break;
			case 3:
			case 4: rain_index = 1; break;
			case 5: 
			case 6: rain_index = 2; break;
			default : rain_index = 3; break;
		}
		System.out.println("rainindex : "+rain);
		if(temp>=0){
			switch((int)temp/10){
				case 0: temp_index = 1; break;
				case 1: temp_index = 2; break;
				case 2: temp_index = 3; break;
				default : temp_index = 4; break;
			}
		}else{
			temp_index = 0;
		}
		List<Integer> cateNums = new ArrayList<>(); 
		
		int[][] rain_category ={
				{101,104,105,106,120,123,128,131,132,133},	//0%~29%
				{101,120,121,122,123,131,133},				//30%~49%
				{102,103,122,123,128,129,130,133},			//50%~69%
				{102,103,123,128,129,130,133}				//70%~100%
				};
		
		int[][] temp_category ={
				{103,123,122,128,129,131,132},					//~-1
				{101,102,103,104,106,120,123,128,129,131,133},	//0~9
				{101,102,104,105,106,122,123,130,131,133},		//10~19
				{101,102,106,120,122,123,130,131,},				//20~29
				{120,121,122,123,131,132},						//30~
				};
		for(int i = 0; i<rain_category[rain_index].length;i++){
			for(int j = 0; j<temp_category[temp_index].length;j++){
				if(rain_category[rain_index][i]==temp_category[temp_index][j]){
					cateNums.add(rain_category[rain_index][i]);
				}
			}
		}
		int catenum = 0;
		if(cateNums!=null){
			System.out.println(cateNums);
			int random_index = (int) (Math.random()*(cateNums.size()-1));
			System.out.println(cateNums.get(random_index));
			catenum = cateNums.get(random_index);
		}else{
			if(month>=3 && month<=5){
				catenum = 33;
			}else if(month>=6 && month<=8){
				catenum = 34;
			}else if(month>=9 && month<=11){
				catenum = 35;
			}else{
				catenum = 36;
			}
		}
		
		
		Division cate = dbPro.getDivision4(catenum);
		
		System.out.println(cate.toString());
		System.out.println(cate.getDivision_num());
		System.out.println(cate.getDivision_name());
		System.out.println(weather.get(city));
		
		model.addAttribute("hour", hour);
		model.addAttribute("city", city);
		model.addAttribute("weather", weather.get(city));
		model.addAttribute("category", cate);
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
