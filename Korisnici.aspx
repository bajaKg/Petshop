<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Korisnici.aspx.cs" Inherits="Korisnici" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2><%: Title %></h2>
        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" style="margin:15%;" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" DataKeyNames="IDKorisnika" OnRowDeleting="gvUsers_RowDeleting" OnRowEditing="gvUsers_RowEditing" OnRowUpdating="gvUsers_RowUpdating">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Ime" HeaderText="Име" ReadOnly="True" SortExpression="Ime" />
                <asp:BoundField DataField="Prezime" HeaderText="Презиме" ReadOnly="True" SortExpression="Prezime" />
                <asp:BoundField DataField="Username" HeaderText="Корисничко име" ReadOnly="True" SortExpression="UserName" />
                <asp:BoundField DataField="Password" HeaderText="Лозинка" ReadOnly="True" SortExpression="Password" />
                <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
                
                <asp:TemplateField HeaderText="Улога" SortExpression="Role" >
                    <EditItemTemplate>          
                        <asp:LinkButton runat="server" ID="UpdateButton" CommandName="Update" Text="Ажурирај"/>              
                        <asp:LinkButton runat="server" ID="CancelButton" CommandName="Cancel" Text="Откажи"/>              
                        <asp:DropDownList ID="dllRole" runat="server" SelectedValue='<%# Bind("Role") %>'>
                            <asp:ListItem>Изабери улогу</asp:ListItem>
                            <asp:ListItem>корисник</asp:ListItem>
                            <asp:ListItem>администратор</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Role" runat="server" Text='<%# Eval("Role") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Обриши" />
                <asp:ButtonField ButtonType="Button" CommandName="Edit" Text="Измени" />
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

        <p>&nbsp;</p>  
</asp:Content>

