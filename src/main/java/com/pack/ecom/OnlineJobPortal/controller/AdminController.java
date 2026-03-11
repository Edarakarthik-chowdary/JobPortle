package com.pack.ecom.OnlineJobPortal.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

    @Autowired
    DataSource dataSource;

    @GetMapping("/admin")
    public String adminDashboard(Model model) {

        int totalUsers = 0;
        int totalJobs = 0;
        int totalApplications = 0;

        try(Connection con = dataSource.getConnection()){

            // USERS COUNT
            PreparedStatement ps1 =
            con.prepareStatement("select count(*) from users");

            ResultSet rs1 = ps1.executeQuery();

            if(rs1.next()){
                totalUsers = rs1.getInt(1);
            }

            // JOBS COUNT
            PreparedStatement ps2 =
            con.prepareStatement("select count(*) from jobs");

            ResultSet rs2 = ps2.executeQuery();

            if(rs2.next()){
                totalJobs = rs2.getInt(1);
            }

            // APPLICATIONS COUNT
            PreparedStatement ps3 =
            con.prepareStatement("select count(*) from applications");

            ResultSet rs3 = ps3.executeQuery();

            if(rs3.next()){
                totalApplications = rs3.getInt(1);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        model.addAttribute("users", totalUsers);
        model.addAttribute("jobs", totalJobs);
        model.addAttribute("applications", totalApplications);

        return "admin";
    }
}