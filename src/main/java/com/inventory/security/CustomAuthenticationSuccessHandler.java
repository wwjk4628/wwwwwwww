package com.inventory.security;

import java.io.IOException;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
            throws IOException, ServletException {
        String targetUrl = determineTargetUrl(authentication);
        response.sendRedirect(request.getContextPath()+targetUrl);
    }

    protected String determineTargetUrl(Authentication authentication) {
        boolean isAdmin = AuthorityUtils.authorityListToSet(authentication.getAuthorities()).contains("ROLE_ADMIN");
        boolean isUser = AuthorityUtils.authorityListToSet(authentication.getAuthorities()).contains("ROLE_USER");

        if (isAdmin) {
            return "/admin";
        } else if (isUser) {
            return "/branch/inventory";
        } else {
            throw new IllegalStateException();
        }
    }
}
