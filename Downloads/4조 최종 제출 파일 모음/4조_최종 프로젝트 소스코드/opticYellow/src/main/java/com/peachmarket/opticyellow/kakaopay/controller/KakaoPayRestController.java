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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peachmarket.opticyellow.interceptor.MySecured;
import com.peachmarket.opticyellow.interceptor.Role;
import com.peachmarket.opticyellow.kakaopay.model.KakaoPayApproveVO;
import com.peachmarket.opticyellow.kakaopay.model.KakaoPayReadyVO;
import com.peachmarket.opticyellow.kakaopay.service.KakaoPayService;
import com.peachmarket.opticyellow.member.model.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class KakaoPayRestController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	KakaoPayService service;
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/rest_kakaoPayReady.do", method = RequestMethod.POST)
	@ResponseBody
	public String rest_kakaoPayReady(int total_cash) {
		log.info("/rest_kakaoPayReady.do...");
		
		KakaoPayReadyVO response = new KakaoPayReadyVO();
		
		String total_amount = String.valueOf(total_cash);
		
		try {
			// 전송할 주소 저장
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			try {
				// 전송할 주소(url)와 서버 연결
				HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
				// header 요청사항
				urlConnection.setRequestMethod("POST");
				urlConnection.setRequestProperty("Authorization", "KakaoAK 82aef8b52b318811018287603cd5360e");
				urlConnection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
				urlConnection.setDoOutput(true);
				
				// body 요청사항
				String parameter = "cid=TC0ONETIME&partner_order_id=partner_order_id&"
						+ "partner_user_id=partner_user_id&item_name=캐시충전&quantity=1&"
						+ "total_amount="+total_amount+"&tax_free_amount=0&"
						+ "approval_url=http://101.79.10.1:8080/opticyellow/kakaoPayApprove.do&"
						+ "cancel_url=http://101.79.10.1:8080/opticyellow/kakao_cash_ready.do&"
						+ "fail_url=http://101.79.10.1:8080/opticyellow/kakao_cash_ready.do";
				
				// OutputStream은 전송만 가능
				OutputStream outPut = urlConnection.getOutputStream();
				
				// 데이터 전송 > 데이터를 바이트로 전환해서 전송해야함
				DataOutputStream dataOutput = new DataOutputStream(outPut);
				
				// 바이트로 형변환해서 작성해줌, 한글 출력 = 캐릭터타입을 UTF-8로 지정
				dataOutput.write(parameter.getBytes("UTF-8"));
				
				// close 실행 > flush가 자동 호출되어 데이터 전송
				dataOutput.close();
				
				int resultCode = urlConnection.getResponseCode();
				log.info("{}",resultCode);
				
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
				
				ObjectMapper mapper = new ObjectMapper();
				
				try {
					JsonNode jsonNode = mapper.readTree(json);
					
					response.setTid(jsonNode.get("tid").asText());
					response.setNext_redirect_pc_url(jsonNode.get("next_redirect_pc_url").asText());
					// m_id 저장
					response.setM_id((String)session.getAttribute("user_id"));
					
					service.insertTid(response);
					
					return json;
					
				} catch (JsonProcessingException e) {
					 e.printStackTrace();
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		
		return "failed";
		
	} // end rest_kakaoPayReady...
	
	@RequestMapping(value = "/json_cashList.do", method = RequestMethod.POST)
	@ResponseBody
	public List<KakaoPayApproveVO> json_cashList() {
		log.info("/json_cashList.do...");
		
		KakaoPayApproveVO vo = new KakaoPayApproveVO();
		vo.setM_id((String)session.getAttribute("user_id"));
		
		List<KakaoPayApproveVO> vos = service.cashList(vo);
		
		return vos;
	} // end json_cashList......
	
	//효림
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/game_kakaoPayReady.do", method = RequestMethod.POST)
	@ResponseBody
	public String game_kakaoPayReady(int total_amount, String item_name) {
		log.info("/game_kakaoPayReady.do...");
		
		KakaoPayReadyVO response = new KakaoPayReadyVO();
		
		try {
			// 전송할 주소 저장
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			try {
				// 전송할 주소(url)와 서버 연결
				HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
				// header 요청사항
				urlConnection.setRequestMethod("POST");
				urlConnection.setRequestProperty("Authorization", "KakaoAK 82aef8b52b318811018287603cd5360e");
				urlConnection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
				urlConnection.setDoOutput(true);
				
				// body 요청사항
				String parameter = "cid=TC0ONETIME&partner_order_id=partner_order_id&"
						+ "partner_user_id=partner_user_id&item_name="+item_name+"&quantity=1&"
						+ "total_amount="+total_amount+"&tax_free_amount=0&"
						+ "approval_url=http://101.79.10.1:8080/opticyellow/kakaoPayApprove.do&"
						+ "cancel_url=http://101.79.10.1:8080/opticyellow/g_selectAll.do&"
						+ "fail_url=http://101.79.10.1:8080/opticyellow/g_selectAll.do";
				
				// OutputStream은 전송만 가능
				OutputStream outPut = urlConnection.getOutputStream();
				
				// 데이터 전송 > 데이터를 바이트로 전환해서 전송해야함
				DataOutputStream dataOutput = new DataOutputStream(outPut);
				
				// 바이트로 형변환해서 작성해줌, 한글 출력 = 캐릭터타입을 UTF-8로 지정
				dataOutput.write(parameter.getBytes("UTF-8"));
				
				// close 실행 > flush가 자동 호출되어 데이터 전송
				dataOutput.close();
				
				int resultCode = urlConnection.getResponseCode();
				log.info("{}",resultCode);
				
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
				
				ObjectMapper mapper = new ObjectMapper();
				
				try {
					JsonNode jsonNode = mapper.readTree(json);
					
					response.setTid(jsonNode.get("tid").asText());
					response.setNext_redirect_pc_url(jsonNode.get("next_redirect_pc_url").asText());
					// m_id 저장
					response.setM_id((String)session.getAttribute("user_id"));
					
					service.insertTid(response);
					
					return json;
					
				} catch (JsonProcessingException e) {
					 e.printStackTrace();
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		
		return "failed";
		
	} // end rest_kakaoPayReady...
	
	// 병엽님 코드
	@RequestMapping(value = "/rest_courtfee_kakaoPayReady.do", method = RequestMethod.POST)
	@ResponseBody
	public String rest_courtfee_kakaoPayReady(int total_amount, String item_name) {
		log.info("/rest_courtfee_kakaoPayReady.do...");
		
		KakaoPayReadyVO response = new KakaoPayReadyVO();
		
		try {
			// 전송할 주소 저장
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			try {
				// 전송할 주소(url)와 서버 연결
				HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
				// header 요청사항
				urlConnection.setRequestMethod("POST");
				urlConnection.setRequestProperty("Authorization", "KakaoAK 82aef8b52b318811018287603cd5360e");
				urlConnection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
				urlConnection.setDoOutput(true);
				
				// body 요청사항
				String parameter = "cid=TC0ONETIME&partner_order_id=partner_order_id&"
						+ "partner_user_id=partner_user_id&item_name="+item_name+"&quantity=1&"
						+ "total_amount="+total_amount+"&tax_free_amount=0&"
						+ "approval_url=http://101.79.10.1:8080/opticyellow/co_kakaoPayApprove.do&"
						+ "cancel_url=http://101.79.10.1:8080/opticyellow/court_selectAll.do&"
						+ "fail_url=http://101.79.10.1:8080/opticyellow/court_selectAll.do";
				
				// OutputStream은 전송만 가능
				OutputStream outPut = urlConnection.getOutputStream();
				
				// 데이터 전송 > 데이터를 바이트로 전환해서 전송해야함
				DataOutputStream dataOutput = new DataOutputStream(outPut);
				
				// 바이트로 형변환해서 작성해줌, 한글 출력 = 캐릭터타입을 UTF-8로 지정
				dataOutput.write(parameter.getBytes("UTF-8"));
				
				// close 실행 > flush가 자동 호출되어 데이터 전송
				dataOutput.close();
				
				int resultCode = urlConnection.getResponseCode();
				log.info("{}",resultCode);
				
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
				
				ObjectMapper mapper = new ObjectMapper();
				
				try {
					JsonNode jsonNode = mapper.readTree(json);
					
					response.setTid(jsonNode.get("tid").asText());
					response.setNext_redirect_pc_url(jsonNode.get("next_redirect_pc_url").asText());
					// m_id 저장
					response.setM_id((String)session.getAttribute("user_id"));
					
					service.insertTid(response);
					
					return json;
					
				} catch (JsonProcessingException e) {
					 e.printStackTrace();
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		
		return "failed";
		
	} // end rest_courtfee_kakaoPayReady...
}
