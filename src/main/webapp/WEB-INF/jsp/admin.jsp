<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/15 0015
  Time: 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>停车场信息管理系统（管理员）</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <!-- Bootstrap -->
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/calender.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/calender.css">

    <!--表格样式-->
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/table.js"></script>--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootbox/bootbox.min.js"></script>
    <!--图标样式-->
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.0/css/all.min.css'>
    <!--表单样式-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css">

<%-- 为了添加新标签从member复制来的样式   --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css">

</head>
<body style="background-color: #D3D3D3">
<nav class="navbar navbar-default" role="navigation" style="margin-bottom: 0px">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="" style="color: black">停车场信息管理系统（管理员）</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="${pageContext.request.contextPath}/userController/signOut?logout=true"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
        </ul>
    </div>
</nav>
<div class="row" style="width: 100%;">
    <div class="col-md-3">
        <div class="navbar_left_0">
            <div class="bar">
                <div class="options">
                    <ul>
                        <li class="active" style="color: black"><i href="#home" data-toggle="tab" class="fa fa-home"> Hello</i></li>
                        <span class="options__division">基本功能</span>
                        <li><a href="${pageContext.request.contextPath}/userManager"> 基本信息(用户管理)</a></li>
                        <%--                        <li><i data-toggle="tab" href="#userMsg_tab" onclick="showUserMsg()" class="fa fa-id-card"> 基本信息(用户管理)</i></li>--%>
                        <li><i data-toggle="tab" href="#tokens_tab" onclick="showTokens()" class="fa fa-credit-card"> 我的卡券(停车管理)</i></li>
                        <li><i data-toggle="tab" href="#carsMsg_tab" onclick="showCars()" class="fa fa-car"> 车辆管理(车位管理)</i></li>
                        <li><i data-toggle="tab" href="#parkingTime_tab" onclick="showParkingTime()" class="fa fa-clock"> 停车记录(投诉管理)</i></li>
                        <li><i data-toggle="tab" href="#fare_tab" onclick="showFare()" class="fa fa-university"> 停车费用(出入口管理)</i></li>
                        <li><i data-toggle="tab" href="#parking_tab" onclick="showParking()" class="fa fa-bars"> 车位情况</i></li>
                    </ul>
                </div>
                <div class="settings">
                    <ul>
                        <li class="acc-settings"><i class="fas fa-cog"></i> Account Settings</li>
                        <li><a href="${pageContext.request.contextPath}/userController/signOut?logout=true" class="fas fa-sign-out-alt"> Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
