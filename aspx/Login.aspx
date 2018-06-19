<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="aspx_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
            <asp:TextBox  class="form-control id-style" placeholder="邮箱地址" id="inputEmail" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="请输入有效邮箱" ControlToValidate="inputEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="请输入邮箱地址" ControlToValidate="inputEmail" EnableClientScript="True" Display="Dynamic"></asp:RequiredFieldValidator>
            <!-- type="password"-->
            <asp:TextBox class="form-control pwd-style" placeholder="密码" id="inputPassword" runat="server"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入密码" Display="Dynamic" ControlToValidate="inputPassword"></asp:RequiredFieldValidator>
            <asp:TextBox class="form-control" placeholder="验证码" id="inputVFCode" runat="server"/>
            
            <label>验证码：</label>
            <asp:Button ID="VFCode" class="btn" runat="server" Text="" />
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="inputVFCode" Display="Dynamic" ErrorMessage="验证码错误" CultureInvariantValues="True"></asp:CompareValidator>
            <div class="checkbox">
                <label>
                    <input type="checkbox" value="remember-me"/>
                    保存密码
                </label>
            </div>
            <asp:Button ID="confirm" class="btn btn-lg btn-primary btn-block" type="submit" runat="server" Text="确认"/>
        </form>
        <asp:Label ID="conf" runat="server" Text=""></asp:Label>
    </div> <!-- /container -->

</body>
</html>
