package com.fx23121.DonationPlatform.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping("/logout")
    public String logOut() {
        return "login";
    }
}
