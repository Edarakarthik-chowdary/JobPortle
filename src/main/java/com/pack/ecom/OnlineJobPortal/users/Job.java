package com.pack.ecom.OnlineJobPortal.users;

public class Job {

    private int id;
    private String company;
    private String location;
    private String skills;
    private int salary;
    private String description;
    private String logo;
    private String type;

    public Job() {}

    public Job(int id, String company, String location, String skills,
               int salary, String description, String logo, String type) {

        this.id = id;
        this.company = company;
        this.location = location;
        this.skills = skills;
        this.salary = salary;
        this.description = description;
        this.logo = logo;
        this.type = type;
    }

    // GETTERS & SETTERS

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Job{" +
                "id=" + id +
                ", company='" + company + '\'' +
                ", location='" + location + '\'' +
                ", skills='" + skills + '\'' +
                ", salary=" + salary +
                ", type='" + type + '\'' +
                '}';
    }
}