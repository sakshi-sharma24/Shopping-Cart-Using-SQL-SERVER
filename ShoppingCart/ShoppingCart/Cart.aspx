<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ShoppingCart.NewFolder1.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 46px;
        }
    </style>
    <script src="NewFolder1/Scripts/jquery-1.9.1.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            Shopping Cart<br />
            <br />
            <asp:Table ID="CartTable" runat="server" Width="100%" BorderStyle="Groove">
                <asp:TableHeaderRow>
                    <asp:TableCell Text="Product Name"></asp:TableCell>
                    <asp:TableCell Text="Quantity"></asp:TableCell>
                    <asp:TableCell Text="Price"></asp:TableCell>
                </asp:TableHeaderRow>
            </asp:Table>
        </div>
        <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ProductID" DataSourceID="SqlDataSource2" GridLines="Vertical" Height="241px" ShowFooter="True" Width="306px">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="ProductID" InsertVisible="False" SortExpression="ProductID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductID") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="lbInsert" onClick="lbInsert_Click" ValidationGroup="INSERT" runat="server">Insert</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PName" SortExpression="PName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator Text="*" ID="rfvEditName" runat="server" ErrorMessage="Name is Mandatory" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("PName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ValidationGroup="INSERT" Text="*" ID="rfvInsertName" runat="server" ErrorMessage="Name is Mandatory" ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PPrice" SortExpression="PPrice">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PPrice") %>'></asp:TextBox>
                     <asp:RequiredFieldValidator Text="*" ID="rfvEditPrice" runat="server" ErrorMessage="Price is Mandatory" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("PPrice") %>'></asp:Label>
                    </ItemTemplate>
                     <FooterTemplate>
                        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator  ValidationGroup="INSERT" Text="*" ID="rfvInsertPrice" runat="server" ErrorMessage="Price is Mandatory" ControlToValidate="txtPrice" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PQuantity" SortExpression="PQuantity">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("PQuantity") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator Text="*" ID="rfvEditQuantity" runat="server" ErrorMessage="Quantity is Mandatory" ControlToValidate="TextBox3" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("PQuantity") %>'></asp:Label>
                    </ItemTemplate>
                     <FooterTemplate>
                        <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ValidationGroup="INSERT" Text="*" ID="rfvInsertQuantity" runat="server" ErrorMessage="Quantity is Mandatory" ControlToValidate="txtQuantity" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>--%>
        <br />
       
        <%--<asp:ValidationSummary ValidationGroup="INSERT" ID="ValidationSummary3" ForeColor="Red" runat="server" />
        <asp:ValidationSummary ID="ValidationSummary4" runat="server" />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingCartConnectionString %>" DeleteCommand="DELETE FROM [CartProducts] WHERE [ProductID] = @ProductID" InsertCommand="INSERT INTO [CartProducts] ([PName], [PPrice], [PQuantity]) VALUES (@PName, @PPrice, @PQuantity)" SelectCommand="SELECT * FROM [CartProducts]" UpdateCommand="UPDATE [CartProducts] SET [PName] = @PName, [PPrice] = @PPrice, [PQuantity] = @PQuantity WHERE [ProductID] = @ProductID">
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
        </asp:SqlDataSource>--%>
        <br />
 <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PayableAmount
       
        <asp:Label ID="PayableAmount" runat="server">PayableAmount</asp:Label>

        <p>
            &nbsp;</p>

        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
        <asp:Button ID="Checkout" runat="server" Height="36px" OnClick="Button1_Click" Text="Checkout" Width="107px" BackColor="Red" ForeColor="Black" />
        </p>

</form>
    
</body>
</html>
