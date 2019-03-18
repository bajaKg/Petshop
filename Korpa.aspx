<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Korpa.aspx.cs" Inherits="Korpa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">    
        <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" style="margin:25%;" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="gvCart_SelectedIndexChanged" DataKeyNames="IDProizvoda" OnRowDeleting="gvCart_RowDeleting">
            <Columns>
                <asp:BoundField DataField="Naziv" HeaderText="Назив" ReadOnly="True" SortExpression="Naziv" />
                <asp:BoundField DataField="Cena" HeaderText="Цена" ReadOnly="True" SortExpression="Cena" />
                <asp:BoundField DataField="Kolicina" HeaderText="Количина" ReadOnly="True" SortExpression="Kolicina" />

                <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Избаци" />

            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <br />
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DataClassesPetShopDBDataContext" EntityTypeName="" Select="new (Naziv, Cena, Kolicina)" TableName="komentar_views">
        </asp:LinqDataSource>
            

</asp:Content>

