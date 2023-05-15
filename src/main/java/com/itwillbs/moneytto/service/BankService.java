package com.itwillbs.moneytto.service;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BankService {
//	private final AccessTokenRepository accessTokenRepository;
//	private final AccountInfoRepository accountInfoRepository;
//
//	@Value("${openapi.client_id}")
//	String clientId;
//
//	@Value("${openapi.client_secret}")
//	String clientSecret;
//
//	@Value("${openapi.agent_code}")
//	String agentCode;
//
//	@Transactional
//	public void requestOpenApiAccessToken() {
//		RestTemplate rest = new RestTemplate();
//
//		URI uri = URI.create("https://testapi.openbanking.or.kr/oauth/2.0/token");
//
//		HttpHeaders headers = new HttpHeaders();
//		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
//		headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
//
//		MultiValueMap<String, String> param = new LinkedMultiValueMap<>();
//		param.add("client_id", clientId);
//		param.add("client_secret", clientSecret);
//		param.add("scope", "oob");
//		param.add("grant_type", "client_credentials");
//
//		String now = LocalDateTime.now(ZoneId.of("Asia/Seoul")).toString();
//
//		if (accessTokenRepository.findFirstByExpireDateAfter(now).isEmpty()) {
//			OpenApiAccessTokenDto newAccessTokenRes;
//			try {
//				newAccessTokenRes = rest.postForObject(
//						uri,
//						new HttpEntity<>(param, headers),
//						OpenApiAccessTokenDto.class
//				);
//			} catch (Exception e) {
//				throw new BussinessException(e.getMessage());
//			}
//			accessTokenRepository.save(newAccessTokenRes.toEntity());
//		}
//	}
//	
}
