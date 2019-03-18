<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Разне врсте опреме и производа за акваристику</h2>
            <asp:Image ID="defaultImg" runat="server" src='<%# Link.BuildAbsolute("/Images/" + "default1.jpg") %>' />
            <img runat="server" src='<%# Link.BuildAbsolute("/Images/" + "default2.jpg") %>' />
            <img runat="server" src='<%# Link.BuildAbsolute("/Images/" + "default3.jpg") %>' />
            <a href="Akvaristika.aspx?CategoryID=3">Погледај овде..</a>
        </div>
        <div class="col-md-4">
            <h2>Опрема и храна за псе</h2>
            <asp:Image ID="Image1" runat="server" src='<%# Link.BuildAbsolute("/Images/" + "default1.jpg") %>' />
            <img runat="server" src='<%# Link.BuildAbsolute("/Images/" + "default2.jpg") %>' />
            <img runat="server" src='<%# Link.BuildAbsolute("/Images/" + "default3.jpg") %>' />
            <a href="Psi.aspx?CategoryID=1">Погледај овде..</a>
        </div>
        <div class="col-md-4">
            <h2>Храна и опрема за мачке</h2>
            <asp:Image ID="Image2" runat="server" src='<%# Link.BuildAbsolute("/Images/" + "default1.jpg") %>' />
            <img runat="server" src='<%# Link.BuildAbsolute("/Images/" + "default2.jpg") %>' />
            <img runat="server" src='<%# Link.BuildAbsolute("/Images/" + "default3.jpg") %>' />
            <a href="Macke.aspx?CategoryID=2">Погледај овде..</a>
        </div>
    </div>
</asp:Content>
