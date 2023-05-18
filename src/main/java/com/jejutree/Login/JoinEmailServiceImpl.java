package com.jejutree.Login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.jejutree.user_model.UserDAO;
import com.jejutree.user_model.UserDTO;

@Service
public class JoinEmailServiceImpl implements JoinEmailService {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	JavaMailSender MailSender;

	@Override
	public int updateMailKey(UserDTO userDTO) throws Exception {
		return userDAO.updateMailKey(userDTO);
	}

	@Override
	public int updateMailAuth(UserDTO userDTO) throws Exception {
		return userDAO.updateMailAuth(userDTO);
	}

	@Override
	public int emailAuthFail(String id) throws Exception {
		return userDAO.emailAuthFail(id);
	}

	@Override
	public int insertUser(UserDTO userDTO) throws Exception {
		//랜덤 문자열을 생성해서 mail_key 컬럼에 넣어주기
        String mail_key = new TempKey().getKey(30,false); //랜덤키 길이 설정
        userDTO.setMailKey(mail_key);

        //회원가입
        userDAO.insertUser(userDTO);
        userDAO.updateMailKey(userDTO);

        //회원가입 완료하면 인증을 위한 이메일 발송
        MailHandller sendMail = new MailHandller(MailSender);
        sendMail.setSubject("[제주트리 인증메일 입니다.]"); //메일제목
        sendMail.setText(
                "<h1>제주트리 메일인증</h1>" +
                "<br>제주트리에 오신것을 환영합니다!" +
                "<br>아래 [이메일 인증 확인]을 눌러주세요." +
                "<br><a href='http://localhost:8585/model/registerEmail.go?user_email=" + userDTO.getUser_email() +
                "&mailKey=" + mail_key +
                "' target='_blank'>이메일 인증 확인</a>");
        sendMail.setFrom("jejutree1234@gmail.com", "제주트리");
        sendMail.setTo(userDTO.getUser_email());
        sendMail.send();
		return 1;
		
	}

}
