package com.pack.ecom.OnlineJobPortal.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DataLoaderController {

    @Autowired
    DataSource dataSource;

    @GetMapping("/generatejobs")
    public String generateJobs(){

        try(Connection con = dataSource.getConnection();
            PreparedStatement ps = con.prepareStatement(
            "insert into jobs(company,location,skills,salary,type,description,logo) values(?,?,?,?,?,?,?)")){

            for(int i=1;i<=100;i++){

                ps.setString(1,"Company"+i);
                ps.setString(2,"Bangalore");
                ps.setString(3,"Java, Spring Boot");
                ps.setInt(4,800000+i*1000);
                ps.setString(5,"Product-Based");
                ps.setString(6,"Software Developer");
                ps.setString(7,"default.png");

                ps.executeUpdate();
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return "100 Jobs Generated Successfully";
    }
}