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

try {

Connection con = dataSource.getConnection();

PreparedStatement ps = con.prepareStatement("select * from users");
ResultSet users = ps.executeQuery();

model.addAttribute("users", users);

PreparedStatement ps2 = con.prepareStatement("select * from jobs");
ResultSet jobs = ps2.executeQuery();

model.addAttribute("jobs", jobs);

PreparedStatement ps3 = con.prepareStatement("select * from applications");
ResultSet apps = ps3.executeQuery();

model.addAttribute("applications", apps);

}catch(Exception e){
e.printStackTrace();
}

return "admin";
}
}