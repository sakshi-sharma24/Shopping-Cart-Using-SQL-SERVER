<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ShoppingCart.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ProductID" DataSourceID="SqlDataSource1" OnRowCommand="Item_Added" ForeColor="#333333" GridLines="None" Height="221px" Width="369px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                <asp:BoundField DataField="PName" HeaderText="PName" SortExpression="PName" />
                <asp:BoundField DataField="PPrice" HeaderText="PPrice" SortExpression="PPrice" />
                <asp:BoundField DataField="PQuantity" HeaderText="PQuantity" SortExpression="PQuantity" />
                 <asp:TemplateField HeaderText="AddToCart">
                        <ItemTemplate>
                            <asp:Button Text="Add" runat="server" CommandName="Add" CommandArgument="<%#Container.DataItemIndex %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <EmptyDataTemplate>
                <asp:Button ID="Button2" runat="server" Text="Add" />
            </EmptyDataTemplate>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <br />
        <asp:Button ID="Button1" runat="server" BackColor="#FF99CC" Height="43px" OnClick="MovetoCart_Click" Text="Move To Cart" Width="137px" />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingCartConnectionString %>" DeleteCommand="DELETE FROM [CartProducts] WHERE [ProductID] = @ProductID" InsertCommand="INSERT INTO [CartProducts] ([PName], [PPrice], [PQuantity]) VALUES (@PName, @PPrice, @PQuantity)" SelectCommand="SELECT * FROM [CartProducts]" UpdateCommand="UPDATE [CartProducts] SET [PName] = @PName, [PPrice] = @PPrice, [PQuantity] = @PQuantity WHERE [ProductID] = @ProductID">
            <DeleteParameters>
                <asp:Parameter Name="ProductID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PName" Type="String" />
                <asp:Parameter Name="PPrice" Type="String" />
                <asp:Parameter Name="PQuantity" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PName" Type="String" />
                <asp:Parameter Name="PPrice" Type="String" />
                <asp:Parameter Name="PQuantity" Type="String" />
                <asp:Parameter Name="ProductID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
