package com.pack.ecom.OnlineJobPortal.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RegisterController {

    @Autowired
    DataSource dataSource;

    @PostMapping("/register")
    public String registerUser(@RequestParam String email,
                               @RequestParam String fname,
                               @RequestParam String lname,
                               @RequestParam String username,
                               @RequestParam String password,
                               @RequestParam String gender,
                               Model model) {

        if(email.isEmpty() || fname.isEmpty() || lname.isEmpty() ||
           username.isEmpty() || password.isEmpty()){

            model.addAttribute("error","All fields are required");
            return "register";
        }

        try (Connection con = dataSource.getConnection()) {

            // check username
            PreparedStatement checkUser =
            con.prepareStatement("select * from users where username=?");

            checkUser.setString(1, username);

            ResultSet rsUser = checkUser.executeQuery();

            if(rsUser.next()){
                model.addAttribute("error","Username already exists");
                return "register";
            }

            // check email
            PreparedStatement checkEmail =
            con.prepareStatement("select * from users where email=?");

            checkEmail.setString(1, email);

            ResultSet rsEmail = checkEmail.executeQuery();

            if(rsEmail.next()){
                model.addAttribute("error","Email already registered");
                return "register";
            }

            // insert user
            PreparedStatement ps =
            con.prepareStatement(
            "insert into users(email,fname,lname,username,password,gender) values(?,?,?,?,?,?)");

            ps.setString(1, email);
            ps.setString(2, fname);
            ps.setString(3, lname);
            ps.setString(4, username);
            ps.setString(5, password);
            ps.setString(6, gender);

            ps.executeUpdate();

        } catch(Exception e){
            e.printStackTrace();
        }

        return "redirect:/login";
    }
}