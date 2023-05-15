package com.itwillbs.moneytto.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.moneytto.service.BankService;
import com.itwillbs.moneytto.service.MainService;
@RequestMapping()
@RestController
public class BankController {
	
//	private final BankService bankService;
//	private final ResponseService responseService;
//	private final int FAIL = -1;
//	@Autowired
//	BankService bankService;
//	
//	public String getToken() {
//		bankService.requestOpenApiAccessToken();
//		List newsList = mainService.getNewsInfo();
//		model.addAttribute("newsList", newsList);
//		
//		return "main";
//	}
//	@PostMapping("/token")
//	@ApiOperation(value = "금융결제원 AccessToken 발급", notes = "만료되었다면 액세스 토큰을 새로 발급합니다.")
//	public CommonResult requestOpenApiAccessToken() {
//
//		try {
//			openApiService.requestOpenApiAccessToken();
//			return responseService.getSuccessResult();
//		} catch (Exception e) {
//			return responseService.getFailResult(
//					FAIL,
//					e.getMessage()
//			);
//		}
//	}
}
