package com.fx23121.DonationPlatform.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String showHome() {
        return "redirect: public/home";
    }
}
