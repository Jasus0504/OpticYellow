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

import com.peachmarket.opticyellow.AirQuality.Service.AirQualityService;
import com.peachmarket.opticyellow.bid.model.BidVO;
import com.peachmarket.opticyellow.bid.service.BidService;
import com.peachmarket.opticyellow.confirm.model.ConfirmVO;
import com.peachmarket.opticyellow.product.model.ProductVO;
import com.peachmarket.opticyellow.product.service.ProductService;

import lombok.extern.slf4j.Slf4j;

 
/**
 * Handles requests for the application home page.
 */

@Slf4j
@Controller
public class AirQualityController {
	
	@Autowired
	AirQualityService service;
	
	@Autowired
	ServletContext sContext;
	
	

	

}
