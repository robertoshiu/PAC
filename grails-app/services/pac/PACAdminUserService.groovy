package pac

import org.codehaus.groovy.grails.plugins.springsecurity.GormUserDetailsService
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.GrantedAuthorityImpl

class PACAdminUserService extends GormUserDetailsService {

	UserDetails loadUserByUsername(String username, boolean loadRoles) throws UsernameNotFoundException {

		def user = User.findWhere(username: username)
		if (!user) {
			log.warn "User not found: $username"
			throw new UsernameNotFoundException('User not found', username)
		} else {
			user.lastLogin = new Date()
			user.save(flush: true)
		}

			// println(user.createDate)
		Collection<GrantedAuthority> authorities = loadAuthorities(user, username, loadRoles)
		createUserDetails user, authorities
	}
}
