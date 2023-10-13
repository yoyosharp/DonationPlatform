package com.fx23121.DonationPlatform.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;

@Controller
public class HomeController {

    //first time access to the website will show the public home page
    //user must login to use the functions
    @RequestMapping("/")
    public String showHome() {
        return "public/home";
    }
}