<%--    以上内容为member中复制用于更好的观感--%>
    <div class="col-md-9">
        <div class="box">
            <div class="export">
                <button id="addDriver_btn" type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#driverAddingModal">
                <img src="${pageContext.request.contextPath}/pic/add.png"/>
                <span>添加</span>
                </button>
                <div class="modal fade" id="driverAddingModal">
                    <div class="modal-dialog modal-lg modal_position">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <form id="admin_driverForm" action="${pageContext.request.contextPath}/driverController/register.driver" method="post" class="basic-grey">
                                    <h1>添加新用户
                                    </h1>

                                    <label>
                                        <span>姓名 :</span>
                                        <input id="driverName" type="text" name="driverName" placeholder="请输入姓名" />
                                    </label>

                                    <label>
                                        <span>性别 :</span><select name="gender">
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                    </select>
                                    </label>

                                    <label>
                                        <span>手机号码 :</span>
                                        <input id="phone" type="text" name="phone" placeholder="请输入手机号码" />
                                    </label>

                                    <label>
                                        <span>身份证号码 :</span>
                                        <input id="idCardNum" type="text" name="idCardNum" placeholder="请输入身份证号码"/>
                                    </label>

                                    <label>
                                        <span>所在地 :</span>
                                        <input id="address" type="text" name="address" placeholder="请输入所在地,如：广州"/>
                                    </label>

                                    <label>
                                        <span>&nbsp;</span>
                                        <button id="driverAdding_btn" type="submit" class="btn btn-default">确定</button>
                                    </label>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="adm_carsModal">
                    <div class="modal-dialog modal-lg modal_position">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">车辆信息</h4>
                            </div>
                            <div class="modal-body">
                                <table id="admin_cars_tb" class="table">
                                    <thead>
                                    <tr>
                                        <th>车牌号码</th>
                                        <th>汽车品牌</th>
                                        <th>汽车颜色</th>
                                        <th>收费方案</th>
                                    </tr>
                                    </thead>
                                    <tbody id="admin_carsTBody">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="adm_timesModal">
                    <div class="modal-dialog modal-lg modal_position">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">停车记录</h4>
                            </div>
                            <div class="modal-body">
                                <table id="admin_times_tb" class="table">
                                    <thead>
                                    <tr>
                                        <th>车牌号码</th><th>开始时间</th><th>结束时间</th><th>总时长(h)</th>
                                    </tr>
                                    </thead>
                                    <tbody id="admin_timesTBody">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="adm_tokensModal">
                    <div class="modal-dialog modal-lg modal_position">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">卡券</h4>
                            </div>
                            <div class="modal-body">
                                <table id="admin_tokens_tb" class="table">
                                    <thead>
                                    <tr>
                                        <th>卡号</th><th>车牌号码</th><th>办理时间</th><th>到期时间</th>
                                    </tr>
                                    </thead>
                                    <tbody id="admin_tokensTBody">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="adm_fareModal">
                    <div class="modal-dialog modal-lg modal_position">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">停车费用（普通计费）</h4>
                            </div>
                            <div class="modal-body">
                                <table id="admin_fares_tb" class="table">
                                    <thead>
                                    <tr>
                                        <th>车牌号码</th>
                                        <th>开始时间</th>
                                        <th>结束时间</th>
                                        <th>总时长(h)</th>
                                        <th>费用</th>
                                    </tr>
                                    </thead>
                                    <tbody id="admin_faresTBody">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <table id="admin_driversTable" role="table" class='table table-bordered'>
                <thead>
                <tr>
                    <th>driverId</th><th>车主姓名</th><th>性别</th><th>手机号码</th><th>身份证号码</th><th>所在地</th><th>车辆信息</th><th>停车记录</th><th>停车费用</th><th>卡券</th><th>操作</th>
                </tr>
                </thead>
                <tbody id='admin_drivers_body'></tbody>
            </table>
        </div>
    </div>
    <div class="col-md-3">
        <div class="calendar">
            <div class="header">
                <a data-action="prev-month" href="javascript:void(0)" title="Previous Month"><i></i></a>
                <div class="text" data-render="month-year"></div>
                <a data-action="next-month" href="javascript:void(0)" title="Next Month"><i></i></a>
            </div>
            <div class="months" data-flow="left">
                <div class="month month-a">
                    <div class="render render-a"></div>
                </div>
                <div class="month month-b">
                    <div class="render render-b"></div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    var faresShown = false;
    var carsMsgShown = false;
    var parkingTimeShown = false;
    var tokensShown = false;

    $.ajax({
        type: 'get',
        url: '${pageContext.request.contextPath}/driverController/showDrivers',
        dataType: 'json',
        success: function (result) {
            if(result != null){
                for(var i = 0; i < result.length; i++){
                    var driver = result[i];
                    var tr = "<tr><th>"+driver.driverId+"</th><th>"+driver.driverName+"</th>\n" +
                        "<th>"+driver.gender+"</th><th>"+driver.phone+"</th>\n" +
                        "<th>"+driver.idCardNum+"</th><th>"+driver.address+"</th>\n" +
                        "<th><i data-toggle=\"modal\" data-target=\"#adm_carsModal\" onclick=\"adm_showCars(this)\" class=\"fa fa-car\"> </i></th>" +
                        "<th><i data-toggle=\"modal\" data-target=\"#adm_timesModal\" onclick=\"adm_showTimes(this)\" class=\"fa fa-clock\"> </i></th>\n" +
                        "<th><i data-toggle=\"modal\" data-target=\"#adm_fareModal\" onclick=\"adm_showFare(this)\" class=\"fa fa-university\"> </i></th>" +
                        "<th><i data-toggle=\"modal\" data-target=\"#adm_tokensModal\" onclick=\"adm_showTokens(this)\" class=\"fa fa-credit-card\"> </i></th>"+
                        "<th><a onclick='deleteDriver(this)' class=\"del\">删除</a></th></tr>";
                    $("#admin_drivers_body").append(tr);
                }
            }
        }
    });

    $("#driverAdding_btn").click(function () {
        // $("#admin_driverForm").on("submit",function (e) {
        //     var e = e;
        // });
        $("#driverAddingModal").modal("hide");

    });

    function deleteDriver(item) {
        var driverId = $(item).parents('tr').children()[0].innerHTML;
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/driverController/deleteDriver',
            data:{
                "driverId":driverId
            }
        });
        $(item).parents('tr').remove();
    }

    function adm_showCars(item) {
        var driverId = $(item).parents('tr').children()[0].innerHTML;
        if(!carsMsgShown){
            carsMsgShown = true;

            $.ajax({
                type: 'get',
                url: '${pageContext.request.contextPath}/carController/findCarsByDriverId.driverId',
                data: {
                    "driverId": driverId
                },
                dataType: 'json',
                success: function (result) {
                    if(result != null){

                        for (var i = 0; i < result.length; i++) {
                            var car = result[i];
                            var tr = "<tr id='"+car.carId+"'><th>"+car.licenseNum+"</th><th>"+car.brand+"</th><th>"+car.color+"</th></tr>";
                            $("#admin_carsTBody").append(tr);

                            if(car.formulaId == 1){
                                var th = "<th id='f1'>普通计费</th>";
                                $("#"+car.carId).append(th);
                            }else if(car.formulaId == 2){
                                var th = "<th id='f2'>月卡</th>";
                                $("#"+car.carId).append(th);
                            }else if(car.formulaId == 3){
                                var th = "<th id='f3'>年卡</th>";
                                $("#"+car.carId).append(th);
                            }else {
                                var th = "<th id='f4'>---</th>";
                                $("#"+car.carId).append(th);
                            }
                        }
                    }
                }
            })
        }
    }

    function adm_showTimes(item) {
        if (!parkingTimeShown){
            parkingTimeShown = true;
            var driverId = $(item).parents('tr').children()[0].innerHTML;

            $.ajax({
                type: 'get',
                url: '${pageContext.request.contextPath}/parkingTimeController/showTimes.driverId',
                data: {
                    "driverId": driverId
                },
                dataType: 'json',
                success: function (result) {
                    if(result != null){

                        for (var i = 0; i < result.length; i++) {
                            var time = result[i];

                            var begin = new Date(time.beginTime);
                            var b = begin.getFullYear()+"-"+(begin.getMonth()+1)+"-"+begin.getDate()+" "+begin.getHours()+":"+begin.getMinutes()+":"+begin.getSeconds();

                            var end = new Date(time.endTime);
                            var e = end.getFullYear()+"-"+(end.getMonth()+1)+"-"+end.getDate()+" "+end.getHours()+":"+end.getMinutes()+":"+end.getSeconds();
                            var tr = "<tr id='"+time.timeId+"'><th>"+time.licenseNum+"</th><th>"+b+"</th><th>"+e+"</th><th>"+time.totalTime+"</th></tr>";
                            $("#admin_timesTBody").append(tr);
                        }
                    }
                }
            })
        }
    }

    function adm_showTokens(item) {
        if(!tokensShown){
            var driverId = $(item).parents('tr').children()[0].innerHTML;
            $.ajax({
                type: 'get',
                url: '${pageContext.request.contextPath}/tokenController/showTokens.driverId',
                data: {
                    "driverId":driverId
                },
                dataType: 'json',
                success: function (result) {
                    tokensShown = true;
                    for (var i = 0;i < result.length;i++){
                        var token = result[i];
                        var begin = new Date(token.beginTime);
                        var b = begin.getFullYear()+"-"+(begin.getMonth()+1)+"-"+begin.getDate();
                        var end = new Date(token.endTime);
                        var e = end.getFullYear()+"-"+(end.getMonth()+1)+"-"+end.getDate();
                        var tr = "<tr><th>"+token.tokenNum+"</th><th>"+token.licenseNum+"</th><th>"+b+"</th><th>"+e+"</th></tr>";
                        $("#admin_tokensTBody").append(tr);
                    }
                }
            })
        }
    }

    function adm_showFare(item) {
        if (!faresShown){
            faresShown = true;
            var driverId = $(item).parents('tr').children()[0].innerHTML;

            $.ajax({
                type: 'get',
                url: '${pageContext.request.contextPath}/fareController/showFares',
                data: {
                    "driverId": driverId
                },
                dataType: 'json',
                success: function (result) {
                    if(result != null){

                        for (var i = 0; i < result.length; i++) {
                            var fare = result[i];

                            var begin = new Date(fare.beginTime);
                            var b = begin.getFullYear()+"-"+(begin.getMonth()+1)+"-"+begin.getDate()+" "+begin.getHours()+":"+begin.getMinutes()+":"+begin.getSeconds();

                            var end = new Date(fare.endTime);
                            var e = end.getFullYear()+"-"+(end.getMonth()+1)+"-"+end.getDate()+" "+end.getHours()+":"+end.getMinutes()+":"+end.getSeconds();
                            var tr = "<tr id='"+fare.fareId+"'><th>"+fare.licenseNum+"</th><th>"+b+"</th><th>"+e+"</th><th>"+fare.totalTime+"</th><th>"+fare.total+"</th></tr>";
                            $("#admin_faresTBody").append(tr);
                        }
                    }
                }
            })
        }
    }






    //以下為更改部分
    var userMsgShown = false;
    var carsMsgShown = false;
    var parkingTimeShown = false;
    var tokensShown = false;
    var faresShown = false;
    var paid = false;
    var oldFormula;
    //显示个人信息
    function showUserMsg() {
        // $("#member_body").empty();
        if (!userMsgShown){
            userMsgShown = true;

            var username = "${sessionScope.user.username}";

            var table = "<table id=\"user_tb\" class=\"table\"><thead><tr><th></th><th>用户基本信息</th><th></th></tr></thead></table>";
            $("#userMsg_tab").append(table);

            $.ajax({
                type: 'get',
                url: '${pageContext.request.contextPath}/driverController/getDriverMsg.username',
                data: {
                    "username": username
                },
                dataType: 'json',
                success: function (result) {
                    if(result != null){
                        var driverId = result.driverId;
                        var tBody = "<tbody id='"+driverId+"'></tbody>";
                        $("#user_tb").append(tBody);

                        var t1 = "<tr id='t1' style='height: 50px'><th>姓名</th><th id='t1_th2'>"+result.driverName+"</th><th><a id='t1_a1' onclick='modifyUserMsg(this)'>修改</a><a id='t1_a2' onclick='cancelModification(this)' hidden>取消 </a><a id='t1_a3' onclick='confirmModification(this)' hidden>保存</a></th></tr>";
                        var t2 = "<tr id='t2' style='height: 50px'><th>性别</th><th id='t2_th2'>"+result.gender+"</th><th><a id='t2_a1' onclick='modifyUserMsg(this)'>修改</a><a id='t2_a2' onclick='cancelModification(this)' hidden>取消 </a><a id='t2_a3' onclick='confirmModification(this)' hidden>保存</a></th></tr>";
                        var t3 = "<tr id='t3' style='height: 50px'><th>手机号码</th><th id='t3_th2'>"+result.phone+"</th><th><a id='t3_a1' onclick='modifyUserMsg(this)'>修改</a><a id='t3_a2' onclick='cancelModification(this)' hidden>取消 </a><a id='t3_a3' onclick='confirmModification(this)' hidden>保存</a></th></tr>";
                        var t4 = "<tr id='t4' style='height: 50px'><th>身份证号码</th><th id='t4_th2'>"+result.idCardNum+"</th><th><a id='t4_a1' onclick='modifyUserMsg(this)'>修改</a><a id='t4_a2' onclick='cancelModification(this)' hidden>取消 </a><a id='t4_a3' onclick='confirmModification(this)' hidden>保存</a></th></tr>";
                        var t5 = "<tr id='t5' style='height: 50px'><th>所在地</th><th id='t5_th2'>"+result.address+"</th><th><a id='t5_a1' onclick='modifyUserMsg(this)'>修改</a><a id='t5_a2' onclick='cancelModification(this)' hidden>取消 </a><a id='t5_a3' onclick='confirmModification(this)' hidden>保存</a></th></tr>";
                        $("#"+driverId).append(t1,t2,t3,t4,t5);

                    }
                }
            })
        }
    }

    function cancelModification(item) {
        var tr_id = $(item).parents("tr").attr("id");
        var value = $("#"+tr_id+"_th2")[0].children[0].value;

        if( tr_id == "t2"){
            if(value == "男"){
                value = "男";
            }else{
                value = "女";
            }
        }

        $("#"+tr_id+"_th2").empty();
        $("#"+tr_id+"_th2").append(value);

        $("#"+tr_id+"_a1").show();
        $("#"+tr_id+"_a2").hide();
        $("#"+tr_id+"_a3").hide();
    }

    //修改个人信息
    function modifyUserMsg(item) {
        var tr_id = $(item).parents("tr").attr("id");

        var value = $("#"+tr_id+"_th2")[0].textContent;
        $("#"+tr_id+"_th2").empty();
        if (tr_id == "t1") {
            $("#"+tr_id+"_th2").append("<input style='width: 300px' type=\"text\" placeholder=\"请输入姓名\" value='"+value+"'>");
        }else if (tr_id == "t2"){
            $("#"+tr_id+"_th2").append("<input type=\"radio\" name=\"gender\" value=\"男\" checked>男<input type=\"radio\" name=\"gender\" value=\"女\">女");
        } else if (tr_id == "t3"){
            $("#"+tr_id+"_th2").append("<input style='width: 300px' type=\"number\" placeholder=\"请输入手机号码\" value='"+value+"'>");
        }else if (tr_id == "t4"){
            $("#"+tr_id+"_th2").append("<input style='width: 300px' type=\"text\" placeholder=\"请输入身份证号码\" value='"+value+"'>");
        }else if (tr_id == "t5"){
            $("#"+tr_id+"_th2").append("<input style='width: 300px' type=\"text\" placeholder=\"请输入所在地\" value='"+value+"'>");
        }
        $("#"+tr_id+"_a1").hide();
        $("#"+tr_id+"_a2").show();
        $("#"+tr_id+"_a3").show();
    }

    //确认修改信息
    function confirmModification(item) {
        var driverId = ${sessionScope.user.driverId}
        var tr_id = $(item).parents("tr").attr("id");
        var value = $("#"+tr_id+"_th2")[0].children[0].value;
        if( tr_id == "t2"){
            value = $("input[type='radio']:checked").val();
        }

        var change;
        if (tr_id == "t1") {
            change = driverId+"#t1#"+value;
        }else if (tr_id == "t2"){
            change = driverId+"#t2#"+value;
        } else if (tr_id == "t3"){
            change = driverId+"#t3#"+value;
        }else if (tr_id == "t4"){
            change = driverId+"#t4#"+value;
        }else if (tr_id == "t5"){
            change = driverId+"#t5#"+value;
        }

        if( tr_id == "t2"){
            if(value == "男"){
                value = "男";
            }else{
                value = "女";
            }
        }

        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/driverController/modifyMsg.change',
            data: {
                "change":change
            },
            dataType: 'json',
            success:function (result) {

            }
        })

        $("#"+tr_id+"_th2").empty();
        $("#"+tr_id+"_th2").append(value);

        $("#"+tr_id+"_a1").show();
        $("#"+tr_id+"_a2").hide();
        $("#"+tr_id+"_a3").hide();
    }

    //显示停车记录
    function showParkingTime() {
        if (!parkingTimeShown){
            parkingTimeShown = true;
            // var table = "<table class='table table-bordered'><thead><tr><th>车牌号码</th><th>开始时间</th><th>结束时间</th><th>总时长(h)</th></tr></thead><tbody id='time_body'></tbody></table>";
            // $("#parkingTime_tab").append(table);
            var driverId = ${sessionScope.user.driverId};

            $.ajax({
                type: 'get',
                url: '${pageContext.request.contextPath}/parkingTimeController/showTimes.driverId',
                data: {
                    "driverId": driverId
                },
                dataType: 'json',
                success: function (result) {
                    if(result != null){

                        for (var i = 0; i < result.length; i++) {
                            var time = result[i];

                            var begin = new Date(time.beginTime);
                            var b = begin.getFullYear()+"-"+(begin.getMonth()+1)+"-"+begin.getDate()+" "+begin.getHours()+":"+begin.getMinutes()+":"+begin.getSeconds();

                            var end = new Date(time.endTime);
                            var e = end.getFullYear()+"-"+(end.getMonth()+1)+"-"+end.getDate()+" "+end.getHours()+":"+end.getMinutes()+":"+end.getSeconds();
                            var tr = "<tr id='"+time.timeId+"'><th>"+time.licenseNum+"</th><th>"+b+"</th><th>"+e+"</th><th>"+time.totalTime+"</th></tr>";
                            $("#time_body").append(tr);
                        }
                    }
                }
            })
        }

    }

    //显示拥有的车辆信息
    function showCars() {
        var driverId = "${sessionScope.user.driverId}";
        if(!carsMsgShown){
            carsMsgShown = true;

            $.ajax({
                type: 'get',
                url: '${pageContext.request.contextPath}/carController/findCarsByDriverId.driverId',
                data: {
                    "driverId": driverId
                },
                dataType: 'json',
                success: function (result) {
                    if(result != null){

                        for (var i = 0; i < result.length; i++) {
                            var car = result[i];
                            var tr = "<tr id='"+car.carId+"'><th>"+car.licenseNum+"</th><th>"+car.brand+"</th><th>"+car.color+"</th></tr>";
                            $("#carsTBody").append(tr);

                            if(car.formulaId == 1){
                                var th = "<th id='f1'>普通计费</th>";
                                $("#"+car.carId).append(th);
                            }else if(car.formulaId == 2){
                                var th = "<th id='f2'>月卡</th>";
                                $("#"+car.carId).append(th);
                            }else if(car.formulaId == 3){
                                var th = "<th id='f3'>年卡</th>";
                                $("#"+car.carId).append(th);
                            }else {
                                var th = "<th id='f4'>---</th>";
                                $("#"+car.carId).append(th);
                            }

                            var a = "<th><a onclick='showEditModal(this)' class=\"edit\" data-toggle=\"modal\" data-target=\"#carsTable\">编辑</a><a onclick='deleteCar(this)' class=\"del\">删除</a></th>";
                            $("#"+car.carId).append(a);
                        }
                    }
                }
            })
        }
    };

    function deleteCar(item) {

        var carId = $(item).parents('tr')[0].id;

        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/carController/deleteCar.carId',
            data: {
                "carId":carId
            }
        });
        $(item).parents('tr').remove();
    }

    function showEditModal(item) {
        var carId = $(item).parents('tr')[0].id;
        var licenseNum = $(item).parents('tr')[0].children[0].innerHTML;
        var brand = $(item).parents('tr')[0].children[1].innerHTML;
        var color = $(item).parents('tr')[0].children[2].innerHTML;
        oldFormula = $(item).parents('tr')[0].children[3].innerHTML;

        $("h4[title='carsTable']").text("编辑");
        $("h4[title='carsTable']").attr("id","modal_"+carId);
        $("#licenseNum").val(licenseNum);
        $("#brand").val(brand);
        $("#color").val(color);
    }

    function addCar() {
        $("h4[title='carsTable']").text("添加");
        $("h4[title='carsTable']").removeAttr("id");
        $("#licenseNum").val("");
        $("#brand").val("");
        $("#color").val("");
    }

    function modifyOrAdd() {
        var carId = $("h4[title='carsTable']")[0].id.substring(6);
        if (carId == "" || carId == null ||carId == undefined){
            var isOk = checkModal();
            if (isOk){
                addCarMsg();
            }
        }else {
            var isOk = checkModal();
            if (isOk){
                modifyCarMsg(carId);
            }
        }
    }

    //检查车辆信息不能为空
    function checkModal() {
        if ($('#licenseNum').val().trim()==='') {
            bootbox.alert({
                title: "温馨提示",
                message: "车牌号码不能为空",
                closeButton:false
            })
            hasNullMes = true;
            return false;
        }
        if ($('#brand').val().trim()==='') {
            bootbox.alert({
                title: "温馨提示",
                message: "汽车品牌不能为空",
                closeButton:false
            })
            hasNullMes = true;
            return false;
        }
        if ($('#color').val().trim()==='') {
            bootbox.alert({
                title: "温馨提示",
                message: "汽车颜色不能为空",
                closeButton:false
            })
            hasNullMes = true;
            return false;
        }
        return true;
    }

    //ajax添加车辆
    function addCarMsg() {
        var licenseNum = $("#licenseNum").val();
        var brand = $("#brand").val();
        var color = $("#color").val();
        var formula = $("#formula")[0].value;

        var formulaId;
        if(formula == "普通计费"){
            formulaId = 1;
        }else if(formula == '月卡'){
            formulaId = 2;
        }else if(formula == '年卡'){
            formulaId = 3;
        }
        var car = {
            "carId":0,
            "licenseNum":licenseNum,
            "brand":brand,
            "color":color,
            "formulaId":formulaId,
            "driverId":"${sessionScope.user.driverId}"
        }

        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/carController/addCar.car',
            data: car,
            dataType: 'json',
            success: function (result) {
                $("#carsTable").modal('hide');

                var tr = "<tr id='"+result.carId+"'><th>"+result.licenseNum+"</th><th>"+result.brand+"</th><th>"+result.color+"</th></tr>";
                $("#carsTBody").append(tr);

                if(result.formulaId == 1){
                    var th = "<th id='f1'>普通计费</th>";
                    $("#"+result.carId).append(th);
                }else if(result.formulaId == 2){
                    var th = "<th id='f2'>月卡</th>";
                    $("#"+result.carId).append(th);
                }else if(result.formulaId == 3){
                    var th = "<th id='f3'>年卡</th>";
                    $("#"+result.carId).append(th);
                }else {
                    var th = "<td id='f4'>---</td>";
                    $("#"+car.carId).append(th);
                }

                var a = "<th><a onclick='showEditModal(this)' class=\"edit\" data-toggle=\"modal\" data-target=\"#carsTable\">编辑</a><a onclick='deleteCar(this)' class=\"del\">删除</a></th>";
                $("#"+result.carId).append(a);
            }
        })
    }

    function modifyCarMsg(carId) {
        var licenseNum = $("#licenseNum").val();
        var brand = $("#brand").val();
        var color = $("#color").val();
        var formula = $("#formula")[0].value;

        var formulaId;
        if(formula == "普通计费"){
            formulaId = 1;
        }else if(formula == '月卡'){
            formulaId = 2;
            $("#tokenAddingModal").modal("show");
        }else if(formula == '年卡'){
            formulaId = 3;
            $("#tokenAddingModal").modal("show");
        }
        var car = {
            "carId":carId,
            "licenseNum":licenseNum,
            "brand":brand,
            "color":color,
            "formulaId":formulaId,
            "driverId":"${sessionScope.user.driverId}"
        };
        $("#carMsg_p").empty();
        $("#carMsg_p").append(JSON.stringify(car));

        if(formulaId == 1){
            paid = true;
            modifyCar(car,100);
            $("#carsTable").modal('hide');
        }
    }

    //ajax修改车辆信息
    function modifyCar(car,code) {
        if (paid && code == 100){
            var formula;
            if(car.formulaId == 1){
                formula = "普通计费";
            }else if(car.formulaId == 2){
                formula = "月卡";
            }else if(car.formulaId == 3){
                formula = '年卡';
            }
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/carController/modifyCar.car',
                data: car,
                dataType: 'json',
                success: function (result) {
                    paid = false;
                    $("tr#"+car.carId).empty();
                    var tds = "<th>"+car.licenseNum+"</th><th>"+car.brand+"</th><th>"+car.color+"</th><th>"+formula+"</th>"+
                        "<th><a onclick='showEditModal(this)' class=\"edit\" data-toggle=\"modal\" data-target=\"#carsTable\">编辑</a><a onclick='deleteCar(this)' class=\"del\">删除</a></th>";
                    $("tr#"+car.carId).append(tds);
                }
            })
        }
    }

    function addToken() {
        var carJson = $("#carMsg_p")[0].textContent;
        var car = JSON.parse(carJson);

        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/tokenController/addToken.car',
            data: car,
            dataType: 'json',
            success: function (result) {
                paid = true;
                $("#tokenAddingModal").modal('hide');

                if(result.code == 200){
                    alert(result.error);
                }else if (result.code == 100){
                    if (tokensShown){
                        var token = result.token;
                        var begin = new Date(token.beginTime);
                        var b = begin.getFullYear()+"-"+(begin.getMonth()+1)+"-"+begin.getDate();
                        var end = new Date(token.endTime);
                        var e = end.getFullYear()+"-"+(end.getMonth()+1)+"-"+end.getDate();
                        var tr = "<th>"+token.tokenNum+"</th><th>"+result.licenseNum+"</th><th>"+b+"</th><th>"+e+"</th>";
                        $("#tokens_body").append(tr);
                    }
                }

                $("#tokenAddingModal").on('hidden.bs.modal',function () {
                    modifyCar(car,result.code);
                    $("#carsTable").modal('hide');
                });
            }
        });
    }

    function showTokens() {
        if(!tokensShown){
            $.ajax({
                type: 'get',
                url: '${pageContext.request.contextPath}/tokenController/showTokens.driverId',
                data: {
                    "driverId":${sessionScope.user.driverId}
                },
                dataType: 'json',
                success: function (result) {
                    tokensShown = true;
                    for (var i = 0;i < result.length;i++){
                        var token = result[i];
                        var begin = new Date(token.beginTime);
                        var b = begin.getFullYear()+"-"+(begin.getMonth()+1)+"-"+begin.getDate();
                        var end = new Date(token.endTime);
                        var e = end.getFullYear()+"-"+(end.getMonth()+1)+"-"+end.getDate();
                        var tr = "<tr><th>"+token.tokenNum+"</th><th>"+token.licenseNum+"</th><th>"+b+"</th><th>"+e+"</th></tr>";
                        $("#tokens_body").append(tr);
                    }
                }
            })
        }
    }

    function showFare() {
        if (!faresShown){
            faresShown = true;
            var driverId = ${sessionScope.user.driverId};

            $.ajax({
                type: 'get',
                url: '${pageContext.request.contextPath}/fareController/showFares',
                data: {
                    "driverId": driverId
                },
                dataType: 'json',
                success: function (result) {
                    if(result != null){

                        for (var i = 0; i < result.length; i++) {
                            var fare = result[i];

                            var paid;
                            if(fare.paid == 0){
                                paid = "<th id='paid_th_"+fare.fareId+"'><a onclick='addFareId(this)' data-toggle='modal' data-target='#payModal'>未支付</a></th>";
                            }else {
                                paid = "<th id='paid_th_"+fare.fareId+"'>已支付</th>";
                            }

                            var begin = new Date(fare.beginTime);
                            var b = begin.getFullYear()+"-"+(begin.getMonth()+1)+"-"+begin.getDate()+" "+begin.getHours()+":"+begin.getMinutes()+":"+begin.getSeconds();

                            var end = new Date(fare.endTime);
                            var e = end.getFullYear()+"-"+(end.getMonth()+1)+"-"+end.getDate()+" "+end.getHours()+":"+end.getMinutes()+":"+end.getSeconds();
                            var tr = "<tr id='"+fare.fareId+"'><th>"+fare.licenseNum+"</th><th>"+b+"</th><th>"+e+"</th><th>"+fare.totalTime+"</th><th>"+fare.total+"</th>"+paid+"</tr>";
                            $("#faresTBody").append(tr);
                        }
                    }
                }
            })
        }
    }

    function addFareId(item) {
        var fareId = $(item).parents("tr")[0].id;
        $("h4[title='payModalTitle']").attr("id","payModal_"+fareId);
    }

    function hasPaid() {
        var fareId = $("h4[title='payModalTitle']").attr("id").substring(9);
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/fareController/pay',
            data: {
                "fareId": fareId
            }
        });
        $("#paid_th_"+fareId).empty();
        $("#paid_th_"+fareId).append("已支付");
        $("#payModal").modal("hide");
    }

    function showParking() {
        $("#parking_body").empty();
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/parkingController/showParkings',
            dataType:'json',
            success:function (result) {
                var red_icon = "<th><i class=\"fa fa-bus fa-2x\" aria-hidden=\"true\" style='color: red'> </i></th>";
                var grey_icon = "<th><i class=\"fa fa-bus fa-2x\" aria-hidden=\"true\" style='color: grey'> </i></th>";
                var tr0 = "<tr id='parking_0'></tr>";
                var tr1 = "<tr id='parking_1'></tr>";
                var tr2 = "<tr id='parking_2'></tr>";
                var tr3 = "<tr id='parking_3'></tr>";
                var tr4 = "<tr id='parking_4'></tr>";
                var tr5 = "<tr id='parking_5'></tr>";
                var tr6 = "<tr id='parking_6'></tr>";
                var tr7 = "<tr id='parking_7'></tr>";
                var tr8 = "<tr id='parking_8'></tr>";
                var tr9 = "<tr id='parking_9'></tr>";

                $("#parking_body").append(tr0,tr1,tr2,tr3,tr4,tr5,tr6,tr7,tr8,tr9);

                for(var i=0; i < result.length; i++){
                    var parking = result[i];

                    var j = i%10;
                    if (parking.occupied == 1){
                        $("#parking_"+j).append(red_icon);
                    }else {
                        $("#parking_"+j).append(grey_icon);
                    }
                }
            }
        });
    }

</script>
</html>
