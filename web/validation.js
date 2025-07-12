function stu_validation()
{
    var mail = document.stu_log_form.email;
    var psw = document.stu_log_form.password;

    if (mail.value == "")
    {
        alert("This field is left blank, Enter your Email");
        mail.focus();
        return false;
    } 
    else if (mail.value.indexOf('@') == -1 || mail.value.lastIndexOf('.') == -1)
    {
        alert("Please Enter a valid email address");
        mail.focus();
        return false;
    } 
    else if (psw.value == "")
    {
        alert("This field is left blank, Enter your Password");
        psw.focus();
        return false;
    } 
    else if (psw.value.length < 7)
    {
        alert("Please enter atleast 8 characters");
        psw.focus();
        return false;
    } 
    else
        return true;
}

function emp_validation()
{
    var mail = document.emp_log_form.email;
    var psw = document.emp_log_form.password;

    if (mail.value == "")
    {
        alert("This field is left blank, Enter your Email");
        mail.focus();
        return false;
    } 
    else if (mail.value.indexOf('@') == -1 || mail.value.lastIndexOf('.') == -1)
    {
        alert("Please Enter a valid email address");
        mail.focus();
        return false;
    } 
    else if (psw.value == "")
    {
        alert("This field is left blank, Enter your Password");
        psw.focus();
        return false;
    } 
    else if (psw.value.length < 7)
    {
        alert("Please enter atleast 8 characters");
        psw.focus();
        return false;
    } 
    else
        return true;
}

function stu_reg_validation()
{
    var name = document.stu_reg_form.fullname;
    var mail = document.stu_reg_form.email;
    var psw = document.stu_reg_form.password;
    var mob = document.stu_reg_form.mob_no;

    if (name.value == "")
    {
        alert("This field is left blank, Enter your full name");
        name.focus();
        return false;
    } 
    else if (parseInt(name.value))
    {
        alert("Name should contain alphabate");
        name.focus();
        return false;
    } 
    else if (mail.value == "")
    {
        alert("This field is left blank, Enter your Email");
        mail.focus();
        return false;
    } 
    else if (mail.value.indexOf('@') == -1 || mail.value.lastIndexOf('.') == -1)
    {
        alert("Please Enter a valid email address");
        mail.focus();
        return false;
    } 
    else if (psw.value == "")
    {
        alert("This field is left blank, Enter your Password");
        psw.focus();
        return false;
    } 
    else if (psw.value.length < 7)
    {
        alert("Please enter atleast 8 characters");
        psw.focus();
        return false;
    } 
    else if (mob.value == "")
    {
        alert("Enter your mobile number");
        mob.focus();
        return false;
    } 
    else if (isNaN(mob.value))
    {
        alert("This field should contain only digit");
        mob.focus();
        return false;
    } 
    else if (parseInt(mob.value.length) != 10)
    {
        alert("Please specify a valid Mobile number");
        mob.focus();
        return false;
    } 
    else
        return true;
}

function emp_reg_validation()
{
    var name = document.emp_reg_form.comp_name;
    var mail = document.emp_reg_form.email;
    var psw = document.emp_reg_form.password;
    var mob = document.emp_reg_form.mob_no;

    if (mail.value == "")
    {
        alert("This field is left blank, Enter your Email");
        mail.focus();
        return false;
    } 
    else if (mail.value.indexOf('@') == -1 || mail.value.lastIndexOf('.') == -1)
    {
        alert("Please Enter a valid email address");
        mail.focus();
        return false;
    } 
    else if (psw.value == "")
    {
        alert("This field is left blank, Enter your Password");
        psw.focus();
        return false;
    } 
    else if (psw.value.length < 8)
    {
        alert("Please enter atleast 8 characters");
        psw.focus();
        return false;
    } 
    else if (name.value == "")
    {
        alert("This field is left blank, Enter your full name");
        name.focus();
        return false;
    } 
    else if (parseInt(name.value))
    {
        alert("Name should contain alphabate");
        name.focus();
        return false;
    } 
    else if (mob.value == "")
    {
        alert("This field is left blank, Enter your mobile number");
        mob.focus();
        return false;
    } 
    else if (isNaN(mob.value))
    {
        alert("This field should contain only digit");
        mob.focus();
        return false;
    } 
    else if (parseInt(mob.value.length) != 10)
    {
        alert("Please specify a valid Mobile number");
        mob.focus();
        return false;
    } 
    else
        return true;
}

