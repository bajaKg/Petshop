<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="IzmeniProizvod.aspx.cs" Inherits="IzmeniProizvod" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">        
    <style>
        td{
            width: 100px;
        }
    </style>    

    <table>
        <tr><td><asp:Image ID="Image1" runat="server" width="200px" height="200px" src='<%# Link.BuildAbsolute("/Images/" + Eval("Slika").ToString()) %>'/></td></tr>
        <br />
        <tr><td><asp:Label ID="Label1" runat="server" Text="Додај нову слику"></asp:Label></td>
        <td><asp:FileUpload ID="FileUpload1" runat="server" /></td></tr>         
        <br />
        <tr><td><asp:Label ID="lblTitle" runat="server" Text="Назив производа:"></asp:Label></td>
            <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
            <td><asp:Label ID="lblName" runat="server"></asp:Label></td>
        </tr>
        <br />
        <tr><td><asp:Label ID="lblValue" runat="server" Text="Цена:"><%# Eval("Cena").ToString() %></asp:Label></td>
            <td><asp:TextBox ID="txtPrice" runat="server"></asp:TextBox></td>
            <td><asp:Label ID="lblPrice" runat="server"></asp:Label></td>
        </tr>
        <br />
        <tr><td><asp:Label ID="lblDetails" runat="server" Text="Опис:" style="opacity:0.4;"><%# Eval("Opis").ToString() %></asp:Label></td>            
            <td><asp:TextBox ID="txtDescription" runat="server"></asp:TextBox></td>
            <td><asp:Label ID="lblDescription" runat="server"></asp:Label></td>
        </tr>            
        <br />        
        <tr><td><asp:Button ID="btnSave" runat="server" Text="Сачувај" OnClick="btnSave_Click" /></td>
        <td><asp:Button ID="btnAddNew" runat="server" Text="Додај нови" OnClick="btnAddNew_Click" /></td>
        <td><asp:Button ID="btnDelete" runat="server" Text="Обриши" OnClick="btnDelete_Click"/></td>
        </tr>
     </table>    
</asp:Content>

