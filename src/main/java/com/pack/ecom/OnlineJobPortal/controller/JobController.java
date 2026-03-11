package com.pack.ecom.OnlineJobPortal.controller;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.pack.ecom.OnlineJobPortal.services.EmailServices;
import com.pack.ecom.OnlineJobPortal.users.Job;

import jakarta.servlet.http.HttpSession;

@Controller
public class JobController {

    @Autowired
    DataSource dataSource;

    @Autowired
    EmailServices emailService;

    // APPLY JOB
    @PostMapping("/applyjob")
    public String applyJob(@RequestParam int id,
                           @RequestParam("resume") MultipartFile file,
                           HttpSession session) {

        String username = (String) session.getAttribute("username");

        if(username == null){
            return "redirect:/login";
        }

        if(file.isEmpty()){
            return "redirect:/jobdetails?id=" + id;
        }

        String email = null;

        try(Connection con = dataSource.getConnection()){

            // Prevent duplicate applications
            PreparedStatement check = con.prepareStatement(
            "select * from applications where username=? and job_id=?");

            check.setString(1, username);
            check.setInt(2, id);

            ResultSet rsCheck = check.executeQuery();

            if(rsCheck.next()){
                return "redirect:/jobdetails?id=" + id;
            }

            // Resume upload
            String filename = System.currentTimeMillis() + "_" + file.getOriginalFilename();

            String path = System.getProperty("user.dir") + "/uploads/resumes/";

            File dir = new File(path);

            if(!dir.exists()){
                dir.mkdirs();
            }

            file.transferTo(new File(path + filename));

            PreparedStatement ps = con.prepareStatement(
            "insert into applications(username,job_id,status,resume) values(?,?,?,?)");

            ps.setString(1, username);
            ps.setInt(2, id);
            ps.setString(3, "Applied");
            ps.setString(4, filename);

            ps.executeUpdate();

            // Get user email
            PreparedStatement ps2 =
            con.prepareStatement("select email from users where username=?");

            ps2.setString(1, username);

            ResultSet rs = ps2.executeQuery();

            if(rs.next()){
                email = rs.getString("email");
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        // Send confirmation email
        if(email != null){

            emailService.sendEmail(
            email,
            "Job Application Submitted",
            "Your job application has been submitted successfully.");
        }

        return "redirect:/joblist";
    }

    // JOB LIST
    @GetMapping("/joblist")
    public String jobList(Model model){

        List<Job> jobs = new ArrayList<>();

        try(Connection con = dataSource.getConnection();
            PreparedStatement ps =
            con.prepareStatement("select * from jobs limit 20");
            ResultSet rs = ps.executeQuery()){

            while(rs.next()){

                jobs.add(new Job(
                        rs.getInt("id"),
                        rs.getString("company"),
                        rs.getString("location"),
                        rs.getString("skills"),
                        rs.getInt("salary"),
                        rs.getString("description"),
                        rs.getString("logo"),
                        rs.getString("type")
                ));
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        model.addAttribute("jobs", jobs);

        return "joblist";
    }

    // JOB DETAILS
    @GetMapping("/jobdetails")
    public String jobDetails(@RequestParam int id, Model model){

        Job job = null;

        try(Connection con = dataSource.getConnection();
            PreparedStatement ps =
            con.prepareStatement("select * from jobs where id=?")){

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                job = new Job(
                        rs.getInt("id"),
                        rs.getString("company"),
                        rs.getString("location"),
                        rs.getString("skills"),
                        rs.getInt("salary"),
                        rs.getString("description"),
                        rs.getString("logo"),
                        rs.getString("type")
                );
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        model.addAttribute("job", job);

        return "jobdetails";
    }

    // SEARCH JOBS
    @GetMapping("/searchjobs")
    public String searchJobs(@RequestParam String keyword, Model model){

        List<Job> jobs = new ArrayList<>();

        try(Connection con = dataSource.getConnection();
            PreparedStatement ps =
            con.prepareStatement(
            "select * from jobs where company like ? or skills like ? or location like ?")){

            ps.setString(1,"%"+keyword+"%");
            ps.setString(2,"%"+keyword+"%");
            ps.setString(3,"%"+keyword+"%");

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                jobs.add(new Job(
                        rs.getInt("id"),
                        rs.getString("company"),
                        rs.getString("location"),
                        rs.getString("skills"),
                        rs.getInt("salary"),
                        rs.getString("description"),
                        rs.getString("logo"),
                        rs.getString("type")
                ));
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        model.addAttribute("jobs", jobs);

        return "joblist";
    }

    // FILTER BY SKILL
    @GetMapping("/filter")
    public String filterJobs(@RequestParam String skill, Model model){

        List<Job> jobs = new ArrayList<>();

        try(Connection con = dataSource.getConnection();
            PreparedStatement ps =
            con.prepareStatement("select * from jobs where skills like ?")){

            ps.setString(1,"%"+skill+"%");

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                jobs.add(new Job(
                        rs.getInt("id"),
                        rs.getString("company"),
                        rs.getString("location"),
                        rs.getString("skills"),
                        rs.getInt("salary"),
                        rs.getString("description"),
                        rs.getString("logo"),
                        rs.getString("type")
                ));
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        model.addAttribute("jobs", jobs);

        return "joblist";
    }

    // FILTER BY COMPANY TYPE
    @GetMapping("/filtercompany")
    public String filterCompany(@RequestParam String type, Model model){

        List<Job> jobs = new ArrayList<>();

        try(Connection con = dataSource.getConnection();
            PreparedStatement ps =
            con.prepareStatement("select * from jobs where type=?")){

            ps.setString(1, type);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                jobs.add(new Job(
                        rs.getInt("id"),
                        rs.getString("company"),
                        rs.getString("location"),
                        rs.getString("skills"),
                        rs.getInt("salary"),
                        rs.getString("description"),
                        rs.getString("logo"),
                        rs.getString("type")
                ));
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        model.addAttribute("jobs", jobs);

        return "joblist";
    }

    // SAVE JOB
    @GetMapping("/savejob")
    public String saveJob(@RequestParam int id, HttpSession session){

        String username = (String)session.getAttribute("username");

        if(username == null){
            return "redirect:/login";
        }

        try(Connection con = dataSource.getConnection()){

            PreparedStatement check = con.prepareStatement(
            "select * from saved_jobs where username=? and job_id=?");

            check.setString(1, username);
            check.setInt(2, id);

            ResultSet rs = check.executeQuery();

            if(rs.next()){
                return "redirect:/savedjobs";
            }

            PreparedStatement ps =
            con.prepareStatement(
            "insert into saved_jobs(username,job_id) values(?,?)");

            ps.setString(1, username);
            ps.setInt(2, id);

            ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }

        return "redirect:/savedjobs";
    }

    // VIEW SAVED JOBS
    @GetMapping("/savedjobs")
    public String savedJobs(HttpSession session, Model model){

        String username = (String)session.getAttribute("username");

        List<Job> jobs = new ArrayList<>();

        try(Connection con = dataSource.getConnection();
            PreparedStatement ps =
            con.prepareStatement(
            "select jobs.* from jobs join saved_jobs on jobs.id=saved_jobs.job_id where username=?")){

            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                jobs.add(new Job(
                        rs.getInt("id"),
                        rs.getString("company"),
                        rs.getString("location"),
                        rs.getString("skills"),
                        rs.getInt("salary"),
                        rs.getString("description"),
                        rs.getString("logo"),
                        rs.getString("type")
                ));
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        model.addAttribute("jobs", jobs);

        return "savedjobs";
    }

    // REMOVE SAVED JOB
    @GetMapping("/removesavedjob")
    public String removeSavedJob(@RequestParam int id, HttpSession session){

        String username = (String)session.getAttribute("username");

        try(Connection con = dataSource.getConnection();
            PreparedStatement ps =
            con.prepareStatement(
            "delete from saved_jobs where username=? and job_id=?")){

            ps.setString(1, username);
            ps.setInt(2, id);

            ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }

        return "redirect:/savedjobs";
    }

    // MY APPLICATIONS
    @GetMapping("/myapplications")
    public String myApplications(HttpSession session, Model model){

        String username = (String)session.getAttribute("username");

        List<Job> jobs = new ArrayList<>();

        try(Connection con = dataSource.getConnection();
            PreparedStatement ps =
            con.prepareStatement(
            "select jobs.* from jobs join applications on jobs.id=applications.job_id where username=?")){

            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                jobs.add(new Job(
                        rs.getInt("id"),
                        rs.getString("company"),
                        rs.getString("location"),
                        rs.getString("skills"),
                        rs.getInt("salary"),
                        rs.getString("description"),
                        rs.getString("logo"),
                        rs.getString("type")
                ));
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        model.addAttribute("jobs", jobs);

        return "myapplications";
    }

}