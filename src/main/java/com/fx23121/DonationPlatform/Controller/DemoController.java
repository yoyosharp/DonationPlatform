package com.fx23121.DonationPlatform.Controller;

import com.fx23121.DonationPlatform.Entity.User;
import com.fx23121.DonationPlatform.Demo.testDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DemoController {

    @Autowired
    private testDAO testDAO;

    @RequestMapping("/demo")
    public String demo(Model model){

        User user = testDAO.getUser(1);
        model.addAttribute("user", user);
        return "home";
    }
}
