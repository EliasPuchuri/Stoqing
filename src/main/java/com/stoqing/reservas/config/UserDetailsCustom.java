package com.stoqing.reservas.config;

import com.stoqing.reservas.entities.model.Operario;
import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

@Getter
public class UserDetailsCustom implements UserDetails {
    private final Operario operario;

    public UserDetailsCustom(Operario operario) {
        this.operario = operario;
    }

    @Override
    public String getUsername() {
        return operario.getDni();
    }

    @Override
    public String getPassword() {
        return operario.getContrasena();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority("OPERARIO"));
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }
}
