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
public class DashBoardController {
	@Autowired
    DataSource dataSource;

    @GetMapping("/dashboard")
    public String dashboard(Model model) {

        int totalJobs = 0;
        int totalApplications = 0;
        int totalUsers = 0;

        try (Connection con = dataSource.getConnection()) {

            PreparedStatement ps1 = con.prepareStatement("select count(*) from jobs");
            ResultSet rs1 = ps1.executeQuery();
            if (rs1.next()) {
                totalJobs = rs1.getInt(1);
            }

            PreparedStatement ps2 = con.prepareStatement("select count(*) from applications");
            ResultSet rs2 = ps2.executeQuery();
            if (rs2.next()) {
                totalApplications = rs2.getInt(1);
            }

            PreparedStatement ps3 = con.prepareStatement("select count(*) from users");
            ResultSet rs3 = ps3.executeQuery();
            if (rs3.next()) {
                totalUsers = rs3.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("jobs", totalJobs);
        model.addAttribute("applications", totalApplications);
        model.addAttribute("users", totalUsers);

        return "dashboard";
    }

}
