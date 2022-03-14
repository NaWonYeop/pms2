package co.test.prj.security;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class SampleUser implements UserDetails
{

	public SampleUser(String username, String user_pwd, List<GrantedAuthority> auth)
	{
		// TODO Auto-generated constructor stub
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities()
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getPassword()
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getUsername()
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isAccountNonExpired()
	{
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isAccountNonLocked()
	{
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isCredentialsNonExpired()
	{
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isEnabled()
	{
		// TODO Auto-generated method stub
		return false;
	}

}
