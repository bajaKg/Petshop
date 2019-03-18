<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Psi.aspx.cs" Inherits="Psi" %>

<%@ Register src="UserControls/ProductList.ascx" tagname="ProductList" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <uc1:ProductList ID="ProductList1" runat="server" />
</asp:Content>

