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

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    DataSource dataSource;

    @PostMapping("/loginuser")
    public String loginUser(
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam(required=false) String remember,
            HttpSession session,
            Model model){

        try(Connection con = dataSource.getConnection();
            PreparedStatement ps =
            con.prepareStatement(
            "select * from users where username=? and password=?")){

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                // store session
                session.setAttribute("username", username);

                // optional remember login
                if(remember != null){
                    session.setMaxInactiveInterval(60*60*24); // 24 hours
                }

                return "redirect:/joblist";
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        model.addAttribute("error","Invalid username or password");

        return "login";
    }
}