package com.pack.ecom.OnlineJobPortal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }
    @GetMapping("/jobsearch")
    public String jobsearch(HttpSession session) {

        if(session.getAttribute("username")==null){
            return "login";
        }

        return "jobsearch";
    }
    @GetMapping("/emp_login")
    public String employerLogin() {
        return "emp_login";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session){

    session.invalidate();   // destroys session

    return "logout";        // open logout.jsp
    }
}