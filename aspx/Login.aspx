<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="aspx_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link rel="icon" href="../../favicon.ico"/>
    <title>登陆</title>
    <!-- Bootstrap core CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet"/>

</head>
<body>

    <div class="container">

        <form class="form-signin" runat="server" >
            <h2 class="form-signin-heading" style="text-align: center;">登陆</h2>
            
            <!--type="email"-->
            <asp:TextBox  class="form-control id-style" placeholder="用户名" id="inputEmail" runat="server"></asp:TextBox>
            
            <!-- type="password"-->
            <asp:TextBox class="form-control pwd-style" placeholder="密码" id="inputPassword" runat="server"/>
            
            <asp:TextBox class="form-control" placeholder="验证码" id="inputVFCode" runat="server"/>
            
            <label>验证码：</label>
            <asp:Button ID="VFCode" class="btn" runat="server" Text="" />
            <div class="checkbox">
                <label>
                    <input type="checkbox" value="remember-me"/>
                    保存密码
                </label>
            </div>
            <asp:Button class="btn btn-lg btn-primary btn-block" type="submit" runat="server" Text="确认"/>
        </form>

    </div> <!-- /container -->

</body>
</html>
