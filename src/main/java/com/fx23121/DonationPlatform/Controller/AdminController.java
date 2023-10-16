package com.fx23121.DonationPlatform.Controller;


import com.fx23121.DonationPlatform.Entity.Donation;
import com.fx23121.DonationPlatform.Entity.Role;
import com.fx23121.DonationPlatform.Entity.User;
import com.fx23121.DonationPlatform.SearchData;
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
    @Autowired
    private SearchData<User> userSearchData;

    @Autowired
    private SearchData<Donation> donationSearchData;

    private String stringQuery="";
    private int pageIndex = 1;
    private int pageSize = 5;

    @RequestMapping("/home")
    public String showHome() {
        return "admin/home";
    }

    @RequestMapping("/account")
    public String showAccountPage(Model model) {
        //retrieve users data
        SearchData<User> data = userService.getUserByFields(stringQuery, pageSize, pageIndex);
        //retrieve user list from search data
        List<User> users = data.getResultList();
        //retrieve max page count from search data
        int maxResultCount = data.getMaxResultCount();

        int maxPageCount = maxResultCount/pageSize;
        if (maxResultCount%pageSize != 0) maxPageCount++;

        //add user object to the model for add/update function
        model.addAttribute("user", new User());
        //add user list to the model for display/search function
        model.addAttribute("userList", users);
        //add maxPageCount to the model for display function
        model.addAttribute("maxPageCount", maxPageCount);
        //add pageIndex to the model for display/search function
        model.addAttribute("pageIndex", pageIndex);
        //add stringQuery to the model for search function
        model.addAttribute("stringQuery", stringQuery);
        //add pageSize to the model for display function
        model.addAttribute("display", pageSize);
        return "admin/account";
    }

    @RequestMapping(value = "/account", params = {"display", "page"} )
    public String showAccountPage(@RequestParam(value = "display", defaultValue = "5") int pageSize,
                                  @RequestParam(value = "page", defaultValue = "1") int pageIndex,
                                  Model model) {
        stringQuery = "";
        SearchData<User> data = userService.getUserByFields(stringQuery, pageSize, pageIndex);
        //retrieve user list from search data
        List<User> users = data.getResultList();
        //retrieve max page count from search data
        int maxResultCount = data.getMaxResultCount();

        this.pageSize = pageSize;
        int maxPageCount = maxResultCount/pageSize;
        if (maxResultCount%pageSize != 0) maxPageCount++;

        //add user object to the model for add/update function
        model.addAttribute("user", new User());
        //add user list to the model for display/search function
        model.addAttribute("userList", users);
        //add maxPageCount to the model for display function
        model.addAttribute("maxPageCount", maxPageCount);
        //add pageIndex to the model for display/search function
        model.addAttribute("pageIndex", pageIndex);
        //add stringQuery to the model for search function
        model.addAttribute("stringQuery", this.stringQuery);
        //add pageSize to the model for display function
        model.addAttribute("display", pageSize);
        return "admin/account";

    }

    //    addUser
    @PostMapping("/addUser")
    public String addUser(@RequestParam("roleID") int roleId,
                          @Valid @ModelAttribute("user") User user,
                          BindingResult result,
                          Model model){

        //if validator has error return the add user page
        if (result.hasErrors()) {
            model.addAttribute("user", user);
            return "admin/user-add-error";
        }

        //add metadata
        user.setNote("Created by add user method");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        user.setCreatedAt(formatter.format(LocalDateTime.now()));
        //add role
        Role role = roleService.getRole(roleId);
        user.setRoleId(role);
        user.setStatus(1);
        //save the user
        userService.addUser(user);
        return "admin/successAddUser";
    }

    @RequestMapping(value = "/searchUser")
    public String search(@RequestParam(name = "keyword", required = true) String stringQuery,
                         @RequestParam(name = "display", defaultValue = "5", required = false) Integer pageSize,
                         @RequestParam(name = "page", required = false) Integer pageIndex,
                         Model model){

        if (pageSize == null) pageSize = this.pageSize;
        if (pageIndex == null) pageIndex = 1;
        SearchData<User> data = userService.getUserByFields(stringQuery, pageSize, pageIndex);
        //retrieve user list from search data
        List<User> users = data.getResultList();

        //retrieve max page count from search data
        int maxResultCount = data.getMaxResultCount();
        int maxPageCount = maxResultCount/pageSize;
        if (maxResultCount%pageSize != 0) maxPageCount++;

        //add user object to the model for add/update function
        model.addAttribute("user", new User());
        //add user list to the model for display/search function
        model.addAttribute("userList", users);
        //add maxPageCount to the model for display function
        model.addAttribute("maxPageCount", maxPageCount);
        //add pageIndex to the model for display/search function
        model.addAttribute("pageIndex", pageIndex);
        //add stringQuery to the model for search function
        model.addAttribute("stringQuery", stringQuery);
        //add pageSize to the model for display function
        model.addAttribute("display", pageSize);

        return "admin/searchResult";
    }

    @RequestMapping("/updateUser")
    public String updateUser(@RequestParam("role-Id") int roleId,
                             @Valid @ModelAttribute("user") User user,
                             BindingResult result,
                             Model model){
        if (result.hasErrors()){
            model.addAttribute("user", user);
            return "admin/user-update-error.jsp";
        }

        //retrieve current user form database
        User currentUser = userService.getUserById(user.getId());
        //bind the data

        currentUser.setFullName(user.getFullName());
        currentUser.setPhoneNumber(user.getPhoneNumber());
        currentUser.setAddress(user.getAddress());
        Role role = roleService.getRole(roleId);
        currentUser.setRoleId(role);

        userService.updateUser(currentUser);
        return "admin/successUpdateUser";
    }

    @RequestMapping("/userLock")
    public String lockUser(@RequestParam("userId") int id) {
        userService.lockUser(id);
        return "admin/successUpdateUser";
    }

    @RequestMapping("/userUnlock")
    public String unlockUser(@RequestParam("userId") int id) {
        userService.unlockUser(id);
        return "admin/successUpdateUser";
    }

    @RequestMapping("/userDelete")
    public String deleteUser(@RequestParam("userId") int id) {
        userService.deleteUser(id);
        return "admin/successUpdateUser";
    }

    @RequestMapping("/donation")
    public String showDonations( Model model) {
        //retrieve users data
        SearchData<Donation> data = donationService.getDonationByField(stringQuery, pageSize, pageIndex);
        //retrieve user list from search data
        List<Donation> users = data.getResultList();
        //retrieve max page count from search data
        int maxResultCount = data.getMaxResultCount();

        int maxPageCount = maxResultCount/pageSize;
        if (maxResultCount%pageSize != 0) maxPageCount++;

        //add user object to the model for add/update function
        model.addAttribute("user", new User());
        //add user list to the model for display/search function
        model.addAttribute("userList", users);
        //add maxPageCount to the model for display function
        model.addAttribute("maxPageCount", maxPageCount);
        //add pageIndex to the model for display/search function
        model.addAttribute("pageIndex", pageIndex);
        //add stringQuery to the model for search function
        model.addAttribute("stringQuery", stringQuery);
        //add pageSize to the model for display function
        model.addAttribute("display", pageSize);
        return "admin/account";
    }
}
