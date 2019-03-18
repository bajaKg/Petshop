<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProductList.ascx.cs" Inherits="UserControls_ProductList" %>
    <asp:DataList ID="dlProducts" runat="server">
        <ItemTemplate>
            <div style="border: 1px dashed gray; margin-top:10%;">
                <a href="<%# Link.ToProduct(Eval("ID").ToString()) %>" >
                    <img width="100" border="0" src="<%# Link.BuildAbsolute("/Images/" + Eval("Slika").ToString()) %>" />                    
                </a> 
                <br />
                <asp:Label ID="lblName" runat="server" Text="Назив производа:"><%# Eval("Naziv").ToString() %></asp:Label>
                <br />
                <asp:Label ID="lblPrice" runat="server" Text="Цена:"><%# Eval("Cena").ToString() %></asp:Label>
                <br />
                <asp:Label ID="lblDescription" runat="server" Text="Опис:"><%# Eval("Opis").ToString() %></asp:Label>
            </div>
        </ItemTemplate>
    </asp:DataList>


