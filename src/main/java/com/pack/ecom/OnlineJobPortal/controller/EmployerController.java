package com.pack.ecom.OnlineJobPortal.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;

@Controller
public class EmployerController {

    @Autowired
    DataSource dataSource;

    // OPEN POST JOB PAGE
    @GetMapping("/postjob")
    public String postJobPage(HttpSession session) {

        if(session.getAttribute("username")==null){
            return "redirect:/login";
        }

        return "postjob";
    }

    // SAVE JOB
    @PostMapping("/postjob")
    public String saveJob(@RequestParam String company,
                          @RequestParam String location,
                          @RequestParam String skills,
                          @RequestParam int salary,
                          @RequestParam String type,
                          @RequestParam(required=false) String description,
                          @RequestParam(required=false) String logo,
                          HttpSession session) {

        if(session.getAttribute("username")==null){
            return "redirect:/login";
        }

        // Default values
        if(description == null || description.isEmpty()){
            description = "Job opportunity at " + company;
        }

        if(logo == null || logo.isEmpty()){
            logo = "default.png";
        }

        try (Connection con = dataSource.getConnection();
             PreparedStatement ps = con.prepareStatement(
             "insert into jobs(company,location,skills,salary,type,description,logo) values(?,?,?,?,?,?,?)")) {

            ps.setString(1, company);
            ps.setString(2, location);
            ps.setString(3, skills);
            ps.setInt(4, salary);
            ps.setString(5, type);
            ps.setString(6, description);
            ps.setString(7, logo);

            ps.executeUpdate();

        } catch(Exception e){
            e.printStackTrace();
        }

        return "redirect:/joblist";
    }
}