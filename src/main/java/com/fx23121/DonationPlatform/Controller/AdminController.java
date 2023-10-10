package com.fx23121.DonationPlatform.Controller;

import com.fx23121.DonationPlatform.Entity.Donation;
import com.fx23121.DonationPlatform.Entity.User;
import com.fx23121.DonationPlatform.Service.DonationService;
import com.fx23121.DonationPlatform.Service.UserDonationService;
import com.fx23121.DonationPlatform.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private DonationService donationService;
    @Autowired
    private UserDonationService userDonationService;

    @RequestMapping("/home")
    public String showHomeAdmin(@RequestParam("currentUserId") int id, Model model) {
        System.out.println(id);
        User currentUser = userService.getUserById(id);
        System.out.println(currentUser);
        model.addAttribute("currentUser", currentUser);
        return "admin/home";
    }
    @RequestMapping("/logout")
    public String logOut() {
        return "./login";
    }

    @RequestMapping("/account")
    public String showAccounts(@RequestParam("currentUserId") int id, Model model) {
        System.out.println(id);
        User currentUser = userService.getUserById(id);
        System.out.println(currentUser);
        model.addAttribute("currentUser", currentUser);
        return "admin/account";
    }

    @RequestMapping("/donation")
    public String showDonations(@RequestParam("currentUserId") int id, Model model) {
        System.out.println(id);
        User currentUser = userService.getUserById(id);
        System.out.println(currentUser);
        model.addAttribute("currentUser", currentUser);
        return "admin/donation";
    }
}
