package com.fx23121.DonationPlatform.Controller;

import com.fx23121.DonationPlatform.Entity.Donation;
import com.fx23121.DonationPlatform.Entity.User;
import com.fx23121.DonationPlatform.Entity.UserDonation;
import com.fx23121.DonationPlatform.Service.DonationService;
import com.fx23121.DonationPlatform.Service.SearchData;
import com.fx23121.DonationPlatform.Service.UserDonationService;
import com.fx23121.DonationPlatform.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("public")
public class PublicController {

    @Autowired
    private UserService userService;
    @Autowired
    private DonationService donationService;
    @Autowired
    private UserDonationService userDonationService;

    private int pageSize = 5;
    private int pageIndex = 1;
    private int status = 10;
    @RequestMapping("login")
    public String showLoginPage() {
        return "public/login";
    }
    @RequestMapping("/userLogin")
    public String userLogin(@RequestParam("email") String userEmail,
                            @RequestParam("password") String userPassword,
                            Model model) {
        //retrieve user from database
        User currentUser = userService.getUserByEmailAndPassword(userEmail, userPassword);
        if (currentUser == null) return "redirect:login?error=true";
        if (currentUser.getStatus() == 0) return "public/userLocked";
        if (currentUser.getRoleId().getId() == 1) return "admin/home";
        else {
//
            model.addAttribute("userId", currentUser.getId());
//
            return "public/loginSuccess";
        }
    }

    @RequestMapping("/logout")
    public String logOut(Model model) {
        pageSize = 5;
        pageIndex = 1;
        status = 10;

        SearchData<Donation> data = donationService.getDonationByField("", pageSize, pageIndex, status);

        //get total page count
        int maxResultCount = data.getMaxResultCount();
        int maxPageCount = maxResultCount/pageSize;
        if (maxResultCount%pageSize != 0) maxPageCount++;

        //get donation list
        List<Donation> donationList = data.getResultList();

        //add attributes for display function
        model.addAttribute("userDonation", new UserDonation());
        model.addAttribute("userId", null);
        model.addAttribute("donations", donationList);
        model.addAttribute("display", pageSize);
        model.addAttribute("page", pageIndex);
        model.addAttribute("status", status);
        return "public/home";
    }

    @RequestMapping("/home")
    public String showHome(@RequestParam(value = "userId", required = false) Integer id,
                           @RequestParam(value = "display", required = false) Integer pageSize,
                           @RequestParam(value = "page", required = false) Integer pageIndex,
                           @RequestParam(value = "status", required = false) Integer status,
                           Model model) {
        //set default display parameters
        if (pageSize == null) pageSize = 5;
        if (pageIndex == null) pageIndex = 1;
        if (status == null) status = 10;

        //save display parameters
        this.pageSize = pageSize;
        this.pageIndex = pageIndex;
        this.status = status;

        SearchData<Donation> data = donationService.getDonationByField("", pageSize, pageIndex, status);

        //get total page count
        int maxResultCount = data.getMaxResultCount();
        int maxPageCount = maxResultCount/pageSize;
        if (maxResultCount%pageSize != 0) maxPageCount++;

        //get donation list
        List<Donation> donationList = data.getResultList();

        //add attributes for display function
        model.addAttribute("userDonation", new UserDonation());
        model.addAttribute("userId", id);
        model.addAttribute("donations", donationList);
        model.addAttribute("display", pageSize);
        model.addAttribute("page", pageIndex);
        model.addAttribute("status", status);
        model.addAttribute("maxPageCount", maxPageCount);

        return "public/home";
    }

    @RequestMapping("/detail")
    public String showDonationDetail(@RequestParam("donationId") int donationId,
                                     @RequestParam("userId") int userId,
                                     Model model){

        Donation currentDonation = donationService.getDonation(donationId);
        List<UserDonation> currentUserDonationList
                = userDonationService.getUserDonationByDonation(donationId, 5, 1, 1)
                .getResultList();//get 5 latest confirmed user donations

        model.addAttribute("donation", currentDonation);
        model.addAttribute("userId", userId);
        model.addAttribute("userDonations", currentUserDonationList);
        model.addAttribute("userDonation", new UserDonation());
        return "public/detail";
    }

    @RequestMapping("/userDonate")
    public String addUserDonate(@ModelAttribute("userDonation") UserDonation userDonation,
                                Model model) {
        userDonationService.addUserDonation(userDonation);

        //restore last view
        SearchData<Donation> data = donationService.getDonationByField("", pageSize, pageIndex, status);

        //get total page count
        int maxResultCount = data.getMaxResultCount();
        int maxPageCount = maxResultCount/pageSize;
        if (maxResultCount%pageSize != 0) maxPageCount++;

        //get donation list
        List<Donation> donationList = data.getResultList();

        //add attributes for display function
        model.addAttribute("userDonation", new UserDonation());
        model.addAttribute("userId", userDonation.getUser().getId());
        model.addAttribute("donations", donationList);
        model.addAttribute("display", pageSize);
        model.addAttribute("page", pageIndex);
        model.addAttribute("status", status);
        model.addAttribute("maxPageCount", maxPageCount);
        return "public/home";
    }

    @RequestMapping("detail/userDonate")
    public String addUserDonate2(@ModelAttribute("userDonation") UserDonation userDonation,
                                Model model) {
        userDonationService.addUserDonation(userDonation);

        int donationId = userDonation.getDonation().getId();
        Donation currentDonation = donationService.getDonation(donationId);
        List<UserDonation> currentUserDonationList
                = userDonationService.getUserDonationByDonation(donationId, 5, 1, 1)
                .getResultList();//get 5 latest confirmed user donations

        model.addAttribute("donation", currentDonation);
        model.addAttribute("userId", userDonation.getUser().getId());
        model.addAttribute("userDonations", currentUserDonationList);
        model.addAttribute("userDonation", new UserDonation());
        return "public/detail";
    }
}
