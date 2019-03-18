<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">    
        <h2><%: Title %></h2>
        <asp:GridView ID="TableUsers" runat="server" Width="300px">
                <Columns>                
                </Columns>
            </asp:GridView>
        <p>
            &nbsp;</p>        
</asp:Content>
