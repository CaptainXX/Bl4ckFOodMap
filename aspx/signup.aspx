<%@ Page Language="VB" AutoEventWireup="false" CodeFile="signup.aspx.vb" Inherits="aspx_signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>注册</title>
    <!-- Bootstrap core CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet"/>

</head>
<body>
    <div id="container" class="container">
        <form id="form1" runat="server">
            <h4 class="form-signin-heading">注册</h4>
            <table>
                <tr>
                    <td>输入邮箱</td>
                    <td><asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="邮箱地址"></asp:TextBox></td>
                    <td>
                        <asp:RegularExpressionValidator ID="Emailvalidator1" runat="server" ErrorMessage="请输入正确邮箱地址" Display="Dynamic" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="Emailvalidator2" runat="server" ErrorMessage="请输入邮箱地址" ControlToValidate="email"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>输入昵称</td>
                    <td><asp:TextBox ID="name" runat="server" CssClass="form-control" placeholder="昵称"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="NameValidator1" runat="server" ErrorMessage="请输入昵称" ControlToValidate="name" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="NameValidator2" runat="server" ErrorMessage="请设置昵称在4-10个字符之间" ControlToValidate="name" Display="Dynamic" ValidationExpression="^\w{4,10}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>设置密码</td>
                    <td><asp:TextBox ID="password" runat="server" CssClass="form-control" placeholder="密码" TextMode="Password"></asp:TextBox></td>
                    <td>
                        <asp:RegularExpressionValidator ID="PasswordValidator1" runat="server" ErrorMessage="密码必须大于八位" ControlToValidate="password" ValidationExpression="^\w{8,}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="PasswordValidator2" runat="server" ErrorMessage="请设置密码" ControlToValidate="password" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>重复输入密码</td>
                    <td><asp:TextBox ID="repeatpassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox></td>
                    <td>
                        <asp:CompareValidator ID="RepeatPasswordValidator1" runat="server" ErrorMessage="输入密码不一致" Display="Dynamic" ControlToValidate="repeatpassword" ControlToCompare="password"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        输入验证码
                    </td>
                    <td>
                        <asp:TextBox ID="inputVFCode" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="VFCode" class="btn" runat="server" Text="" />
                        <asp:CompareValidator ID="VFCValidator1" runat="server" ErrorMessage="验证码错误" ControlToValidate="inputVFCode" Display="Dynamic"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="confirm" class="btn btn-lg btn-primary btn-block" type="submit" runat="server" Text="确认"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
