/**
 * Created by Bowa on 2014/8/28.
 */
var focuslist = [];
var focusobj = null;
var focustype = 1;
var gouwuche = "gouwuche";
var currentType = "";


var pimg = {};
pimg.tpl = '<li onclick="toDetail(%s);">'+
    '<img src="'+fileurl+'%s" >'+
    '<h2>%s</h2>'+
    '<p>%s</p>'+
    '</li>';
pimg.colums = ["id","img","title","note"];


var ptitle = {};
ptitle.tpl = '<li onclick="toDetail(%s);">'+
    '<h2>%s</h2>'+
    '</li>';
ptitle.colums = ["id","title"];

var ptitlenote = {};
ptitlenote.tpl = '<li onclick="toDetail(%s);">'+
    '<h2>%s</h2>'+
    '<p>%s</p>'+
    '</li>';
ptitlenote.colums = ["id","title","note"];

var plianxi = {};
plianxi.tpl = '<li onclick="toDetail(%s);">'+
    '<h2>姓名:%s</h2>'+
    '<p>电话:%s</p>'+
    '<p>业务类型:%s</p>'+
    '</li>';
plianxi.colums = ["id","title","tel","yuanxi"];

var pchengji = {};
pchengji.tpl = '<li onclick="toDetail(%s);">'+
    '<h2>姓名:%s</h2>'+
    '<p>项目:%s</p>'+
    '<p>结果:%s</p>'+
    '</li>';
pchengji.colums = ["id","title","course","note"];


$(function(){
//设置类别列表

    var p55 = {};
    p55.tpl = '<li onclick="yishengDetail(%s);">'+
        '<h2>%s</h2>'+
        '<p>%s</p>'+
        '</li>';
    p55.colums = ["id","username","note"];
    $("#yishenglist").data("property",JSON.stringify(p55));
    $("#yishenglist2").data("property",JSON.stringify(p55));

    var p5 = {};
    p5.tpl = '<li><a href="#" onclick="postDetail(%s);">'+
        '<h2>%s</h2>'+
        '<p>%s</p>'+
        '</a></li>';
    p5.colums = ["id","title","ndate"];
    $("#posts").data("property",JSON.stringify(p5));

    var p6 = {};
    p6.tpl = '<li><a href="#" onclick="">'+
        '<h2>%s</h2>'+
        '<p>%s</p>'+
        '<p>%s</p>'+
        '</a></li>';
    p6.colums = ["ndate","note","username"];
    $("#replays").data("property",JSON.stringify(p6));


    var p = {};
    p.tpl = '<li onclick="shopDetail(%s);">'+
        '<img style="height: 80px;" src="'+fileurl+'%s" class="ui-li-thumb">'+
        '<h2>%s</h2>'+
        '<p>%s</p>'+
        '</li>';
    p.colums = ["id","img","sname","note"];
    $("#shops").data("property",JSON.stringify(p));


    var p4bill = {};
    p4bill.tpl = '<li><a href="#" onclick="billDetail(%s);">'+
        '<h2>业务类型:%s</h2>'+
        '<p>状态:%s</p>'+
        '</a></li>';
    p4bill.colums = ["id","shop","statecn"];
    $("#bills").data("property",JSON.stringify(p4bill));



    var p3 = {};
    p3.tpl = '<li><a href="#" onclick="shopDetail(%s);">'+
        '<img src="'+fileurl+'%s" class="ui-li-thumb">'+
        '<h2>%s</h2>'+
        '<p>%s</p>'+
        '</a></li>';
    p3.colums = ["id","img","sname","note"];
    $("#cars").data("property",JSON.stringify(p3));


    var p56 = {};
    p56.tpl = '<li><a>'+
        '<h2>%s</h2>'+
        '<p>%s</p>'+
        '<p>%s</p>'+
        '</a><a onclick="delBeiwang(\'%s\')"></a></li>';
    p56.colums = ["title","note","ndate","title"];
    $("#shiwuList").data("property",JSON.stringify(p56));

});


