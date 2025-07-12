<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
    <head>
        <link type="text/css" rel="stylesheet" href="sheet.css">
        <script src="validation.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="header">

                <div class="header_left">
                    <div class="header_text">
                        <a href="index_(login)_emp.html">Intern House</a>
                    </div>
                </div>

                <div class="header_center">

                </div>

                <div class="header_right">
                    <div class="box">
                        <div class="logout">
                            <a href="logout.jsp">Logout</a>
                        </div>
                    </div>
                </div>

            </div>

            <div class="display">

                <div class="left_pane">
                    <div class="menu">
                        <ul>
                            <li><a href="home_emp.jsp">Home</a></li>
                            <li><a href="employer_profile.jsp">Edit Profile</a></li>
                            <li><a href="post_internship.jsp">Post New Internship</a></li>
                            <li><a href="list_internship.jsp">List Posted Internship</a></li>
                            <li><a href="view_applicants_emp.jsp">View Applicants</a></li>
                            <li><a href="selected_applicants_emp.jsp">Selected Applicant</a></li>
                        </ul>
                    </div>
                </div>

                <div class="right_pane">
                    <form class="post_internship_detail_form" name="post_internship_detail_form" onsubmit="return post_internship_detail_validation()" method="POST" action="internship_post.jsp">

                        <div class="post_internship_detail">
                            <p class="text1">Post a new Internship</p>

                            <div class="pd_left">
                                <div class="pi_form_internship_id">
                                    <p class="text">Internship Code :</p>
                                    <input class="internship_id" type="text" name="internship_id">
                                </div>
                                
                                <div class="pi_form_internship_profile">
                                    <p class="text">Internship Profile :</p>
                                    <input class="internship_profile" type="text" name="internship_profile">
                                </div>
                                
                                <div class="pi_form_internship_location">
                                    <p class="text">Location :</p>
                                    <input class="internship_location" type="text" name="internship_location">
                                </div>
                                
                                <div class="pi_form_internship_skill">
                                    <p class="text">Skills Required :</p>
                                    <input class="internship_skill" type="text" name="internship_skill">
                                </div>
                                
                                <div class="pi_form_internship_responsibilities">
                                    <p class="text">Responsibilities :</p>
                                    <input class="internship_responsibilities" type="text" name="internship_responsibilities">
                                </div>
                                
                                <div class="pi_form_internship_others_skill">
                                    <p class="text">Other Skills (optional) :</p>
                                    <input class="internship_others_skill" type="text" name="internship_others_skill">
                                </div>
                                
                                <div class="pi_form_internship_posting_date">
                                    <p class="text">Date of Posting :</p>
                                    <input class="internship_posting_date" type="date" name="internship_posting_date">
                                </div>
                            </div>

                            <div class="pd_right">
                                
                                <div class="pi_form_internship_experience">
                                    <p class="text">Experience :</p>
                                    <input class="internship_experience" type="text" name="internship_experience">
                                </div>
                                
                                <div class="pi_form_internship_duration">
                                    <p class="text">Duration :</p>
                                    <input class="internship_duration" type="text" name="internship_duration">
                                </div>
                                
                                <div class="pi_form_internship_stipend">
                                    <p class="text">Stipend :</p>
                                    <input class="internship_stipend" type="text" name="internship_stipend">
                                </div>
                                
                                <div class="pi_form_internship_description">
                                    <p class="text">Description :</p>
                                    <textarea class="internship_description" type="text" name="internship_description"></textarea>
                                </div>
                            </div>

                        </div>

                        <div class="post">
                            <input class="post_button" type="submit" name="post_button" value="Post">
                        </div>

                    </form> 
                </div>
                
            </div>

            <div class="footer">

                <div class="footer_left">
                    <div class="footer_about_list">
                        <ul class="about_list">
                            <li class="top">Intern House</li>
                            <li><a href="about_us_(login)_emp.html">About us</a></li>
                            <li><a href="">Terms & Conditions</a></li>
                            <li><a href="contact_us_(login)_emp.html">Contact us</a></li>
                        </ul>
                    </div>
                </div>

                <div class="footer_center">
                    <div class="footer_stream_list">
                        <ul class="stream_list">
                            <li class="top">Internship by Stream</li>
                            <li><a href="">Computer Science Internship</a></li>
                            <li><a href="">Marketing Internship</a></li>
                            <li><a href="">Finance Internship</a></li>
                        </ul>
                    </div>
                </div>

                <div class="footer_right">
                    <div class="footer_text">&copy; Copyright 2022 Intern House</div>
                </div>

            </div>

        </div>
    </body>
</html>
