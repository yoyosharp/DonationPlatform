package com.fx23121.DonationPlatform.Controller;


import com.fx23121.DonationPlatform.Entity.Donation;
import com.fx23121.DonationPlatform.Entity.Role;
import com.fx23121.DonationPlatform.Entity.User;
import com.fx23121.DonationPlatform.Entity.UserDonation;
import com.fx23121.DonationPlatform.Service.SearchData;
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

import javax.validation.Valid;
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

    //fields for current display function
    private String stringQuery = "";
    private int pageIndex = 1;
    private int pageSize = 5;
    private int donationStatus = 10;
    private int userDonationStatus = 10;

    @RequestMapping("/home")
    public String showHome() {
        return "admin/home";
    }

//    @RequestMapping("/account")
//    public String showAccountPage(Model model) {
//        //set display parameters to default
//        stringQuery = "";
//        pageIndex = 1;
//        pageSize = 5;
//        //retrieve users data
//        SearchData<User> data = userService.getUserByFields(stringQuery, pageSize, pageIndex);
//        //retrieve user list from search data
//        List<User> users = data.getResultList();
//        //retrieve max page count from search data
//        int maxResultCount = data.getMaxResultCount();
//
//        int maxPageCount = maxResultCount / pageSize;
//        if (maxResultCount % pageSize != 0) maxPageCount++;
//
//        //add user object to the model for add/update function
//        model.addAttribute("user", new User());
//        //add user list to the model for display/search function
//        model.addAttribute("userList", users);
//        //add maxPageCount to the model for display function
//        model.addAttribute("maxPageCount", maxPageCount);
//        //add pageIndex to the model for display/search function
//        model.addAttribute("pageIndex", pageIndex);
//        //add stringQuery to the model for search function
//        model.addAttribute("stringQuery", stringQuery);
//        //add pageSize to the model for display function
//        model.addAttribute("display", pageSize);
//
//        //create roleList and add to the model for add/update function
//        List<Role> roleList = roleService.getRoles();
//        model.addAttribute("roleList", roleList);
//        return "admin/account";
//    }

    @RequestMapping(value = "/account")
    public String showAccountPage(@RequestParam(value = "display", required = false) Integer pageSize,
                                  @RequestParam(value = "page", required = false) Integer pageIndex,
                                  Model model) {
        //set display parameters
        stringQuery = "";
        if (pageSize == null) pageSize = this.pageSize;
        if (pageIndex == null) pageIndex = 1;
        //save current pageSize
        this.pageSize = pageSize;

        SearchData<User> data = userService.getUserByFields(stringQuery, pageSize, pageIndex);
        //retrieve user list from search data
        List<User> users = data.getResultList();
        //retrieve max page count from search data
        int maxResultCount = data.getMaxResultCount();
        int maxPageCount = maxResultCount / pageSize;
        if (maxResultCount % pageSize != 0) maxPageCount++;

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

        //create roleList and add to the model for add/update function
        List<Role> roleList = roleService.getRoles();
        model.addAttribute("roleList", roleList);
        return "admin/account";

    }

    //    addUser
    @PostMapping("/addUser")
    public String addUser(@Valid @ModelAttribute("user") User user,
                          BindingResult result,
                          Model model) {

        //if validator has error return the add user page
        if (result.hasErrors()) {
            System.out.println(result.getFieldErrors());
            model.addAttribute("user", user);
            //create roleList and add to the model for add/update function
            List<Role> roleList = roleService.getRoles();
            model.addAttribute("roleList", roleList);
            return "admin/user-add-error";
        }

        //save the user
        userService.addUser(user);
        return "admin/successAddUser";
    }

    @RequestMapping(value = "/searchUser")
    public String search(@RequestParam(name = "keyword") String stringQuery,
                         @RequestParam(name = "display", required = false) Integer pageSize,
                         @RequestParam(name = "page", required = false) Integer pageIndex,
                         Model model) {
        //set display parameters
        if (pageSize == null) pageSize = this.pageSize;
        if (pageIndex == null) pageIndex = 1;
        //save current pageSize
        this.pageSize = pageSize;

        //retrieve user list from search data
        SearchData<User> data = userService.getUserByFields(stringQuery, pageSize, pageIndex);

        List<User> users = data.getResultList();

        //retrieve max page count from search data
        int maxResultCount = data.getMaxResultCount();
        int maxPageCount = maxResultCount / pageSize;
        if (maxResultCount % pageSize != 0) maxPageCount++;

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
        //create roleList and add to the model for add/update function
        List<Role> roleList = roleService.getRoles();
        model.addAttribute("roleList", roleList);

        return "admin/accountSearchResult";
    }

    @RequestMapping("/updateUser")
    public String updateUser(@Valid @ModelAttribute("user") User user,
                             BindingResult result,
                             Model model) {
        //get role from database
        Role role = roleService.getRole(user.getRoleId().getId());

        //if validator has error return the update user page
        if (result.hasErrors()) {
            model.addAttribute("user", user);
            System.out.println(user);
            user.setRoleId(role);
            //create roleList and add to the model for add/update function
            List<Role> roleList = roleService.getRoles();
            model.addAttribute("roleList", roleList);
            return "admin/user-update-error";
        }

        userService.updateUser(user);
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

//    @RequestMapping("/donation")
//    public String showDonations(@RequestParam(value = "status", required = false) Integer status,
//                                Model model) {
//        //set display parameter
//        if (status == null) status = this.donationStatus;
//        stringQuery = "";
//        pageIndex = 1;
//        //save current donationStatus filter
//        this.donationStatus = status;
//
//        //retrieve donation data
//        SearchData<Donation> data = donationService.getDonationByField(stringQuery, pageSize, pageIndex, status);
//        //retrieve donation list from search data
//        List<Donation> donations = data.getResultList();
//        //retrieve max page count from search data
//        int maxResultCount = data.getMaxResultCount();
//
//        int maxPageCount = maxResultCount / pageSize;
//        if (maxResultCount % pageSize != 0) maxPageCount++;
//
//        //add user object to the model for add/update function
//        model.addAttribute("donation", new Donation());
//        //add donation list to the model for display/search function
//        model.addAttribute("donationList", donations);
//        //add maxPageCount to the model for display function
//        model.addAttribute("maxPageCount", maxPageCount);
//        //add pageIndex to the model for display/search function
//        model.addAttribute("pageIndex", pageIndex);
//        //add stringQuery to the model for search function
//        model.addAttribute("stringQuery", stringQuery);
//        //add pageSize to the model for display function
//        model.addAttribute("display", pageSize);
//        //add status to the model for filter by status function
//        model.addAttribute("status", status);
//        return "admin/donation";
//    }

    @RequestMapping(value = "/donation")
    public String showDonations(@RequestParam(value = "display", required = false) Integer pageSize,
                                @RequestParam(value = "page", required = false) Integer pageIndex,
                                @RequestParam(value = "status", required = false) Integer status,
                                Model model) {
        //set current display parameters
        stringQuery = "";
        if (pageSize == null) pageSize = this.pageSize;
        if (pageIndex == null) pageIndex = 1;
        if (status == null) status = donationStatus;
        //save current display parameters
        this.pageSize = pageSize;
        this.donationStatus = status;

        //retrieve donation list from search data
        SearchData<Donation> data = donationService.getDonationByField(stringQuery, pageSize, pageIndex, status);

        List<Donation> donations = data.getResultList();
        //retrieve max page count from search data
        int maxResultCount = data.getMaxResultCount();

        int maxPageCount = maxResultCount / pageSize;
        if (maxResultCount % pageSize != 0) maxPageCount++;

        //add user object to the model for add/update function
        model.addAttribute("donation", new Donation());
        //add donation list to the model for display/search function
        model.addAttribute("donationList", donations);
        //add maxPageCount to the model for display function
        model.addAttribute("maxPageCount", maxPageCount);
        //add pageIndex to the model for display/search function
        model.addAttribute("pageIndex", pageIndex);
        //add stringQuery to the model for search function
        model.addAttribute("stringQuery", stringQuery);
        //add pageSize to the model for display function
        model.addAttribute("display", pageSize);
        //add status to the model for filter by status function
        model.addAttribute("status", donationStatus);
        return "admin/donation";
    }

    @RequestMapping("/detail")
    public String showDonationDetail(@RequestParam("donationId") int id,
                                     @RequestParam(value = "display", required = false) Integer pageSize,
                                     @RequestParam(value = "page", required = false) Integer pageIndex,
                                     @RequestParam(value = "status", required = false) Integer status,
                                     Model model) {

        //set current display parameters
        if (pageSize == null) pageSize = this.pageSize;
        if (pageIndex == null) pageIndex = 1;
        if (status == null) status = userDonationStatus;

        //save current display parameter
        this.pageSize = pageSize;
        this.userDonationStatus = status;

        //get Donation info
        Donation currentDonation = donationService.getDonation(id);


        //display the UserDonation for current Donation
        SearchData<UserDonation> data = userDonationService.getUserDonationByDonation(id, pageSize, pageIndex, status);
        //retrieve max page count from search data
        int maxResultCount = data.getMaxResultCount();

        int maxPageCount = maxResultCount / pageSize;
        if (maxResultCount % pageSize != 0) maxPageCount++;

        //get the Donation list
        List<UserDonation> userDonationList = data.getResultList();

        model.addAttribute("donation", currentDonation);

        model.addAttribute("userDonationList", userDonationList);
        //add maxPageCount to the model for display function
        model.addAttribute("maxPageCount", maxPageCount);
        //add pageIndex to the model for display/search function
        model.addAttribute("pageIndex", pageIndex);
        //add pageSize to the model for display function
        model.addAttribute("display", pageSize);
        //add status to the model for filter by status function
        model.addAttribute("status", userDonationStatus);
        //add donationId to the model for display function
        model.addAttribute("donationId", id);
        return "admin/detail";
    }

    @RequestMapping(value = "/searchDonation")
    public String searchDonation(@RequestParam(name = "keyword") String stringQuery,
                                 @RequestParam(name = "display", required = false) Integer pageSize,
                                 @RequestParam(name = "page", required = false) Integer pageIndex,
                                 @RequestParam(name = "status", required = false) Integer status,
                                 Model model) {
        //set current display parameters
        if (pageSize == null) pageSize = this.pageSize;
        if (pageIndex == null) pageIndex = 1;
        if (status == null) status = donationStatus;
        //save display parameters
        this.pageSize = pageSize;
        this.donationStatus = status;

        //retrieve user list from search data
        SearchData<Donation> data = donationService.getDonationByField(stringQuery, pageSize, pageIndex, status);

        List<Donation> donations = data.getResultList();

        //retrieve max page count from search data
        int maxResultCount = data.getMaxResultCount();
        int maxPageCount = maxResultCount / pageSize;
        if (maxResultCount % pageSize != 0) maxPageCount++;

        //add user object to the model for add/update function
        model.addAttribute("donation", new Donation());
        //add user list to the model for display/search function
        model.addAttribute("donationList", donations);
        //add maxPageCount to the model for display function
        model.addAttribute("maxPageCount", maxPageCount);
        //add pageIndex to the model for display/search function
        model.addAttribute("pageIndex", pageIndex);
        //add stringQuery to the model for search function
        model.addAttribute("stringQuery", stringQuery);
        //add pageSize to the model for display function
        model.addAttribute("display", pageSize);
        //add status to the model for filter by status function
        model.addAttribute("status", donationStatus);

        return "admin/donationSearchResult";
    }

    @RequestMapping("/addDonation")
    public String addDonation(@Valid @ModelAttribute("donation") Donation donation,
                              BindingResult result,
                              Model model) {

        //if validator has error return Donation add page
        if (result.hasErrors()) {
            System.out.println(result.getFieldErrors());
            model.addAttribute("donation", donation);
            return "admin/donationAddError";
        }

        donationService.addDonation(donation);
        return "admin/successAddDonation";
    }

    @RequestMapping("/updateDonation")
    public String updateDonation(@Valid @ModelAttribute("donation") Donation donation,
                                 BindingResult result,
                                 Model model) {
        //if validator has error return Donation update page
        if (result.hasErrors()) {
            System.out.println(result.getFieldErrors());
            model.addAttribute("donation", donation);
            return "admin/donationUpdateError";
        }

        donationService.updateDonation(donation);
        return "admin/successUpdateDonation";
    }

    @RequestMapping("/donationDelete")
    public String deleteDonation(@RequestParam("donationId") int id) {
        donationService.deleteDonation(id);
        return "admin/successUpdateDonation";
    }

    @RequestMapping("/donationActive")
    public String startDonation(@RequestParam("donationId") int id) {
        donationService.startDonation(id);
        return "admin/successUpdateDonation";
    }

    @RequestMapping("/donationStop")
    public String stopDonation(@RequestParam("donationId") int id) {
        donationService.stopDonation(id);
        return "admin/successUpdateDonation";
    }

    @RequestMapping("/donationClose")
    public String closeDonation(@RequestParam("donationId") int id) {
        donationService.closeDonation(id);
        return "admin/successUpdateDonation";
    }

    @RequestMapping("/userDonationConfirm")
    public String userDonationConfirm(@RequestParam("userDonationId") int userDonationId,
                                      @RequestParam("donationId") int donationId,
                                      Model model) {

        userDonationService.confirm(userDonationId);

        //return the last donation detail page
        //get Donation info
        Donation currentDonation = donationService.getDonation(donationId);
        model.addAttribute("donation", currentDonation);

        SearchData<UserDonation> data = userDonationService.getUserDonationByDonation(donationId, pageSize, pageIndex, userDonationStatus);
        //retrieve max page count from search data
        int maxResultCount = data.getMaxResultCount();
        int maxPageCount = maxResultCount / pageSize;
        if (maxResultCount % pageSize != 0) maxPageCount++;

        //get the Donation list
        List<UserDonation> userDonationList = data.getResultList();
        model.addAttribute("userDonationList", userDonationList);
        //add maxPageCount to the model for display function
        model.addAttribute("maxPageCount", maxPageCount);
        //add pageIndex to the model for display/search function
        model.addAttribute("pageIndex", pageIndex);
        //add pageSize to the model for display function
        model.addAttribute("display", pageSize);
        //add status to the model for filter by status function
        model.addAttribute("status", userDonationStatus);
        //add donationId to the model for display function
        model.addAttribute("donationId", donationId);
        return "admin/detail";
    }

    @RequestMapping("/userDonationReject")
    public String userDonationReject(@RequestParam("userDonationId") int userDonationId,
                                     @RequestParam("donationId") int donationId,
                                     Model model) {
        userDonationService.reject(userDonationId);

        //return the last donation detail page
        //get Donation info
        Donation currentDonation = donationService.getDonation(donationId);
        model.addAttribute("donation", currentDonation);

        SearchData<UserDonation> data = userDonationService.getUserDonationByDonation(donationId, pageSize, pageIndex, userDonationStatus);
        //retrieve max page count from search data
        int maxResultCount = data.getMaxResultCount();

        int maxPageCount = maxResultCount / pageSize;
        if (maxResultCount % pageSize != 0) maxPageCount++;

        //get the Donation list
        List<UserDonation> userDonationList = data.getResultList();
        model.addAttribute("userDonationList", userDonationList);
        //add maxPageCount to the model for display function
        model.addAttribute("maxPageCount", maxPageCount);
        //add pageIndex to the model for display/search function
        model.addAttribute("pageIndex", pageIndex);
        //add pageSize to the model for display function
        model.addAttribute("display", pageSize);
        //add status to the model for filter by status function
        model.addAttribute("status", userDonationStatus);
        //add donationId to the model for display function
        model.addAttribute("donationId", donationId);
        return "admin/detail";
    }
}
