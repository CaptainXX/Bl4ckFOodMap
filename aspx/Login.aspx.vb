Imports basicClasses
Imports MySql.Data.MySqlClient



Partial Class aspx_Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            VFCode.Text = MyRandString(4)
            CompareValidator1.ValueToCompare = VFCode.Text
        End If
        inputPassword.Attributes.Add("value", inputPassword.Text)
    End Sub

    Protected Sub VFCode_Click(sender As Object, e As EventArgs) Handles VFCode.Click
        VFCode.Text = MyRandString(4)
        CompareValidator1.ValueToCompare = VFCode.Text
    End Sub
    Protected Sub confirm_Click(sender As Object, e As EventArgs) Handles confirm.Click
        Dim id As String = "root"
        Dim pwd As String = "" ' push 前删除
        Dim dbid As String = "mishi"
        Dim useremail As String = ""
        Dim username As String = ""
        Dim userpwd As String = ""
        Dim userid As Integer = -1

        Dim conn As MySqlConnection = DatabaseConnect(id, pwd, dbid)

        Dim qstr As String = "select user_id, user_email, user_name, user_pwd from user;"

        Dim dr As MySqlDataReader = QueryExecute(conn, qstr)
        Try
            While (dr.Read())
                useremail = dr.GetString("user_email")
                username = dr.GetString("user_name")
                userpwd = dr.GetString("user_pwd")
                userid = dr.GetInt16("user_id")
                If inputEmail.Text = useremail And inputPassword.Text = userpwd Then
                    conn.Close()
                    Session("se_name") = username
                    Session("se_id") = userid
                    Response.Redirect("../Default.aspx")
                End If
            End While
        Catch ex As Exception

        End Try

        conf.Text = "用户名或密码错误"
    End Sub
End Class
