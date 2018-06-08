Imports basicClasses


Partial Class aspx_Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            VFCode.Text = MyRandString(4)
        End If
    End Sub

    Protected Sub VFCode_Click(sender As Object, e As EventArgs) Handles VFCode.Click
        VFCode.Text = MyRandString(4)
    End Sub
End Class
