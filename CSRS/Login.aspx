<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PSMS.Login" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


    <%--<script src="Scripts/AppScript.js"></script>--%>
    <link href="css/AppStyle.css" rel="stylesheet" />

    <style>
        body {
            background-image:none;
            /*background-color:#FFCB43;*/
        }

     
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div  style="width: auto; height: auto; margin-top: 5%;">
                    <div  style="width: 48%; float: left; border-right: solid 2px #c7081b; text-align: right; margin-right: 10px;">
                        <div style="padding-top: 80px; padding-right: 5px;">
                            <img src="images/Front.jpg" height="352" />
                        </div>
                        <div style="padding-right: 5px; font-size: 23px;color:#5e5858;letter-spacing:-1px;">DISASTER DASHBOARD SYSTEM</div>
                        <div style="padding-bottom: 45px;"></div>
                    </div>
                    <div  style="width: 50%; float: right;">
                        <div style="font-size: 80px; color: #000000; padding-top: 35px; margin-left: 135px;">DDS 1.0</div>
                        <div style="height:80px;"></div>
                        <div style="margin-top: 150px; margin-top: 35px;">
                            <label>User Name</label><br />
                            <telerik:RadTextBox ID="tbxLgnUserName" runat="server" MaxLength="50" TabIndex="1" Skin="Silk" Width="200px"></telerik:RadTextBox><br />
                            <label>Password</label><br />
                            <telerik:RadTextBox ID="tbxLgnPassword" runat="server" TextMode="Password" MaxLength="20" TabIndex="2" Skin="Silk" Width="200px"></telerik:RadTextBox><br />
                            <div style="padding-top: 15px;">
                                <asp:Button ID="btnLogin" runat="server" Text="Login"  CssClass="buttonStyle" BorderStyle="None" OnClick="btnLogin_Click" Width="100px" Height="30px"></asp:Button></div>
                        </div>
                        <div style="height:10px;">
                            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                        </div>
                        <div style="padding-top: 32px; line-height: 13px;">
                            <div style="float: left; width: 40%; font-size: 10px;">
                                DESIGN AND DEVELOPED BY<br />
                                Save the Children ICT DEV TEAM
                            </div>
                            <div style="float: right; width: 55%; font-size: 10px;">
                                COPYRIGHT
                                <br />
                                Save the Children in Bangladesh 
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</body>
</html>