function toMyBill(){
    if(userinfo){
        changePage("mybillpage");
        mybillslist();
    }else{
        changePage("loginpage");
    }

}
var billlist = [];
function mybillslist(){
    ajaxCallback("mybills",{uid:userinfo.id},function(data){
        billlist = data;
        $("#bills").refreshShowListView(data);
    });
}

function toDaohang(){
    changePage('daohangpage');
    ajaxCallback("listObj",{type:13},function(data){
        focuslist = data;
        focusobj = focuslist[0];
        $("#daohangimg").attr("src",fileurl+focusobj.img);
    });
}


function yishengDetail(id){
    var obj = getObjectById(id,focuslist);
    focusobj = obj;
    changePage("yishengdetail");
    $("#vptitle2").text("名称:"+obj.username);
    currentType = obj.username;
    $("#vpnote2").text("介绍:"+obj.note);
    /* $("#vzhiban").text("值班时间:"+obj.zhiban);
    $("#vptel2").text("电话:"+obj.tel);*/
}

function toYisheng(){
    changePage('yishengpage');
    ajaxCallback("yishenglist",{},function(data){
        focuslist = data;
        $("#yishenglist").refreshShowListView(data);
    });
}

function toXinwen(){
    changePage('xinwenpage');
}

function toGeren(){
    changePage('gerenpage');
}

function toMain(){
    changePage('mainpage');

}

function toShopPage(){
    changePage('shopspage');
    ajaxCallback("listShop",{},function(data){
        focuslist = data;
        $("#shops").refreshShowListView(data);
    });
}

function shopDetail(id){
    var obj = getObjectById(id,focuslist);
    focusobj = obj;
    changePage('shopdetailpage');
    $("#vtitl3").text("名称:"+obj.sname);
    $("#gimg3").attr("src",fileurl+obj.img);
    $("#vaddress3").text("地址:"+obj.address);
    $("#vtel3").text("电话:"+obj.tel);
    $("#vnote3").text("介绍:"+obj.note);
}

function toLuntan(id){
    changePage("luntanpage");
    listPosts(id);
}

function listPosts(id){
    ajaxCallback("listPosts",{uid:id},function(data){
        focuslist = data;
        $("#posts").refreshShowListView(data);
    });
}

function toAddForm(){
    changePage("addformpage");
}
function addForm(){
    var note = $("#fnote").val();
    var title = $("#ftitle").val();
    ajaxCallback("addPosts",{uid:userinfo.id,title:title,note:note,username:userinfo.username},function(){
        toLuntan();
    });
}
function postDetail(id){
    var obj = getPostsById(id);
    focusobj = obj;
    changePage("postdetail");
    $("#vptitle").text("标题:"+obj.title);
    $("#vpnote").text("内容:"+obj.note);
    $("#vpusername").text("发布者:"+obj.username);
    $("#vpdate").text("时间:"+obj.ndate);
    if(obj.uid == userinfo.id){
        $("#mypost").show();
    }else{
        $("#mypost").hide();
    }
    listReplay();
}
function listReplay(){
    ajaxCallback("listReplay",{pid:focusobj.id},function(data){
        $("#replays").refreshShowListView(data);
    });
}
function addReplay(){
    var note = $("#rnote").val();
    ajaxCallback("addReplay",{pid:focusobj.id,uid:userinfo.id,username:userinfo.username,note:note},function(data){
        listReplay();
    });
}

function addReplay2(){
    showLoader("操作成功!",true);
}

function getPostsById(id){
    for(var i=0;i<focuslist.length;i++){
        if(focuslist[i].id == id){
            return focuslist[i];
        }
    }
}

function delPosts(){
    ajaxCallback("deletePosts",{id:focusobj.id},function(data){
        toLuntan();
    });
}

