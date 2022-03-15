package co.test.prj.user.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Data
public class UserVO implements UserDetails{

	private int user_id;
	private String user_email;
	private String user_pwd;
	private String user_name;
	private int user_tel;
	private String user_ath;
	private String user_crr;
	private String user_age;
	private String user_job_ttl;
	private String user_job_cnt;
	private String user_type;
	private String app_stt;
	private int app_id;
	private String tech_name;
	private double avg;
	private String tm_dept;
	private Date user_j_date;
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities()
	{
		List<GrantedAuthority> auth = new ArrayList<>();
		auth.add(new SimpleGrantedAuthority("ROLE_"+this.getUser_ath().toUpperCase()));
		return auth;
	}
	@Override
	public String getPassword()
	{
		// TODO Auto-generated method stub
		return user_pwd;
	}
	@Override
	public String getUsername()
	{
		// TODO Auto-generated method stub
		return user_email;
	}
	@Override
	public boolean isAccountNonExpired()
	{
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked()
	{
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired()
	{
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled()
	{
		// TODO Auto-generated method stub
		return true;
	}
}
