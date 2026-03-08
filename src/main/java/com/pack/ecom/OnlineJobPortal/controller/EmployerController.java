package com.pack.ecom.OnlineJobPortal.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class EmployerController {

    @Autowired
    DataSource dataSource;

    @GetMapping("/postjob")
    public String postJobPage() {
        return "postjob";
    }

    @PostMapping("/postjob")
    public String saveJob(@RequestParam String company,
                          @RequestParam String location,
                          @RequestParam String skills,
                          @RequestParam int salary) {

        try {

            Connection con = dataSource.getConnection();

            PreparedStatement ps =
            con.prepareStatement("insert into jobs(company,location,skills,salary) values(?,?,?,?)");

            ps.setString(1, company);
            ps.setString(2, location);
            ps.setString(3, skills);
            ps.setInt(4, salary);

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch(Exception e){
            e.printStackTrace();
        }

        return "redirect:/jobList";
    }
}