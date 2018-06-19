Imports basicClasses
Imports MySql.Data.MySqlClient


Partial Class aspx_signup
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            VFCode.Text = MyRandString(4)
            VFCValidator1.ValueToCompare = VFCode.Text
        End If
    End Sub

    Protected Sub VFCode_Click(sender As Object, e As EventArgs) Handles VFCode.Click
        VFCode.Text = MyRandString(4)
        VFCValidator1.ValueToCompare = VFCode.Text
    End Sub

    Protected Sub confirm_Click(sender As Object, e As EventArgs) Handles confirm.Click
        Dim id As String = "root"
        Dim pwd As String = ""
        Dim dbid As String = "mishi"
        Dim useremail As String = email.Text
        Dim username As String = name.Text
        Dim userpwd As String = password.Text

        Dim conn As MySqlConnection = DatabaseConnect(id, pwd, dbid)

        Dim qstr As String = "insert into user (user_email, user_name, user_pwd, user_assignment, submission_date) values ('" + useremail + "', '" + username + "', '" + userpwd + "','', NOW());"

        Dim dr As MySqlDataReader = QueryExecute(conn, qstr)

        Response.Redirect("../aspx/Login.aspx")

    End Sub
End Class
