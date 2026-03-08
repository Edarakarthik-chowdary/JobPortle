package com.pack.ecom.OnlineJobPortal.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
                               @RequestParam String gender) {

        try (Connection con = dataSource.getConnection();
             PreparedStatement ps =
             con.prepareStatement("insert into users(email,fname,lname,username,password,gender) values(?,?,?,?,?,?)")) {

            ps.setString(1, email);
            ps.setString(2, fname);
            ps.setString(3, lname);
            ps.setString(4, username);
            ps.setString(5, password);
            ps.setString(6, gender);

            ps.executeUpdate();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return "redirect:/login";
    }
}