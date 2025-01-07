package com.peachmarket.opticyellow.kakaopay.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.peachmarket.opticyellow.interceptor.MySecured;
import com.peachmarket.opticyellow.interceptor.Role;
import com.peachmarket.opticyellow.kakaopay.model.KakaoPayApproveVO;
import com.peachmarket.opticyellow.kakaopay.model.KakaoPayReadyVO;
import com.peachmarket.opticyellow.kakaopay.service.KakaoPayService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class KakaoPayController {
	
	@Autowired
	KakaoPayService service;
	
	@Autowired
	HttpSession session;
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/kakao_cash_ready.do", method = RequestMethod.GET)
	public String kakao_cash_ready(Model model) {
		log.info("/kakao_cash_ready.do...");
		
		KakaoPayApproveVO vo = new KakaoPayApproveVO();
		vo.setM_id((String)session.getAttribute("user_id"));
		
		KakaoPayApproveVO cash = service.selectCash(vo);
		
		model.addAttribute("cash",cash);
		
		return "kakaoPay/cash_ready";
		
	} // end kakao_cash...
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/kakao_cash_success.do", method = RequestMethod.GET)
	public String kakao_cash_success(HttpServletRequest request, Model model) {
		log.info("/kakao_cash_success.do...");
		
		KakaoPayApproveVO vo = new KakaoPayApproveVO();
		vo.setM_id((String)session.getAttribute("user_id"));
		
		// 보유중인 캐시 업데이트 = 기존 캐시 + 충전 캐시
		int result = service.updateCash(vo);
		log.info("result:{}",result);
		
		// 현재 결제한 캐시 정보 가져와서 JSP에 전달
		KakaoPayApproveVO cash = service.selectSuccess();
		log.info("{}",cash);
		
		model.addAttribute("cash",cash);
		
		return "kakaoPay/cash_success";
		
	} // end kakao_cash_success...
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/kakaoPayApprove.do", method = RequestMethod.GET)
	public String kakaoPayApprove(HttpServletRequest request) {
		log.info("/kakaoPayApprove.do...");
		
		String pgToken = request.getParameter("pg_token");
		log.info("{}",pgToken);
		
		KakaoPayReadyVO vo = service.selectTid();
		
		KakaoPayApproveVO response = new KakaoPayApproveVO();
		
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/approve");
			try {
				HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
				urlConnection.setRequestMethod("POST");
				urlConnection.setRequestProperty("Authorization", "KakaoAK 82aef8b52b318811018287603cd5360e");
				urlConnection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
				urlConnection.setDoOutput(true);
				
				String parameter = "cid=TC0ONETIME&tid=" + vo.getTid()
						+ "&partner_order_id=partner_order_id&partner_user_id=partner_user_id&"
						+ "pg_token=" + pgToken;
				OutputStream outPut = urlConnection.getOutputStream();
				
				// 데이터 전송 > 데이터를 바이트로 전환해서 전송해야함
				DataOutputStream dataOutput = new DataOutputStream(outPut);
				
				// 바이트로 형변환해서 작성해줌, 한글 출력 = 캐릭터타입을 UTF-8로 지정
				dataOutput.write(parameter.getBytes("UTF-8"));
				
				// close 실행 > flush가 자동 호출되어 데이터 전송
				dataOutput.close();
				
				int resultCode = urlConnection.getResponseCode();
				
				// InputStream은 받기만 가능
				InputStream input;
				
				// http 코드에서 정상적인 통신은 200, 이외에 숫자는 모두 에러
				if(resultCode == 200) {
					input = urlConnection.getInputStream();
				} else {
					input = urlConnection.getErrorStream();
				}
				
				// 받은 정보를 읽기
				InputStreamReader inputReader = new InputStreamReader(input,"UTF-8");
				
				// BufferedReader가 읽고 자동으로 형변환 해줌
				BufferedReader bfReader = new BufferedReader(inputReader);
				String json = bfReader.readLine();
				log.info(json);
				
				// ObjectMapper는 JSON 데이터를 Java 객체로 변환하거나, Java 객체를 JSON 데이터로 변환하는 기능을 제공
				ObjectMapper mapper = new ObjectMapper();
				
				// JSON 데이터를 파싱한 후에는 JsonNode 객체를 통해 데이터에 접근, 조작 가능
				JsonNode jsonNode = mapper.readTree(json);
				JsonNode amountNode = jsonNode.get("amount");
				
				response.setTid(jsonNode.get("tid").asText());
				response.setAid(jsonNode.get("aid").asText());
				response.setCid(jsonNode.get("cid").asText());
				response.setAmount_total(amountNode.get("total").asInt());
				response.setAmount_point(amountNode.get("point").asInt());
				response.setQuantity(jsonNode.get("quantity").asInt());
				response.setItem_name(jsonNode.get("item_name").asText());
				response.setCreated_at(jsonNode.get("created_at").asText());
				response.setApproved_at(jsonNode.get("approved_at").asText());
				response.setPartner_order_id(jsonNode.get("partner_order_id").asText());
				response.setPartner_user_id(jsonNode.get("partner_user_id").asText());
				response.setPayment_method_type(jsonNode.get("payment_method_type").asText());
				
				log.info("{}",response);
				
				// 결제 성공 > 결제정보 DB에 업데이트
				int result = service.updateSuccess(response);
				
				//본인매치를 볼 수 있는 페이지로 이동 하도록(마이페이지)
				return "redirect:g_selectAll.do";
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		
		return "game/g_selectAll";
		
	} // end kakaoPayApprove...
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/co_kakaoPayApprove.do", method = RequestMethod.GET)
	public String co_kakaoPayApprove(HttpServletRequest request) {
		log.info("/co_kakaoPayApprove.do...");
		
		String pgToken = request.getParameter("pg_token");
		log.info("{}",pgToken);
		
		KakaoPayReadyVO vo = service.selectTid();
		
		KakaoPayApproveVO response = new KakaoPayApproveVO();
		
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/approve");
			try {
				HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
				urlConnection.setRequestMethod("POST");
				urlConnection.setRequestProperty("Authorization", "KakaoAK 82aef8b52b318811018287603cd5360e");
				urlConnection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
				urlConnection.setDoOutput(true);
				
				String parameter = "cid=TC0ONETIME&tid=" + vo.getTid()
						+ "&partner_order_id=partner_order_id&partner_user_id=partner_user_id&"
						+ "pg_token=" + pgToken;
				OutputStream outPut = urlConnection.getOutputStream();
				
				// 데이터 전송 > 데이터를 바이트로 전환해서 전송해야함
				DataOutputStream dataOutput = new DataOutputStream(outPut);
				
				// 바이트로 형변환해서 작성해줌, 한글 출력 = 캐릭터타입을 UTF-8로 지정
				dataOutput.write(parameter.getBytes("UTF-8"));
				
				// close 실행 > flush가 자동 호출되어 데이터 전송
				dataOutput.close();
				
				int resultCode = urlConnection.getResponseCode();
				
				// InputStream은 받기만 가능
				InputStream input;
				
				// http 코드에서 정상적인 통신은 200, 이외에 숫자는 모두 에러
				if(resultCode == 200) {
					input = urlConnection.getInputStream();
				} else {
					input = urlConnection.getErrorStream();
				}
				
				// 받은 정보를 읽기
				InputStreamReader inputReader = new InputStreamReader(input,"UTF-8");
				
				// BufferedReader가 읽고 자동으로 형변환 해줌
				BufferedReader bfReader = new BufferedReader(inputReader);
				String json = bfReader.readLine();
				log.info(json);
				
				// ObjectMapper는 JSON 데이터를 Java 객체로 변환하거나, Java 객체를 JSON 데이터로 변환하는 기능을 제공
				ObjectMapper mapper = new ObjectMapper();
				
				// JSON 데이터를 파싱한 후에는 JsonNode 객체를 통해 데이터에 접근, 조작 가능
				JsonNode jsonNode = mapper.readTree(json);
				JsonNode amountNode = jsonNode.get("amount");
				
				response.setTid(jsonNode.get("tid").asText());
				response.setAid(jsonNode.get("aid").asText());
				response.setCid(jsonNode.get("cid").asText());
				response.setAmount_total(amountNode.get("total").asInt());
				response.setAmount_point(amountNode.get("point").asInt());
				response.setQuantity(jsonNode.get("quantity").asInt());
				response.setItem_name(jsonNode.get("item_name").asText());
				response.setCreated_at(jsonNode.get("created_at").asText());
				response.setApproved_at(jsonNode.get("approved_at").asText());
				response.setPartner_order_id(jsonNode.get("partner_order_id").asText());
				response.setPartner_user_id(jsonNode.get("partner_user_id").asText());
				response.setPayment_method_type(jsonNode.get("payment_method_type").asText());
				
				log.info("{}",response);
				
				// 결제 성공 > 결제정보 DB에 업데이트
				int result = service.updateSuccess(response);
				
				return "redirect:reserve_success.do";
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		
		return "court_reserve/courtSelectAll";
		
	} // end co_kakaoPayApprove...
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/reserve_success.do", method = RequestMethod.GET)
	public String reserve_success(HttpServletRequest request, Model model) {
		log.info("/reserve_success.do...");
		
		return "court_reserve/pay_success";
		
	} // end reserve_success...
}