function stu_forgot_psw_validation()
{
    var mail = document.stu_forgot_psw_form.email;
    var dob = document.stu_forgot_psw_form.dob;

    if (mail.value == "")
    {
        alert("This field is left blank, Enter your Email");
        mail.focus();
        return false;
    } 
    else if (mail.value.indexOf('@') == -1 || mail.value.lastIndexOf('.') == -1)
    {
        alert("Please Enter a valid email address");
        mail.focus();
        return false;
    } 
    else if (dob.value == "")
    {
        alert("This field is left blank, Enter your Date of Birth");
        dob.focus();
        return false;
    } 
    else
        return true;
}

function emp_forgot_psw_validation()
{
    var mail = document.emp_forgot_psw_form.email;
    var cin = document.emp_forgot_psw_form.cin;

    if (mail.value == "")
    {
        alert("Please Enter your Email");
        mail.focus();
        return false;
    } 
    else if (mail.value.indexOf('@') == -1 || mail.value.lastIndexOf('.') == -1)
    {
        alert("Please Enter a valid email address");
        mail.focus();
        return false;
    } 
    else if (cin.value == "")
    {
        alert("This field is required, Enter your ISO Certification no.");
        cin.focus();
        return false;
    } 
    else
        return true;
}

function change_psw_validation()
{
    var np = document.change_psw_form.new_password;
    var cp = document.change_psw_form.confirm_password;

    if (np.value == "")
    {
        alert("This field is required, Enter your new Password");
        np.focus();
        return false;
    } else if (np.value.length < 8)
    {
        alert("Please enter atleast 8 characters");
        np.focus();
        return false;
    } 
    else if (cp.value == "")
    {
        alert("This field is required");
        cp.focus();
        return false;
    } 
    else if (np.value != cp.value)
    {
        alert("These Passowrd didn't match,try again");
        cp.focus();
        return false;
    } 
    else
        return true;
}

function contact_us_validation()
{
    var nm = document.contact_form.name;
    var mail = document.contact_form.email;
    var sub = document.contact_form.subject;
    var msg = document.contact_form.message;

    if (nm.value == "")
    {
        alert("Please Enter your full name");
        nm.focus();
        return false;
    } 
    else if (parseInt(nm.value))
    {
        alert("Name should contain alphabate");
        nm.focus();
        return false;
    } 
    else if (mail.value == "")
    {
        alert("Please Enter your Email");
        mail.focus();
        return false;
    } 
    else if (mail.value.indexOf('@') == -1 || mail.value.lastIndexOf('.') == -1)
    {
        alert("Please Enter a valid email address");
        mail.focus();
        return false;
    } 
    else if (sub.value == "")
    {
        alert("This field is required");
        sub.focus();
        return false;
    } 
    else if (msg.value == "")
    {
        alert("This field is required");
        msg.focus();
        return false;
    } 
    else
        return true;
}

function personal_detail_validation()
{
    var dob = document.personal_detail_form.dob;
    var gender=document.personal_detail_form.gender;
    var add=document.personal_detail_form.address;
    var state=document.personal_detail_form.state;
    var dist=document.personal_detail_form.district;
    var city=document.personal_detail_form.city;
    var pin=document.personal_detail_form.pincode;

    if (dob.value == "")
    {
        alert("This field is left blank, Enter your Date of Birth");
        dob.focus();
        return false;
    }
    else if (gender[0].checked==false && gender[1].checked==false)
    {
        alert("Please choose your Gender: Male or Female");
        return false;
    }
    else if (add.value == "")
    {
        alert("This field is left blank, Enter your Full Address");
        add.focus();
        return false;
    }
    else if (!isNaN(add.value))
    {
        alert("Address should not contain only digit");
        add.focus();
        return false;
    }
    else if (state.value == "")
    {
        alert("This field is left blank, Enter your State");
        state.focus();
        return false;
    }
    else if (parseInt(state.value))
    {
        alert("This field should conatin only alphabate");
        state.focus();
        return false;
    }
    else if (dist.value == "")
    {
        alert("This field is left blank, Enter your District");
        dist.focus();
        return false;
    }
    else if (parseInt(dist.value))
    {
        alert("This field should conatin only alphabate");
        dist.focus();
        return false;
    }
    else if (city.value == "")
    {
        alert("This field is left blank, Enter your City");
        city.focus();
        return false;
    }
    else if (parseInt(city.value))
    {
        alert("This field should conatin only alphabate");
        city.focus();
        return false;
    }
    else if (pin.value == "")
    {
        alert("This field is left blank, Enter your Pincode");
        pin.focus();
        return false;
    }
    else if (isNaN(pin.value)==true)
    {
        alert("Pincode should contain only digit");
        pin.focus();
        return false;
    }
    else
        return true;
}

