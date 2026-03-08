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

    // APPLY JOB + RESUME UPLOAD
    @PostMapping("/applyjob")
    public String applyJob(
            @RequestParam int id,
            @RequestParam("resume") MultipartFile file,
            HttpSession session) {

        String username = (String) session.getAttribute("username");

        if (username == null) {
            return "login";
        }

        String filename = file.getOriginalFilename();
        String email = null;

        try (Connection con = dataSource.getConnection()) {

            String path = "C:/uploads/resumes/";
            File dir = new File(path);

            if (!dir.exists()) {
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

            PreparedStatement ps2 =
                    con.prepareStatement("select email from users where username=?");

            ps2.setString(1, username);

            ResultSet rs = ps2.executeQuery();

            if (rs.next()) {
                email = rs.getString("email");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        if (email != null) {

            String subject = "Job Application Submitted";
            String message = "Your job application has been submitted successfully.";

            emailService.sendEmail(email, subject, message);
        }

        return "redirect:/joblist";
    }

    // JOB LIST
    @GetMapping("/joblist")
    public String jobList(Model model) {

        List<Job> jobs = new ArrayList<>();

        try (Connection con = dataSource.getConnection();
             PreparedStatement ps = con.prepareStatement("select * from jobs");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Job job = new Job(
                        rs.getInt("id"),
                        rs.getString("company"),
                        rs.getString("location"),
                        rs.getString("skills"),
                        rs.getInt("salary"),
                        rs.getString("description"),
                        rs.getString("logo"),
                        rs.getString("type")
                );

                jobs.add(job);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("jobs", jobs);
        return "joblist";
    }

    // JOB DETAILS
    @GetMapping("/jobdetails")
    public String jobDetails(@RequestParam int id, Model model) {

        Job job = null;

        try (Connection con = dataSource.getConnection();
             PreparedStatement ps =
                     con.prepareStatement("select * from jobs where id=?")) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

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

        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("job", job);

        return "jobdetails";
    }

    // SEARCH JOBS
    @GetMapping("/searchjobs")
    public String searchJobs(@RequestParam String keyword, Model model) {

        List<Job> jobs = new ArrayList<>();

        try (Connection con = dataSource.getConnection();
             PreparedStatement ps =
             con.prepareStatement(
             "select * from jobs where company like ? or skills like ?")) {

            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Job job = new Job(
                        rs.getInt("id"),
                        rs.getString("company"),
                        rs.getString("location"),
                        rs.getString("skills"),
                        rs.getInt("salary"),
                        rs.getString("description"),
                        rs.getString("logo"),
                        rs.getString("type")
                );

                jobs.add(job);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("jobs", jobs);

        return "joblist";
    }

    // FILTER BY SKILL
    @GetMapping("/filter")
    public String filterJobs(@RequestParam String skill, Model model) {

        List<Job> jobs = new ArrayList<>();

        try (Connection con = dataSource.getConnection();
             PreparedStatement ps =
             con.prepareStatement("select * from jobs where skills=?")) {

            ps.setString(1, skill);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Job job = new Job(
                        rs.getInt("id"),
                        rs.getString("company"),
                        rs.getString("location"),
                        rs.getString("skills"),
                        rs.getInt("salary"),
                        rs.getString("description"),
                        rs.getString("logo"),
                        rs.getString("type")
                );

                jobs.add(job);
            }

        } catch (Exception e) {
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

                Job job = new Job(
                        rs.getInt("id"),
                        rs.getString("company"),
                        rs.getString("location"),
                        rs.getString("skills"),
                        rs.getInt("salary"),
                        rs.getString("description"),
                        rs.getString("logo"),
                        rs.getString("type")
                );

                jobs.add(job);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        model.addAttribute("jobs", jobs);

        return "joblist";
    }

    // ADD JOB PAGE
    @GetMapping("/addjob")
    public String addJobPage() {
        return "addjob";
    }

    // SAVE JOB
    @GetMapping("/savejob")
    public String saveJob(@RequestParam int id, HttpSession session){

        String username = (String)session.getAttribute("username");

        if(username == null){
            return "login";
        }

        try(Connection con = dataSource.getConnection();
            PreparedStatement ps =
            con.prepareStatement(
            "insert into saved_jobs(username,job_id) values(?,?)")){

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

                Job job = new Job(
                        rs.getInt("id"),
                        rs.getString("company"),
                        rs.getString("location"),
                        rs.getString("skills"),
                        rs.getInt("salary"),
                        rs.getString("description"),
                        rs.getString("logo"),
                        rs.getString("type")
                );

                jobs.add(job);
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
            "delete from saved_jobs where job_id=? and username=?")){

            ps.setInt(1, id);
            ps.setString(2, username);

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

                Job job = new Job(
                        rs.getInt("id"),
                        rs.getString("company"),
                        rs.getString("location"),
                        rs.getString("skills"),
                        rs.getInt("salary"),
                        rs.getString("description"),
                        rs.getString("logo"),
                        rs.getString("type")
                );

                jobs.add(job);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        model.addAttribute("jobs", jobs);

        return "myapplications";
    }

}