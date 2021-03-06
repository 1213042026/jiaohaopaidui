package com.ideabobo.action;


import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.swing.*;

import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ideabobo.model.Bill;
import com.ideabobo.model.Good;
import com.ideabobo.model.Line;
import com.ideabobo.model.Obj;
import com.ideabobo.model.Posts;
import com.ideabobo.model.Replay;
import com.ideabobo.model.User;
import com.ideabobo.service.BaseService;
import com.ideabobo.service.BillService;
import com.ideabobo.service.GoodService;
import com.ideabobo.service.ObjService;
import com.ideabobo.service.PostsService;
import com.ideabobo.service.ReplayService;
import com.ideabobo.service.RoomService;
import com.ideabobo.service.TypeService;
import com.ideabobo.service.UserService;
import com.ideabobo.util.GetNowTime;
import com.ideabobo.util.IdeaAction;

@Controller
public class WehallAction extends IdeaAction {
    @Resource
    private BaseService baseService;
    @Resource
	private ObjService objService;


    @Resource
    private GoodService goodService;

    @Resource
    private TypeService typeService;
    @Resource
    private UserService userService;
    @Resource
    private ReplayService replayService;
    @Resource
    private PostsService postsService;
    @Resource
    private BillService billService;
    @Resource
    private RoomService roomService;
    public Gson gson = new Gson();
    private static final long serialVersionUID = -3218238026025256103L;

    public String wehall(){
//		String openid = request.getParameter("openid");
//		session.put("openid", openid);
        return SUCCESS;
    }

    public void login(){
        String username = request.getParameter("username");
        String passwd = request.getParameter("passwd");
        User user = new User();
        user.setPasswd(passwd);
        user.setUsername(encodeGet(username));
        User r = userService.find(user);
        if(r!=null){
        	session.put("user", r);
            renderJsonpObj(r);
        }else{
            renderJsonpString("fail");
        }
    }
    
    public void checkSession(){
    	Object obj = session.get("user");
    	if(obj!=null){
    		renderJsonpObj(obj);
    	}else{
    		renderJsonpString("fail");
    	}
    }
    
    public void clearSession(){
    	session.clear();
    }

    public void checkUser(){
        User u = new User();
        String username = request.getParameter("username");
        u.setUsername(username);
        User r = userService.find(u);
        if(r!=null){
            renderJsonpString("fail");
        }else{
            renderJsonpString("success");
        }
    }

    public void updateUser(){
        String tel = request.getParameter("tel");
        String qq = request.getParameter("qq");
        String wechat = request.getParameter("wechat");
        String email = request.getParameter("email");
        String birth = request.getParameter("birth");
        String sex = request.getParameter("sex");
        String id = request.getParameter("id");

        User user = userService.find(id);

        user.setId(Integer.parseInt(id));
        user.setTel(tel);
        user.setWechat(wechat);
        user.setQq(qq);
        user.setEmail(email);
        user.setBirth(birth);
        user.setSex(encodeGet(sex));
        user.setAddress(encodeGet(request.getParameter("address")));

        userService.update(user);
        renderJsonpObj(user);
    }

    public void changePasswd(){
        String passwd = request.getParameter("passwd");
        String id = request.getParameter("id");
        User user = userService.find(id);
        user.setPasswd(passwd);
        userService.update(user);
        renderJsonpString("success");
    }

    public void register(){
        String tel = request.getParameter("tel");
        //String qq = request.getParameter("qq");
        //String wechat = request.getParameter("wechat");
        //String email = request.getParameter("email");
        //String birth = request.getParameter("birth");
        //String sex = request.getParameter("sex");
        String username = request.getParameter("username");
        String address = request.getParameter("address");
        String passwd = request.getParameter("passwd");
        //String sid = request.getParameter("sid");
        String roletype = "2";

        User user = new User();

        user.setTel(tel);
        //user.setWechat(wechat);
        //user.setQq(qq);
        //user.setEmail(email);
        //user.setBirth(birth);
        //user.setSex(encodeGet(sex));
        user.setPasswd(passwd);
        user.setRoletype(roletype);
        user.setUsername(encodeGet(username));
        user.setAddress(encodeGet(address));
        //user.setSid(sid);
        userService.save(user);

        renderJsonpString("success");
    }


    public void listObj(){
        String type = request.getParameter("type");
        renderJsonpObj(baseService.list("from Obj t where t.type='"+type+"'"));
    }

    public void listType(){
        renderJsonpObj(typeService.list());
    }



    

    

    public void deleteGood(){
        String id = request.getParameter("id");
        goodService.delete(Integer.parseInt(id));
        renderJsonpString("success");
    }