function toList(type){
    focustype = type;
    changePage('listpage');
    if(type==1||type==3||type==4||type==5||type==8||type==11||type==12){
        if(type==5){
            $("#listtitle").text("医院风采");
        }else{
            $("#listtitle").text("业务类型列表");
        }

        $("#list").data("property",JSON.stringify(ptitlenote));
    }else if(type==2||type==7||type==9){
        $("#list").data("property",JSON.stringify(pimg));
    }else if(type==6){
        $("#list").data("property",JSON.stringify(plianxi));
    }else if(type==10){
        $("#listtitle").text("体检报告");
        $("#list").data("property",JSON.stringify(pchengji));
    }
    ajaxCallback("listObj",{type:type},function(data){
        focuslist = data;
        $("#list").refreshShowListView(data);
    });
}

function toDetail(id){
    var obj = getObjectById(id,focuslist);
    changePage('detailpage');
    $("#detailshow div").hide();
    var type = focustype;
    if(type==1||type==3||type==4||type==5||type==8||type==11||type==12){
        $("#detailshow div").eq(0).show();
        $("#detailshow div").eq(8).show();
        $("#vtitle").text("标题:"+obj.title);
        $("#vnote").text("内容:"+obj.note);
    }else if(type==2||type==7||type==9){
        $("#detailshow div").eq(0).show();
        $("#detailshow div").eq(1).show();
        $("#detailshow div").eq(8).show();
        $("#gimg2").attr("src",fileurl+obj.img);
        $("#vtitle").text("标题:"+obj.title);
        $("#vnote").text("内容:"+obj.note);
    }else if(type==6){
        $("#detailshow div").eq(0).show();
        $("#detailshow div").eq(3).show();
        $("#detailshow div").eq(4).show();
        $("#detailshow div").eq(5).show();
        $("#detailshow div").eq(8).show();
        $("#vtitle").text("姓名:"+obj.title);
        $("#vclert").text("职位:"+obj.clert);
        $("#vtel2").text("电话:"+obj.tel);
        $("#vnote").text("介绍:"+obj.note);
        $("#vyuanxi").text("业务类型:"+obj.yuanxi);
    }else if(type==10){
        $("#detailshow div").eq(0).show();
        $("#detailshow div").eq(6).show();
        $("#detailshow div").eq(7).show();
        $("#vtitle").text("姓名:"+obj.title);
        $("#vcourse").text("结果:"+obj.note);
        $("#vscore").text("项目:"+obj.course);
    }
}

function toGuahao(){
    changePage('guahaopage');
    /*ajaxCallback("listKeshi",{},function(data){
        focuslist = data;
        $("#shop").refreshShowSelectMenu(data,"选择业务类型","id","title");
    });*/
    listyishengkeshi("");
}

function refreshYisheng(el){
    var id = $(el).val();
    listyishengkeshi(id);
}
function listyishengkeshi(id){
    ajaxCallback("getKeshiYisheng",{id:id},function(data){
        focuslist = data;
        $("#yishenglist2").refreshShowListView(data);
    });
}

function surebill(){
    var fdata = serializeObject($("#guahaoform"));
    if(userinfo){
        fdata.user = userinfo.username;
        fdata.uid = userinfo.id;
    }else{
        fdata.user = "游客";
        fdata.uid = paiduiid;
    }

    fdata.statecn = "未叫号";
    // console.log(currentType)
    fdata.shop = currentType;
    fdata.note = $("#fnote2").val();
    ajaxCallback("saveBill",fdata,function(data){
        billDetail(data.id);
    });
}

var _linetimmer = null;
function billDetail(id,flag) {
    clearInterval(_linetimmer);
    ajaxCallback("getBill",{id:id},function(data){
        if(flag){

        }else{
            changePage("billgoodspage");
        }

        var bill = data;
        focusobj = data;
        $("#bkeshi").text("业务类型:" + bill.shop);

        if(bill.statecn=="未叫号"){
            getLineNumber(id,function (count){
                if(count==0){
                    $("#statecn").text("订单状态:已叫号");

                }/*else if(count<3){
                    $("#statecn").text("准备就诊");
                    myObj.showIntentActivityNotify("就诊提示","请准备就诊",100);
                }*/else{
                    $("#statecn").text("等待人数:" + count+"人");
                    if(count<2){
                        myObj.showIntentActivityNotify("排队提醒","即将叫号请注意!",100);
                    }
                }
                _linetimmer = setInterval(function(){
                    billDetail(id,true);
                },5000);
                if(count==0){
                    $("#pingjia").show();
                }else{
                    $("#pingjia").hide();
                }
            });
        }else{
            clearInterval(_linetimmer);
            $("#statecn").text("订单状态:" + bill.statecn);
        }
    },true);
}


