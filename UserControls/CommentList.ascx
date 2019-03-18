<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CommentList.ascx.cs" Inherits="UserControls_CommetnList" %>    
     

<asp:DataList ID="dlComments" runat="server">
    <ItemTemplate>
        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Ime") %>'></asp:Label>
        <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Datum") %>'></asp:Label>
        <p id="text" runat="server"><%# Eval("Sadrzaj") %> </p>                
    </ItemTemplate>
</asp:DataList>