function class_X_validation()
{
    var bd = document.class_X_form.board;
    var yr = document.class_X_form.year;
    var mk_sc = document.class_X_form.marks_scale;
    var mk = document.class_X_form.marks;
    var sch = document.class_X_form.school;
    var type = document.class_X_form.education_type;
    
    if (bd.value == "")
    {
        alert("This field is left blank, Enter your Board");
        bd.focus();
        return false;
    }
    else if (parseInt(bd.value))
    {
        alert("Please enter valid board name");
        bd.focus();
        return false;
    }
    else if (yr.value == "")
    {
        alert("Please specify your Passing Year");
        yr.focus();
        return false;
    }
    else if (mk_sc.value == "")
    {
        alert("Please specify your Perforamace Scale");
        mk_sc.focus();
        return false;
    }
    else if (mk.value == "")
    {
        alert("This field is left blank, Enter your Marks");
        mk.focus();
        return false;
    }
    else if (isNaN(mk.value))
    {
        alert("Marks should contain only digit");
        mk.focus();
        return false;
    }
    else if (sch.value == "")
    {
        alert("This field is left blank, Enter your School");
        sch.focus();
        return false;
    }
    else if (!isNaN(sch.value))
    {
        alert("Please Enter valid School name");
        sch.focus();
        return false;
    }
    else if (type[0].checked==false && type[1].checked==false)
    {
        alert("Please choose your Education type");
        return false;
    }
    else
        return true;
}

function class_XII_validation()
{
    var bd = document.class_XII_form.board;
    var yr = document.class_XII_form.year;
    var strm = document.class_XII_form.stream;
    var mk_sc = document.class_XII_form.marks_scale;
    var mk = document.class_XII_form.marks;
    var sch = document.class_XII_form.school;
    var type= document.class_XII_form.education_type;
    
    if (bd.value == "")
    {
        alert("This field is left blank, Enter your Board");
        bd.focus();
        return false;
    }
    else if (parseInt(bd.value))
    {
        alert("Please enter valid board name");
        bd.focus();
        return false;
    }
    else if (yr.value == "")
    {
        alert("Please specify your Passing Year");
        yr.focus();
        return false;
    }
    else if (strm.value == "")
    {
        alert("This field is left blank, Enter your Stream");
        strm.focus();
        return false;
    }
    else if (mk_sc.value == "")
    {
        alert("Please specify your Perforamace Scale");
        mk_sc.focus();
        return false;
    }
    else if (mk.value == "")
    {
        alert("This field is left blank, Enter your Marks");
        mk.focus();
        return false;
    }
    else if (isNaN(mk.value))
    {
        alert("Marks should contain only digit");
        mk.focus();
        return false;
    }
    else if (sch.value == "")
    {
        alert("This field is left blank, Enter your School");
        sch.focus();
        return false;
    }
    else if (!isNaN(sch.value))
    {
        alert("Please Enter valid School name");
        sch.focus();
        return false;
    }
    else if (type[0].checked==false && type[1].checked==false)
    {
        alert("Please choose your Education type");
        return false;
    }
    else
        return true;
}

function graduation_validation()
{
    var gs = document.graduation_form.graduation_status;
    var dg = document.graduation_form.degree;
    var strm = document.graduation_form.stream;
    var clg = document.graduation_form.college;
    var syr = document.graduation_form.start_year;
    var eyr = document.graduation_form.end_year;
    var mk_sc = document.graduation_form.marks_scale;
    var mk = document.graduation_form.marks;
    var type = document.graduation_form.education_type;
    
    if (gs[0].checked==false && gs[1].checked==false)
    {
        alert("Please choose Graduation Status");
        return false;
    }
    else if (dg.value == "")
    {
        alert("This field is left blank, Enter your Degree");
        dg.focus();
        return false;
    }
    else if (parseInt(dg.value))
    {
        alert("Please enter valid Degree");
        dg.focus();
        return false;
    }
    else if (strm.value == "")
    {
        alert("This field is left blank, Enter your Stream");
        strm.focus();
        return false;
    }
    else if (parseInt(strm.value))
    {
        alert("Please enter valid Stream");
        strm.focus();
        return false;
    }
    else if (clg.value == "")
    {
        alert("This field is left blank, Enter your Collge/University name");
        clg.focus();
        return false;
    }
    else if (!isNaN(clg.value))
    {
        alert("Please Enter valid Collge/University name");
        clg.focus();
        return false;
    }
    else if (syr.value == "")
    {
        alert("Please specify your Start Year");
        syr.focus();
        return false;
    }
    else if (eyr.value == "")
    {
        alert("Please specify your End Year");
        eyr.focus();
        return false;
    }
    else if (mk_sc.value == "")
    {
        alert("Please specify your Perforamace Scale");
        mk_sc.focus();
        return false;
    }
    else if (mk.value == "")
    {
        alert("This field is left blank, Enter your Marks");
        mk.focus();
        return false;
    }
    else if (isNaN(mk.value))
    {
        alert("Marks should contain only digit");
        mk.focus();
        return false;
    }
    else if (type[0].checked==false && type[1].checked==false)
    {
        alert("Please choose your Education type");
        return false;
    }
    else
        return true;
}