function getLineNumber(bid,cb){
    ajaxCallback("getLineNumber",{bid:bid},function(data){
        //alert(data.info);
        cb && cb(data.info);
    },true);
}





function tolocation(url){
    window.location.href=url;
}


function addToCar(){
    var str = localStorage[gouwuche];
    var list = [];
    if(str){
        list = JSON.parse(str);
    }
    focusobj.count = $("#shuliang").val();
    var flag = true;
    for(var i=0;i<list.length;i++){
        var obj = list[i];
        if(obj.id == focusobj.id){
            list[i] = focusobj;
            flag = false;
        }
    }
    if(flag){
        list.push(focusobj);
    }

    localStorage[gouwuche] = JSON.stringify(list);
    showLoader("已经添加到收藏!",true);
}

function showCar(){
    if(!userinfo){
        changePage("loginpage");
        return;
    }
    changePage("carspage");
    carlist();
}

function carlist(){
    var str = localStorage[gouwuche];
    var list = [];
    if(str){
        list = JSON.parse(str);
        var total = 0;
        for(var i=0;i<list.length;i++){
            total+=list[i].price*list[i].count;
        }
        $("#zongjia").text("总价:"+total+"元");
    }
    $("#cars").refreshShowListView(list);
}

function removeCar(id){
    var str = localStorage[gouwuche];
    var list = [];
    var newlist = [];
    if(str){
        list = JSON.parse(str);
        for(var i=0;i<list.length;i++){
            var obj = list[i];
            if(obj.id == id){
                continue;
            }
            newlist.push(obj);
        }
        localStorage[gouwuche] = JSON.stringify(newlist);
        $("#cars").refreshShowListView(newlist);
    }
}

/***************************************************************************课程表相关*******************************/

var shiwustr = localStorage['shiwustr'];
var shiwulist = [];
if(shiwustr){
    shiwulist = JSON.parse(shiwustr);
}

function toAddShiwu(){
    changePage('shiwumgpage');
}

function toBeiwang(){
    changePage('beiwangpage');
    $("#shiwuList").refreshShowListView(shiwulist);
}

function saveBeiwang(){
    var fdata = serializeObject($("#shiwuform"));
    shiwulist.push(fdata);
    localStorage['shiwustr'] = JSON.stringify(shiwulist);
    toBeiwang();

}
function delBeiwang(title){
    var newlist = [];
    for(var i=0;i<shiwulist.length;i++){
        if(shiwulist[i].title == title){
            continue;
        }else{
            newlist.push(shiwulist[i]);
        }
    }
    shiwulist = newlist;
    localStorage['shiwustr'] = JSON.stringify(shiwulist);
    toBeiwang();
}

function startShiwuTimmer(){
    _shiwutimmer = setInterval(function (){
        var d = Date.now();
        var dd = new Date();
        for(var i=0;i<shiwulist.length;i++){
            var ndate = shiwulist[i].ndate;
            dd.setHours(ndate.split(":")[0]);
            dd.setMinutes(ndate.split(":")[1]);
            dd.setSeconds(0);
            var notime = dd.getTime();
            var cha = notime-d;
            if(cha>1800000 && cha<1860000 && notime-d>0){
                myObj.showIntentActivityNotify("提醒",shiwulist[i].title,100);
                if(shiwulist[i].freq==1){
                    delBeiwang(shiwulist[i].title);
                }
            }
        }
    },30000);
}