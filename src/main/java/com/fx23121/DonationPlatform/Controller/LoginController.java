package com.fx23121.DonationPlatform.Controller;


import com.fx23121.DonationPlatform.Entity.User;
import com.fx23121.DonationPlatform.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String logIn() {
        return "login";
    }

    @PostMapping("/userLogin")
    public String userLogin(HttpServletRequest request, Model model) {
        //get fields for user email and user password from login form
    String userEmail = request.getParameter("email");
    String userPassword = request.getParameter("password");
    //retrieve user from database
    User currentUser = userService.getUserByEmailAndPassword(userEmail, userPassword);
        System.out.println(currentUser);
    if (currentUser == null) return "redirect:login?error=true";
    if (currentUser.getRoleId().getId() == 1) return "admin/home";
    else return "public/home";
    }

    @RequestMapping("/logout")
    public String logOut() {
        return "public/home";
    }
}
