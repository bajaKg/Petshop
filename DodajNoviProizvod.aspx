<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DodajNoviProizvod.aspx.cs" Inherits="DodajNoviProizvod" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <style>
        td{
            width: 100px;
        }
    </style>    

    <table>
        <!--<tr><td><asp:Image ID="Image1" runat="server" width="200px" height="200px" src=''/></td></tr>-->        
        <tr><td><asp:Label ID="Label1" runat="server" Text="Додај нову слику"></asp:Label></td>
        <td><asp:FileUpload ID="FileUpload1" runat="server" /></td></tr>
        <tr><td><asp:Label ID="lblTitle" runat="server" Text="Назив производа:"></asp:Label></td>
            <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
            <td><asp:Label ID="lblName" runat="server"></asp:Label></td>
        </tr>
        <tr><td><asp:Label ID="lblValue" runat="server" Text="Цена:"></asp:Label></td>
            <td><asp:TextBox ID="txtPrice" runat="server"></asp:TextBox></td>
            <td><asp:Label ID="lblPrice" runat="server"></asp:Label></td>
        </tr>        
        <tr><td><asp:Label ID="lblDetails" runat="server" Text="Опис:" style="opacity:0.4;"></asp:Label></td>            
            <td><asp:TextBox ID="txtDescription" runat="server"></asp:TextBox></td>
            <td><asp:Label ID="lblDescription" runat="server"></asp:Label></td>
        </tr>                    
        <tr><td><asp:Label ID="lblCategory" runat="server" Text="Категорија: "></asp:Label></td>
            <td><asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="ldsCategory" DataTextField="Naziv" DataValueField="ID">
            </asp:DropDownList></td>
        </tr>
        <tr><td><asp:Button ID="btnSave" runat="server" Text="Сачувај" OnClick="btnSave_Click" /></td>
        <td>&nbsp;</td></tr>        
     </table>
        <asp:LinqDataSource ID="ldsCategory" runat="server" ContextTypeName="DataClassesPetShopDBDataContext" EntityTypeName="" TableName="kategorijas">
        </asp:LinqDataSource>
</asp:Content>