function post_graduation_validation()
{
    var pgs = document.post_graduation_form.graduation_status;
    var dg = document.post_graduation_form.degree;
    var strm = document.post_graduation_form.stream;
    var clg = document.post_graduation_form.college;
    var syr = document.post_graduation_form.start_year;
    var eyr = document.post_graduation_form.end_year;
    var mk_sc = document.post_graduation_form.marks_scale;
    var mk = document.post_graduation_form.marks;
    var type = document.post_graduation_form.education_type;
    
    if (pgs[0].checked==false && pgs[1].checked==false)
    {
        alert("Please choose Post-Graduation Status");
        return false;
    }
    else if (dg.value == "")
    {
        alert("This field is left blank, Enter your Degree");
        dg.focus();
        return false;
    }
    else if (parseInt(dg.value))
    {
        alert("Please enter valid Degree");
        dg.focus();
        return false;
    }
    else if (strm.value == "")
    {
        alert("This field is left blank, Enter your Stream");
        strm.focus();
        return false;
    }
    else if (parseInt(strm.value))
    {
        alert("Please enter valid Stream");
        strm.focus();
        return false;
    }
    else if (clg.value == "")
    {
        alert("This field is left blank, Enter your Collge/University name");
        clg.focus();
        return false;
    }
    else if (!isNaN(clg.value))
    {
        alert("Please Enter valid Collge/University name");
        clg.focus();
        return false;
    }
    else if (syr.value == "")
    {
        alert("Please specify your Start Year");
        syr.focus();
        return false;
    }
    else if (eyr.value == "")
    {
        alert("Please specify your End Year");
        eyr.focus();
        return false;
    }
    else if (mk_sc.value == "")
    {
        alert("Please specify your Perforamace Scale");
        mk_sc.focus();
        return false;
    }
    else if (mk.value == "")
    {
        alert("This field is left blank, Enter your Marks");
        mk.focus();
        return false;
    }
    else if (isNaN(mk.value))
    {
        alert("Marks should contain only digit");
        mk.focus();
        return false;
    }
    else if (type[0].checked==false && type[1].checked==false)
    {
        alert("Please choose your Education type");
        return false;
    }
    else
        return true;
}
function diploma_validation()
{
    var ds = document.diploma_form.diploma_status;
    var strm = document.diploma_form.stream;
    var clg = document.diploma_form.college;
    var syr = document.diploma_form.start_year;
    var eyr = document.diploma_form.end_year;
    var mk_sc = document.diploma_form.marks_scale;
    var mk = document.diploma_form.marks;
    var type = document.diploma_form.education_type;
    
    if (ds[0].checked==false && ds[1].checked==false)
    {
        alert("Please choose Diploma Status");
        return false;
    }
    else if (strm.value == "")
    {
        alert("This field is left blank, Enter your Stream");
        strm.focus();
        return false;
    }
    else if (parseInt(strm.value))
    {
        alert("Please enter valid Stream");
        strm.focus();
        return false;
    }
    else if (clg.value == "")
    {
        alert("This field is left blank, Enter your Collge/University name");
        clg.focus();
        return false;
    }
    else if (!isNaN(clg.value))
    {
        alert("Please Enter valid Collge/University name");
        clg.focus();
        return false;
    }
    else if (syr.value == "")
    {
        alert("Please specify your Start Year");
        syr.focus();
        return false;
    }
    else if (eyr.value == "")
    {
        alert("Please specify your End Year");
        eyr.focus();
        return false;
    }
    else if (mk_sc.value == "")
    {
        alert("Please specify your Perforamace Scale");
        mk_sc.focus();
        return false;
    }
    else if (mk.value == "")
    {
        alert("This field is left blank, Enter your Marks");
        mk.focus();
        return false;
    }
    else if (isNaN(mk.value))
    {
        alert("Marks should contain only digit");
        mk.focus();
        return false;
    }
    else if (type[0].checked==false && type[1].checked==false)
    {
        alert("Please choose your Education type");
        return false;
    }
    else
        return true;
}
function internship_validation()
{
    var prf = document.internship_detail_form.profile;
    var org = document.internship_detail_form.organization;
    var loc = document.internship_detail_form.location;
    var sdt = document.internship_detail_form.start_date;
    var edt = document.internship_detail_form.end_date;
    
    if (prf.value == "")
    {
        alert("This field is left blank, Enter your Profile");
        prf.focus();
        return false;
    }
    else if (org.value == "")
    {
        alert("This field is required");
        org.focus();
        return false;
    }
    else if (loc.value == "")
    {
        alert("This field is required");
        loc.focus();
        return false;
    }
    else if (sdt.value == "")
    {
        alert("This field is required");
        sdt.focus();
        return false;
    }
    else if (edt.value == "")
    {
        alert("This field is required");
        edt.focus();
        return false;
    }
    else
        return true;
}

