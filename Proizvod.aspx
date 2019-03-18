<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Proizvod.aspx.cs" Inherits="Proizvod" %>

<%@ Register src="UserControls/CommentList.ascx" tagname="CommentList" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">    
    <a href="">
        <!--<img  width="100" border="0" src="<%# Link.BuildAbsolute("/Images/" + Eval("Slika").ToString()) %>" id="imgProduct" /> -->
        <!--<asp:Image runat="server" src='<%# Link.BuildAbsolute("/Images/" + Eval("Slika").ToString()) %>' />-->
    </a>
    <asp:Image ID="Image1" runat="server" src='<%# Link.BuildAbsolute("/Images/" + Eval("Slika").ToString()) %>' style="width:500px; height:500px;"/>
    <br />
    <h3><asp:Label ID="lblName" runat="server" Text="Назив производа:"><%# Eval("Naziv").ToString() %></asp:Label></h3>
    <br />
    <asp:Label ID="lblPrice" runat="server" Text="Цена:"><%# Eval("Cena").ToString() %></asp:Label>
    <br/>
    <asp:Label ID="lblDescription" runat="server" Text="Опис:"><%# Eval("Opis").ToString() %></asp:Label>
    
    <br />       
    <asp:Button ID="btnEdit" runat="server" Text="Измени производ" OnClick="btnEdit_Click" />
    <asp:Button ID="btnAddNew" runat="server" Text="Додај нови" OnClick="btnAddNew_Click" />
    <asp:Button ID="btnAddToCart" runat="server" Text="Убаци у корпу" OnClick="btnAddToCart_Click" />            
        <br />
            
    
    <hr />
     <table>         
         <tr><td>Коментар: </td>
             <asp:Label ID="lblComment" runat="server" Visible="true">Пријави се да би оставио коментар.</asp:Label>
         <td><asp:TextBox id="txtComment" TextMode="multiline" Columns="50" Rows="5" runat="server" Visible="false"/></td></tr>                
         <tr><td><asp:Button ID="btnSaveComm" runat="server" Text="Пошаљи" OnClick="btnSaveComm_Click" Visible="false"/> </td> </tr>
     </table>
     <br />
     <hr />    
    <uc1:CommentList ID="CommentList1" runat="server" />    
</asp:Content>

