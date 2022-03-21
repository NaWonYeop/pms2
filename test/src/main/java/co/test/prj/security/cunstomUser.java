package co.test.prj.security;

import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import co.test.prj.user.service.UserService;
import co.test.prj.user.service.UserVO;
import lombok.Setter;

@Service
public class cunstomUser implements UserDetailsService
{
	//@Setter(onMethod_ ={@Autowired} )
	@Autowired
	private UserService userDao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException
	{
		// TODO Auto-generated method stub
		UserVO vo= new UserVO();
	
		vo.setUser_email(username);
		vo=userDao.userSelect(vo);
		System.out.println("============================="+vo);
		if(vo==null) {
			throw new UsernameNotFoundException("no user");
		}
		return vo;
	}

	
}
