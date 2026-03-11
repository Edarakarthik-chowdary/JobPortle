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

            totalJobs = getCount(con, "select count(*) from jobs");
            totalApplications = getCount(con, "select count(*) from applications");
            totalUsers = getCount(con, "select count(*) from users");

        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("jobs", totalJobs);
        model.addAttribute("applications", totalApplications);
        model.addAttribute("users", totalUsers);

        return "dashboard";
    }

    private int getCount(Connection con, String query) throws Exception {

        try (PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        }

        return 0;
    }
}