    public void listRoom(){
        renderJsonpObj(roomService.list());
    }

    
    public void getShouye(){
        Good g = new Good();
        g.setShouye(1);
        renderJsonpObj(goodService.list(g));
    }
    
    public void listBillGoods(){
    	String gids = request.getParameter("gids");
    	String hql = "from Good u where u.id in ("+gids+")";
    	renderJsonpObj(goodService.list(hql));
    }
    

    

    
    public void listAddress(){
    	String uid = request.getParameter("uid");
    	renderJsonpObj(baseService.list("from Address t where t.uid = "+uid));
    }
    

    public void addPosts(){
    	String uid = request.getParameter("uid");
    	String title = encodeGet(request.getParameter("title"));
    	String note = encodeGet(request.getParameter("note"));
    	String username = encodeGet(request.getParameter("username"));
    	String ndate = GetNowTime.getNowTimeEn();
    	Posts p = new Posts();
    	p.setUid(uid);
    	p.setTitle(title);
    	p.setUsername(username);
    	p.setNote(note);
    	p.setNdate(ndate);
    	postsService.save(p);
    	renderJsonpString("success");
    }
    public void listPosts(){
        renderJsonpObj(postsService.list());
    }
    public void listReplay(){
    	String pid = request.getParameter("pid");
    	Replay r = new Replay();
    	r.setPid(pid);
        renderJsonpObj(replayService.list(r));
    }
    public void deletePosts(){
    	String id = request.getParameter("id");
    	postsService.delete(Integer.parseInt(id));    	
    	renderJsonpString("success");
    }
    public void addReplay(){
    	String uid = request.getParameter("uid");
    	String pid = request.getParameter("pid");
    	String note = encodeGet(request.getParameter("note"));
    	String username = encodeGet(request.getParameter("username"));
    	String ndate = GetNowTime.getNowTimeEn();
    	Replay m = new Replay();
    	m.setUid(uid);
    	m.setPid(pid);
    	m.setUsername(username);
    	m.setNote(note);
    	m.setNdate(ndate);
    	replayService.save(m);
    	renderJsonpString("success");
    }
    
    public void saveBill(){
        Bill bill = (Bill) getByRequest(new Bill(), true);
        bill.setNdate(GetNowTime.getNowTimeEn());
        baseService.save(bill);
        insertLine(bill.getUid(), bill.getId());
        renderJsonpObj(bill);
    }
    
    public void getBill(){
    	String id = request.getParameter("id");
    	Bill bill = (Bill) baseService.find(Integer.parseInt(id), Bill.class);
    	renderJsonpObj(bill);
    }
    
    public void getLineNumber(){
    	List<Line> list = baseService.list("from Line t order by id asc");
    	String bid = request.getParameter("bid");
    	int count = 0;
    	for(int i=0;i<list.size();i++){
    		Line l = list.get(i);
    		if(l.getBid()==Integer.parseInt(bid)){
    			break;
    		}else{
    			count++;
    		}
    	}
    	renderJsonpString(count+"");
    }
    
    public void insertLine(String uid,int bid){
    	Line line = new Line();
    	line.setUid(uid);
    	line.setBid(bid);
    	baseService.save(line);
    }
    
    public void getKeshiYisheng(){
    	String id = request.getParameter("id");
    	//renderJsonpObj(baseService.list("from User t where t.oid="+id));
    	renderJsonpObj(baseService.list("from User t where t.roletype='3'"));
    }
    
    public void yishenglist(){
    	renderJsonpObj(baseService.list("from User t where t.roletype=3 and t.sid=null"));
    }
    
    public void listKeshi(){
    	renderJsonpObj(baseService.list("from Obj t where t.type=1"));
    }
    public void listShop(){
        renderJsonpObj(baseService.list("from Shop"));
    }
    public void mybills(){
        String uid = request.getParameter("uid");
        Bill b = new Bill();
        b.setUid(uid);
        renderJsonpObj(billService.list(b));
    }
    
    public void zan(){
    	String id = request.getParameter("id");
    	User g = (User) baseService.find(Integer.parseInt(id), User.class);
    	Integer zan = g.getZan();
    	if(zan!=null){
    		zan++;
    	}else{
    		zan=1;
    	}
    	g.setZan(zan);
    	baseService.update(g);
    	renderJsonpString(zan+"");
    }
    
    public void getBills(){
    	String uid = request.getParameter("uid");
    	String hql = "from Bill t where t.uid='"+uid+"' and t.statecn='未叫号'";
    	renderJsonpObj(baseService.list(hql));
    }
    
    public void getCodeUrl(){
    	String uuid = UUID.randomUUID().toString();
    	String url = "http://192.168.1.108:8080/paiduijiaohao/client/index.html?paiduiid="+uuid+"&paidui=1";
    	render(url);
    }
}
