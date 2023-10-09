package com.fx23121.DonationPlatform.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

    @RequestMapping("/")
    public String showHome() {
        return "public/login";
    }
}
