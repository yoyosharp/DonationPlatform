package com.fx23121.DonationPlatform.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/")
public class HomeController {

    public String showHome() {
        return "admin/home";
    }
}
