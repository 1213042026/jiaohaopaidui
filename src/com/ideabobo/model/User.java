package com.ideabobo.model;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields
    private Integer id;
    private String username;
    private String passwd;
    private String roletype;
    private String email;
    private String tel;
    private String qq;
    private String wechat;
    private String sex;
    private String birth;
    private String img;
    private String sid;
    private String address;
    private Integer oid;
    private String otitle;
    private String zhiwei;
    private String note;
    private String zhiban;
    private Integer zan;
    
    
    
    
    
    
   
    
    
    

    public Integer getZan() {
		return zan;
	}

	public void setZan(Integer zan) {
		this.zan = zan;
	}

	public String getZhiban() {
		return zhiban;
	}

	public void setZhiban(String zhiban) {
		this.zhiban = zhiban;
	}

	public String getOtitle() {
		return otitle;
	}

	public void setOtitle(String otitle) {
		this.otitle = otitle;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getZhiwei() {
		return zhiwei;
	}

	public void setZhiwei(String zhiwei) {
		this.zhiwei = zhiwei;
	}

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }



    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getRoletype() {
        return roletype;
    }

    public void setRoletype(String roletype) {
        this.roletype = roletype;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getWechat() {
        return wechat;
    }

    public void setWechat(String wechat) {
        this.wechat = wechat;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }



}