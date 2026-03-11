package com.pack.ecom.OnlineJobPortal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

    // HOME PAGE
    @GetMapping("/")
    public String home(HttpSession session) {

        // If user already logged in go to job list
        if(session.getAttribute("username") != null){
            return "redirect:/joblist";
        }

        return "home";
    }

    // LOGIN PAGE
    @GetMapping("/login")
    public String login(HttpSession session) {

        if(session.getAttribute("username") != null){
            return "redirect:/joblist";
        }

        return "login";
    }

    // REGISTER PAGE
    @GetMapping("/register")
    public String register() {
        return "register";
    }

    // JOB SEARCH PAGE
    @GetMapping("/jobsearch")
    public String jobsearch(HttpSession session) {

        if(session.getAttribute("username") == null){
            return "redirect:/login";
        }

        return "jobsearch";
    }

    // EMPLOYER LOGIN PAGE
    @GetMapping("/emp_login")
    public String employerLogin() {
        return "emp_login";
    }

    // LOGOUT
    @GetMapping("/logout")
    public String logout(HttpSession session){

        session.invalidate();

        return "redirect:/";
    }

}