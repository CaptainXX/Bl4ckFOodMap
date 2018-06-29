Imports basicClasses
Imports MySql.Data.MySqlClient
Imports System.Net.Mail
Imports System.Timers


Partial Class aspx_signup
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        password.Attributes.Add("value", password.Text)
        repeatpassword.Attributes.Add("value", repeatpassword.Text)
    End Sub

    Protected Sub VFCode_Click(sender As Object, e As EventArgs) Handles VFCode.Click
        Dim Message As String = UCase(MyRandString(6)) ' 生成6位验证码
        Dim smtpServer As String = "smtp.qq.com"
        Dim mailId As String = "670909183@qq.com" ' push 前删除
        Dim mailAuthor As String = "oouaczvytitpbdde" ' push 前删除
        Dim mailClient = New SmtpClient
        Dim mailTarget As String = email.Text

        '检查邮箱是否已被注册
        Dim id As String = "root"
        Dim pwd As String = "!970712Iloveu" ' push 前删除
        Dim dbid As String = "mishi"
        Dim useremail As String = ""

        Dim conn As MySqlConnection = DatabaseConnect(id, pwd, dbid)

        Dim qstr As String = "select user_email from user;"

        Dim dr As MySqlDataReader = QueryExecute(conn, qstr)
        Try
            While (dr.Read())
                useremail = dr.GetString("user_email")
                If email.Text = useremail Then
                    Dim a = MsgBox("该邮箱已被注册,直接登录？", vbOKCancel) ' 显示选项 确定 | 取消 ，选择确定返回1，选择取消返回2
                    If a = 1 Then
                        Response.Redirect("../aspx/Login.aspx")
                    End If
                    conn.Close()
                    Return
                End If
            End While
        Catch ex As Exception

        End Try
        conn.Close()

        ' 发送邮件
        VFCValidator1.ValueToCompare = Message ' 设置比较验证器的值为发送出的验证码

        mailClient.EnableSsl = True
        mailClient.UseDefaultCredentials = False
        mailClient.DeliveryMethod = SmtpDeliveryMethod.Network ' 邮件发送方式
        mailClient.Host = smtpServer ' 指定smtp服务器
        mailClient.Credentials = New System.Net.NetworkCredential(mailId, mailAuthor) ' 指定发送邮件邮箱用户名密码
        Try
            Dim emailMessage = New MailMessage(mailId, mailTarget)

            emailMessage.Subject = "欢迎来到秘食！" ' 主题
            emailMessage.Body = "您的验证码是：<br />" + "<b>" + Message + "</b>" ' 内容
            emailMessage.BodyEncoding = Encoding.UTF8 ' 正文编码
            emailMessage.IsBodyHtml = True ' 设置为HTML格式
            emailMessage.Priority = MailPriority.Normal ' 优先级

            Try
                mailClient.Send(emailMessage)
                VFCode.Enabled = False
                VFCode.Text = "60s后再试"
                Timer1.Enabled = True
            Catch ex As Exception

            End Try
        Catch ex As Exception
            MsgBox("请先设置邮箱和密码")
        End Try



        'VFCode.Text = MyRandString(4)
        'VFCValidator1.ValueToCompare = VFCode.Text
    End Sub

    Protected Sub confirm_Click(sender As Object, e As EventArgs) Handles confirm.Click
        Dim id As String = "root"
        Dim pwd As String = "!970712Iloveu" ' push 前删除
        Dim dbid As String = "mishi"
        Dim useremail As String = email.Text
        Dim username As String = name.Text
        Dim userpwd As String = password.Text

        Dim conn As MySqlConnection = DatabaseConnect(id, pwd, dbid)

        Dim qstr As String = "insert into user (user_email, user_name, user_pwd, user_assignment, submission_date) values ('" + useremail + "', '" + username + "', '" + userpwd + "','', NOW());"

        QueryExecute(conn, qstr)
        conn.Close()

        Response.Redirect("../aspx/Login.aspx")

    End Sub

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        VFCode.Enabled = True
        VFCode.Text = "获取验证码"
        Timer1.Enabled = False
    End Sub
End Class