function profile_detail_validation()
{
    var cname = document.profile_detail_form.comp_name;
    var cmail = document.profile_detail_form.comp_email;
    var cmob = document.profile_detail_form.comp_mob_no;
    var cin = document.profile_detail_form.comp_cin;
    var creg_no = document.profile_detail_form.comp_reg_no;
    var ctype = document.profile_detail_form.comp_industry_type;
    var cdoi = document.profile_detail_form.comp_doi;
    var cadd = document.profile_detail_form.comp_address;
    var ccountry = document.profile_detail_form.comp_country;
    var cstate = document.profile_detail_form.comp_state;
    var cdist = document.profile_detail_form.comp_district;
    var ccity = document.profile_detail_form.comp_city;
    var cpin = document.profile_detail_form.comp_pincode;
    
    if (cname.value == "")
    {
        alert("This field is required");
        cname.focus();
        return false;
    } 
    else if (parseInt(cname.value))
    {
        alert("Name should contain alphabate");
        cname.focus();
        return false;
    } 
    else if (cmail.value == "")
    {
        alert("This field is required");
        cmail.focus();
        return false;
    } 
    else if (cmail.value.indexOf('@') == -1 || cmail.value.lastIndexOf('.') == -1)
    {
        alert("Please Enter a valid email address");
        cmail.focus();
        return false;
    } 
    else if (cmob.value == "")
    {
        alert("This field is required");
        cmob.focus();
        return false;
    } 
    else if (isNaN(cmob.value))
    {
        alert("This field should contain only digit");
        cmob.focus();
        return false;
    } 
    else if (parseInt(cmob.value.length) != 10)
    {
        alert("Please specify a valid Mobile number");
        cmob.focus();
        return false;
    } 
    else if (cin.value == "")
    {
        alert("This field is required");
        cin.focus();
        return false;
    }
    else if (creg_no.value == "")
    {
        alert("This field is required");
        creg_no.focus();
        return false;
    }
    else if (ctype.value == "")
    {
        alert("This field is required");
        ctype.focus();
        return false;
    }
    else if (!isNaN(ctype.value))
    {
        alert("This field should not contain only digit");
        ctype.focus();
        return false;
    }
    else if (cdoi.value == "")
    {
        alert("This field is required");
        cdoi.focus();
        return false;
    }
    else if (cadd.value == "")
    {
        alert("This field is required");
        cadd.focus();
        return false;
    }
    else if (!isNaN(cadd.value))
    {
        alert("Address should not contain only digit");
        cadd.focus();
        return false;
    }
    else if (ccountry.value == "")
    {
        alert("This field is required");
        ccountry.focus();
        return false;
    }
    else if (parseInt(ccountry.value))
    {
        alert("This field should conatin only alphabate");
        ccountry.focus();
        return false;
    }
    else if (cstate.value == "")
    {
        alert("This field is required");
        cstate.focus();
        return false;
    }
    else if (parseInt(cstate.value))
    {
        alert("This field should conatin only alphabate");
        cstate.focus();
        return false;
    }
    else if (cdist.value == "")
    {
        alert("This field is required");
        cdist.focus();
        return false;
    }
    else if (parseInt(cdist.value))
    {
        alert("This field should conatin only alphabate");
        cdist.focus();
        return false;
    }
    else if (ccity.value == "")
    {
        alert("This field is required");
        ccity.focus();
        return false;
    }
    else if (parseInt(ccity.value))
    {
        alert("This field should conatin only alphabate");
        ccity.focus();
        return false;
    }
    else if (cpin.value == "")
    {
        alert("This field is required");
        cpin.focus();
        return false;
    }
    else if (isNaN(cpin.value)==true)
    {
        alert("Pincode should contain only digit");
        cpin.focus();
        return false;
    }
    else
        return true;
}

