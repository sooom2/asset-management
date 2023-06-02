package com.itwillbs.moneytto.generator;

import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

// 개발자가 작성한 클래스를 다른 클래스 내에서 사용하기 위해
// 스프링 Bean 으로 등록하기 위한 어노테이션 : @Component
@Component
public class BankValueGenerator {
	
	@Value("${client_use_code}")
	private String client_use_code; // 이용기관코드
	
	// 거래 고유번호 자동 생성 - getBankTranId()
	// 이용기관코드(10자리) + 생성주체구분코드("U") + 이용기관부여번호(9자리) = 20자리
	// => 이용기관 부여번호(9자리) 는 UUID 또는 SecureRandom 클래스 활용
	public String getBankTranId() {
		String bank_tran_id = "";
		
		// UUID 의 값 중 맨 뒷자리에서 9자리 추출
		String uuid = UUID.randomUUID().toString();
//		System.out.println("UUID : " + uuid);
		// UUID 의 값을 "-" 문자열 기준 분리 후 4번(마지막 인덱스) 문자열의 0번부터 9개 추출
//		System.out.println("UUID.substring(24, 33) : " + uuid.substring(24, 33).toUpperCase());
//		System.out.println("UUID.split() : " + uuid.split("-")[4].substring(0, 9).toUpperCase());
		
		// UUID 의 값을 UUID 총길이 - 9 부터 끝까지 추출(마지막에서부터 9자리 추출)
//		System.out.println("UUID.substring() : " + uuid.substring(uuid.length() - 9).toUpperCase());
		
		// 거래번호 생성
//		bank_tran_id = client_use_code + "U" + uuid.substring(uuid.length() - 9).toUpperCase();
		// ---------------------------------------------------------------------------------------
		// 0 ~ 999999999 난수 추출
		SecureRandom sr = new SecureRandom();
		int rNum = sr.nextInt(1000000000);
//		System.out.println("SecureRandom.nextInt(1000000000) : " + rNum); 
		// => 단, 9자리보다 적은 숫자는 9자리 난수로 활용 불가능하므로 문자열 처리 추가 필요
		// => 추출된 난수를 String 클래스의 format() 메서드를 통해 9자리 문자열로 고정
		//    (부족한 자릿수는 0으로 채우기)
//		System.out.println("SecureRandom(format()) : " + String.format("%09d", rNum)); 
		
		// 거래번호 생성
		bank_tran_id = client_use_code + "U" + String.format("%09d", rNum);
		System.out.println("bank_tran_id : " + bank_tran_id);
		
		return bank_tran_id;
	}
	
	// 거래 시간을 현재 시스템 시각 기준으로 설정(날짜 포맷 변경 기능을 통해 yyyyMMddHHmmss 로 변경)
	public String getTranDTime() {
		// java.time.LocalDateTime 클래스를 활용하여 현재 시스템의 날짜 및 시각 가져오기
		LocalDateTime localDateTime = LocalDateTime.now(); 
		
		// java.time.DateTimeFormatter 클래스를 활용하여 날짜 및 시각 포맷 변경
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
		
		String now = localDateTime.format(dateTimeFormatter);
		System.out.println("now : " + now);
		
		return now;
	}
}















