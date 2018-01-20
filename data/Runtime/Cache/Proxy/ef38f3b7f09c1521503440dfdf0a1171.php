<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录</title>
    <link href="__TMPL__statics/css/newstyle.css" rel="stylesheet" type="text/css">
    <script>
        var BAO_PUBLIC = '__PUBLIC__';
        var BAO_ROOT = '__ROOT__';
    </script>
    <script src="__PUBLIC__/js/jquery.js"></script>
    <script src="__PUBLIC__/js/web.js"></script>
    <script src="__PUBLIC__/js/layer/layer.js"></script>
    <script>
        function psw(el) {
            if (el.value == '密码') {
                el.value = '';
                el.type = 'password';
            }
        }

        function txt(el) {
            if (!el.value) {
                el.type = 'text';
                el.value = '密码';
            }
        }
        $(function () {
            $('.loginintw').on('focus',function (e) {
                e.target.style.border="1px solid #1c99fa"
              })
            $('.loginintw').on('blur',function (e) {
                e.target.style.border="solid 1px #dbdfe2"
              })
          })
    </script>
    <style>
        * {
            box-sizing: border-box;
        }
        input:-webkit-autofill{
            -webkit-box-shadow: 0 0 0 1000px white inset;
        }
        .w {
            width: 1094px;
            margin: 0 auto;
            position: relative;
        }

        .login_top {
            border: none;
        }

        .login_topnr {
            line-height: 85px;
            height: 85px;
        }

        .login_topt {
            font-size: 26px;
            color: #333;
            padding-left: 34px;
        }

        .bg {
            background-image: linear-gradient(90deg, #0971f2 0%, #1c99fa 100%);
            height: 600px;
        }
        .login_nr{
            padding: 0;
            height: 100%;
            /* overflow: hidden; */
            overflow: visible;
            transition: border-color 0;
        }
        .login_nr_l{
            padding: 0;
            width: 600px;
            height: 600px;
            position: absolute;
            left: 0;
            bottom: 0;
            background: url('__TMPL__statics/images/pic_dailishang_login_2_600x600.png') center/cover no-repeat;
        }
        .login_nr_l i,
        .login_nr_l s
        {
            position: absolute;
            top:196px;
            left:0px;
            width: 76px;
            height: 76px;
            background: url('__TMPL__statics/images/pic_dailishang_cloud76x76.png') center/cover no-repeat;
        }
        .login_nr_l s{
            top:112px;
            left:126px;
            transform: scale(.6);
        }
        @keyframes could1{
            0%{
                transform: translate(0,0);
            }
            50%{
                transform: translate(25px,-15px);
            }
            100%{
                transform: translate(0,0);
            }
        }
        @keyframes could2{
            0%{
                transform: translate(0,0) scale(.6);
            }
            50%{
                transform: translate(17px,-10px) scale(.6);
            }
            100%{
                transform: translate(0,0) scale(.6);
            }
        }
        .login_nr_l i{
            animation: could1 5s infinite;
        }
        .login_nr_l s{
            animation: could2 8s infinite;
        }
        .login_nr_r{
            position: absolute;
            right: 0;
            top: 83px;
            height: 434px;
            width: 392px;
            padding: 0;
            background: white;
        }
        .login_intnr{
            width: 100%;
            height: 100%;
            border: none;
            padding: 40px 46px 0;
        }
        .login_t{
            font-size: 20px;
            color: #333;
            line-height: 20px;
            padding: 0;
            border: none;
        }
        .login_intBox{
            padding: 30px 0 0;
        }
        .login_intyz{
            line-height: 44px;
            height: 44px;
            padding: 0;
            margin-bottom: 18px;
            overflow: hidden;
        }
        .tuanfabu_int{
            /* line-height: 44px; */
            height: 44px;
            border-radius: 4px;
            color: #333;
            outline: none;
            transition:all 0s;
        }
        .tuanfabu_int::-webkit-input-placeholder{
            color: #babdc2;
            font-weight: 300;
        }
        .loginintw2{
            width:193px;
        }
        .login_dl{
            background: #1c99fa;
            border: none;
            outline: none;
            margin: 0;
            width: 100%;
            line-height: 44px;
            height: 44px;
            border-radius: 4px;
            font-size: 14px !important;
            font-weight: 300;
        }
        .login_yzm{
            padding-left: 5px;
            height: 45px;
            width: 103px;
        }
        .login_yzm a{
            display: inline-block;
            height: 100%;
            width: 100%;
        }
        .login_yzm a img{
            height: 41px;
            width: 100%;
        }
        .btn{
            margin-top: 38px;
        }
        .login_dl:hover{
            background: #0971f2;
        }
        .login_dl:active{
            background: #0971f2;
        }
        .err{
            margin-top: 18px;
        }
        .wrong{
            background: #ffa09f;
            color: #ff3a3a;
            text-align: center;
            border-radius: 4px;
        }
    </style>
</head>

<body>
    <iframe id="baocms_frm" name="baocms_frm" style="display:none;"></iframe>
    <div class="login_top w">
        <div class="login_topnr">
            <div class="left login_topt">代理商管理中心</div>
            <div class="right">
                <ul>
                    <!-- <li class="left login_topli"><a href="<?php echo U('pchome/index/index');?>">回到首页sdc</a></li> -->
                </ul>
            </div>
        </div>
    </div>
    <div class="bg">
        <div class="login_nr w">
            <div class="left login_nr_l">
                <i></i>
                <s></s>
                <img src="__TMPL__statics/images/pic_dailishang_login600x600.png" />
            </div>
            <div class="left login_nr_r">
                <div class="radius3 login_intnr">
                    <div class="login_t">代理商登录</div>
                    <div class="login_intBox">
                        <form method="post" action="<?php echo U('login/index');?>" target="baocms_frm">
                            <div class="login_intyz">
                                <!-- <input type="text" placeholder="支持QQ号/邮箱/手机号登录" onblur="if (!value) { value = defaultValue; this.style.color = '#999' }" onclick="if (value == defaultValue) { value = ''; this.style.color = '#000' }"
                                    class="radius3 tuanfabu_int loginintw" name="account" /> -->
                                <input type="text" placeholder="请输入用户名" class="radius3 tuanfabu_int loginintw" name="work_mobile" />
                            </div>
                            <div class="login_intyz">
                                <!-- <input type="text" placeholder="密码" name="password" onfocus="psw(this)" onblur="txt(this)" class="radius3 tuanfabu_int loginintw"/> -->
                                <input type="password" placeholder="请输入密码" name="work_password" class="radius3 tuanfabu_int loginintw"/>
                            </div>
                            <div class="login_intyz">
                                <!-- <input type="text" name="yzm" placeholder="验证码" onblur="if (!value) { value = defaultValue; this.style.color = '#999' }"
                                    onclick="if (value == defaultValue) { value = ''; this.style.color = '#000' }" class="radius3 tuanfabu_int loginintw loginintw2"/> -->
                                <input type="text" name="yzm" placeholder="请输入验证码" class="radius3 tuanfabu_int loginintw loginintw2"/>
                                <span class="login_yzm">
                                    <a href="#">
                                        <img id="bao_img_code" src="__ROOT__/index.php?g=app&m=verify&a=index&mt=<?php echo time();?>"
                                            width="75" height="36" />
                                    </a>
                                </span>
                            </div>
                            <!-- <div class="login_intyz wrong">
                                    用户名/密码错误
                            </div> -->
                            <div class="login_intyz btn">
                                <input class="radius3 mask_an mask_qd login_dl" type="submit" value="确认登录" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>