function post_internship_detail_validation()
{
    var code = document.post_internship_detail_form.internship_id;
    var prf = document.post_internship_detail_form.internship_profile;
    var loc = document.post_internship_detail_form.internship_location;
    var skill = document.post_internship_detail_form.internship_skill;
    var resp = document.post_internship_detail_form.internship_responsibilities;
    var date = document.post_internship_detail_form.internship_posting_date;
    var exp = document.post_internship_detail_form.internship_experience;
    var dur = document.post_internship_detail_form.internship_duration;
    var stip = document.post_internship_detail_form.internship_stipend;
    var desc = document.post_internship_detail_form.internship_description;
    
    if (code.value == "")
    {
        alert("This field is required");
        code.focus();
        return false;
    }
    else if (prf.value == "")
    {
        alert("This field is required");
        prf.focus();
        return false;
    }
    else if (loc.value == "")
    {
        alert("This field is required");
        loc.focus();
        return false;
    }
    else if (skill.value == "")
    {
        alert("This field is required");
        skill.focus();
        return false;
    }
    else if (resp.value == "")
    {
        alert("This field is required");
        resp.focus();
        return false;
    }
    else if (date.value == "")
    {
        alert("This field is required");
        date.focus();
        return false;
    }
    else if (exp.value == "")
    {
        alert("This field is required");
        exp.focus();
        return false;
    }
    else if (dur.value == "")
    {
        alert("This field is required");
        dur.focus();
        return false;
    }
    else if (stip.value == "")
    {
        alert("This field is required");
        stip.focus();
        return false;
    }
    else if (desc.value == "")
    {
        alert("This field is required");
        desc.focus();
        return false;
    }
    else
        return true;
}
function apply_validation()
{
    var name = document.apply_form.name;
    var mail = document.apply_form.email;
    var mob = document.apply_form.mob;
    
    if (name.value == "")
    {
        alert("This field is required");
        name.focus();
        return false;
    }
    else if (parseInt(name.value))
    {
        alert("Name should contain alphabate");
        name.focus();
        return false;
    }
    else if (mail.value == "")
    {
        alert("This field is required");
        mail.focus();
        return false;
    }
    else if (mail.value.indexOf('@') == -1 || mail.value.lastIndexOf('.') == -1)
    {
        alert("Please Enter a valid email address");
        mail.focus();
        return false;
    } 
    else if (mob.value == "")
    {
        alert("This field is required");
        mob.focus();
        return false;
    }
    else if (isNaN(mob.value))
    {
        alert("This field should contain only digit");
        mob.focus();
        return false;
    } 
    else if (parseInt(mob.value.length) != 10)
    {
        alert("Please specify a valid Mobile number");
        mob.focus();
        return false;
    }
    else
        return true;
}
function admin_validation()
{
    var u_id = document.admin_log_form.user_id;
    var psw = document.admin_log_form.password;
    
    if (u_id.value == "")
    {
        alert("This field is left blank, Enter your user id");
        u_id.focus();
        return false;
    } 
    else if (psw.value == "")
    {
        alert("This field is left blank, Enter your Password");
        psw.focus();
        return false;
    } 
    else if (psw.value.length < 7)
    {
        alert("Please enter atleast 8 characters");
        psw.focus();
        return false;
    } 
    else
        return true;
}
function change_mail_validation()
{
    var mail=document.change_mail_form.new_mail;
    
    if (mail.value == "")
    {
        alert("This field is required");
        mail.focus();
        return false;
    }
    else if (mail.value.indexOf('@') == -1 || mail.value.lastIndexOf('.') == -1)
    {
        alert("Please Enter a valid email address");
        mail.focus();
        return false;
    } 
    else
        return true;
}