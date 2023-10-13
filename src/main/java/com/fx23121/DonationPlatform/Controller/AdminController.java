package com.fx23121.DonationPlatform.Controller;


import com.fx23121.DonationPlatform.Entity.User;
import com.fx23121.DonationPlatform.Service.DonationService;
import com.fx23121.DonationPlatform.Service.RoleService;
import com.fx23121.DonationPlatform.Service.UserDonationService;
import com.fx23121.DonationPlatform.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    //Inject Services
    @Autowired
    private UserService userService;
    @Autowired
    private DonationService donationService;
    @Autowired
    private UserDonationService userDonationService;
    @Autowired
    private RoleService roleService;

    @RequestMapping("/account")
    public String showAccountPage(Model model) {
        //adding object user to model
        model.addAttribute("toAddUser", new User());
        //retrieve user list
        List<User> userList = userService.getUsers();
        model.addAttribute("userList", userList);
        for (User user: userList) {
            System.out.println(user);
        }
        return "admin/account";
    }

    @RequestMapping("/donation")
    public String showDonations( Model model) {
        //Pass the current user to the next page
        return "admin/donation";
    }

    //    addUser
    @PostMapping("/addUser")
    public String addUser(@Valid @ModelAttribute("toAddUser") User user,
                          BindingResult result,
                          Model model){
        if (result.hasErrors()) {
            model.addAttribute("error", "true");
            return "admin/account";
        }
        user.setNote("Created by add user method");
        user.setStatus(1);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        user.setCreatedAt(formatter.format(LocalDateTime.now()));
        userService.addUser(user);
        return "admin/successAddUser";
    }
}
