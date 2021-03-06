package site.awsomekingmoon.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import site.awsomekingmoon.domain.Criteria;
import site.awsomekingmoon.domain.MemberVo;
import site.awsomekingmoon.mapper.MemberMapper;


/**
 * @author 박영준, 김문수
 * MemberServiceImpl
 */
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{
	private MemberMapper memberMapper;
	@Autowired @Setter @Qualifier("BCryptPasswordEncoder")
	private PasswordEncoder encoder;
	
	/**
	 * @author 박영준
	 * 회원가입
	 */
	@Override
	public void register(Map<String, Object> map) {
		
		map.put("pw", encoder.encode((CharSequence) map.get("pw")));
		map.put("auth", "ROLE_USER");
		
		memberMapper.insertMember(map);
		memberMapper.insertAuth(map);
	}
	
	/**
	 * @author 박영준
	 * 회원정보 불러오기
	 */
	@Override
	public MemberVo get(String id) {
		
		return memberMapper.read(id);
	}
	
	/**
	 * @author 박영준
	 * 회원정보 수정
	 */
	@Override
	public boolean modify(Map<String, Object> map) {
		
		boolean result1 = memberMapper.modifyChild(map) > 0;
		System.out.println(result1);
		boolean result2 = memberMapper.modify(map) > 0;
		System.out.println(result2);
		
		
		if(result1 && result2) {
			System.out.println("success");
		}
		return true;
	}

	/**
	 * @author 박영준
	 * 핸드폰 문자 보내기
	 */
	@Override
	public void sendMessage(Map<String, Object> map) {
		String api_key = "NCSV8TA8UBDV59TA";
	    String api_secret = "6LZQGMHESHF05RECR4LOJBLZ5ZYYZSP8";
	    Message coolsms = new Message(api_key, api_secret);
		
		 HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", (String) map.get("phone"));
		    params.put("from", "07080651405");
		    params.put("type", "SMS");
		    params.put("text", "[휴먼커뮤니티] 인증번호 [" + (String) map.get("authKey") + "] 입니다.");
		    params.put("app_version", "test app 1.2"); // application name and version

		    try {
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      System.out.println(obj.toString());
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		    }
	}
	
	/**
	 * @author 박영준
	 * 랜덤 인증번호 생성 
	 */
	@Override
	public String createKey() {
		String key = "";		
		for(int i = 1 ; i <= 6 ; i++) {
			
			int r = (int)(Math.random() * 3) + 1;
			if(r==1) { 
				key += (int)(Math.random() * 10) + "";	
			} else if(r==2) {      
				up : while(true) {
					int upCase = (int)(Math.random() * 90) + 1;
					if(upCase >= 'A') {
						key += "" + (char)upCase;
						break up;
					} else {
						continue up;
					}	
				}
			} else {      
				low : while(true) {
					int lowCase = (int)(Math.random() * 122) + 1;
					if(lowCase >= 'a') {
						key += "" + (char)lowCase;
						break low;
					} else {
						continue low;
					}	
				}								
			}
		} return key;
	}
	
	/**
	 * @author 박영준
	 * 핸드폰 인증번호, 핸드폰 번호, 만료시간 DB저장
	 */
	@Override
	public void insertAuthPhone(Map<String, Object> map) {
		
		memberMapper.insertAuthPhone(map);
	}
	
	/**
	 * @author 박영준
	 * 핸드폰 인증번호 확인
	 */
	@Override
	public boolean confirmAuth(Map<String, Object> map) {
		if(memberMapper.confirmAuth(map) == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * @author 박영준
	 * 회원 탈퇴
	 */
	@Override
	public void withdraw(String id) {
		memberMapper.withdrawAuth(id);
		memberMapper.withdraw(id);
	}
	
	/**
	 * @author 김문수
	 * admin용 회원 조회
	 */
	@Override
	public List<MemberVo> memberList(Criteria cri) {
		return memberMapper.memberListWithPaging(cri);
	}
	/**
	 * @author 김문수
	 * 회원 수 조회
	 */
	@Override
	public int memberCount(Criteria cri) {
		return memberMapper.getMemberCount(cri);
	}
	
}
