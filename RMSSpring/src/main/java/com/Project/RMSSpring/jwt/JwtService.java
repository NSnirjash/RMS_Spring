package com.Project.RMSSpring.jwt;

import com.Project.RMSSpring.repository.TokenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JwtService {

    @Autowired
    private TokenRepository tokenRepository;

    private final String SECRERT_KEY = "WY4GyiH?WeA!OZu:onAj{ZetbP%>Qo:9{^03gMrRpzQ7[jeixqAj~f0TsPTiw2E";
}
