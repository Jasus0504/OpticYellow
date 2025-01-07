package com.peachmarket.opticyellow.AirQuality.Controller;


import java.awt.Graphics2D;    
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.peachmarket.opticyellow.AirQuality.Service.AirQualityService;

 
/**
 * Handles requests for the application home page.
 */

@Slf4j
@Controller
public class AirQualityRestController {
	
	@Autowired
	AirQualityService service;
	
	@Autowired
	ServletContext sContext;
	
	@RequestMapping(value = "/json_aq_selectAll.do", method = RequestMethod.GET)
    public String json_aq_selectAll() {
        log.info("/json_aq_selectAll.do..");
     
        return "AirQuality/AirQuality";
    }
	
	@RequestMapping(value = "/SeoulAirQuality.do", method = RequestMethod.GET)
    public String SeoulAirQuality() {
        log.info("/json_aq_selectAll.do..");
     
        return "AirQuality/SeoulAirQuality";
    }
}

	

