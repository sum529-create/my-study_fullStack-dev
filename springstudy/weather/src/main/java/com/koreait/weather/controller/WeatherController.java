package com.koreait.weather.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.weather.command.WeatherCommand;

@Controller
public class WeatherController {
	@RequestMapping(value="/", method=RequestMethod.GET)
    public String index() {
        return "index";

    }

    @RequestMapping(value="getWeather.do", method=RequestMethod.GET, produces="application/xml; charset=utf-8")
    @ResponseBody

    public String getWeather() {

        // 문제. getWeather() 메소드 내부를 구현하시오.
    	WeatherCommand weatherCommand = new WeatherCommand();
    	return weatherCommand.execute();
    }
}
