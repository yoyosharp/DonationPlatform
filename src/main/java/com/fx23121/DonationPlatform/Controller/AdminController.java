package com.fx23121.DonationPlatform.Controller;

import com.fx23121.DonationPlatform.Entity.Donation;
import com.fx23121.DonationPlatform.Entity.Role;
import com.fx23121.DonationPlatform.Entity.User;
import com.fx23121.DonationPlatform.Service.DonationService;
import com.fx23121.DonationPlatform.Service.RoleService;
import com.fx23121.DonationPlatform.Service.UserDonationService;
import com.fx23121.DonationPlatform.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalTime;
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

    @RequestMapping("/home")
    public String showHomeAdmin(@RequestParam("currentUserId") int id, Model model) {
        //Pass the current user to the next page
        User currentUser = userService.getUserById(id);
        model.addAttribute("currentUser", currentUser);
        return "admin/home";
    }
    @RequestMapping("/logout")
    public String logOut() {
        return "./login";
    }

    @RequestMapping("/account")
    public String showAccounts(@RequestParam("currentUserId") int id,
                               Model model) {
        //Pass the current user to the next page
        User currentUser = userService.getUserById(id);
        model.addAttribute("currentUser", currentUser);
        //retrieve user list
        List<User> userList = userService.getUsers();
        model.addAttribute("userList", userList);
        return "admin/account";
    }

    @RequestMapping("/donation")
    public String showDonations(@RequestParam("currentUserId") int id, Model model) {
        //Pass the current user to the next page
        User currentUser = userService.getUserById(id);
        model.addAttribute("currentUser", currentUser);
        return "admin/donation";
    }

    //addUser
    @RequestMapping("/addUser")
    public String addUser(@RequestParam("fullName") String name,
                          @RequestParam("email") String email,
                          @RequestParam("phoneNumber") String phone,
                          @RequestParam("address") String address,
                          @RequestParam("userName") String userName,
                          @RequestParam("password") String password,
                          @RequestParam("roleId") int roleId,
                          Model model) {
        User newUser = new User(userName, password, name, address, email, phone,"","");
        newUser.setRoleID(roleService.getRole(roleId));
        newUser.setCreatedAt(String.valueOf(LocalTime.now()));
        userService.addUser(newUser);
        return "admin/account";
    }
}
