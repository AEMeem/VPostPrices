<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="DiscountPolicyRestriction.aspx.cs" Inherits="VPostPrices_ControlPanel.DiscountPolicyRestriction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3><asp:Label ID="PermissonLabel" runat="server" ForeColor="Red"></asp:Label></h3>
   <div id="PageView" runat="server">
    <h3>ربط منتج مع سياسة خصم</h3>
    <div dir="rtl">
        <table style="width: 5%;">
            <tr>
                <td><label>رقم سياسة الخصم</label></td>
                <td><asp:DropDownList ID="AddDiscountIdDDL" runat="server"></asp:DropDownList></td>  
            </tr>
            <tr>
                <td><label>تفضيلات الشحن</label></td>
                <td><asp:DropDownList ID="AddNameArDDL" runat="server"></asp:DropDownList></td>  
            </tr>
            <tr>
                <td><label>إستثنائات</label></td>
                <td><asp:CheckBox ID="IsRestricted" runat="server" /></td>
            </tr>
            <tr>
                <td><asp:Button ID="AddDiscountToProduct" Text="ربط خصم مع منتج" runat="server" OnClick="AddDiscountToProduct_Click" /></td>
            </tr>
        </table>

    </div>
    <h3>المنتجات المربوطة بسياسات الخصم</h3>
    <div dir="RTL">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="20" BackColor="#DEE1E2"  HeaderStyle-Font-Bold="true"  ForeColor="Black"   OnPageIndexChanging="GridView1_PageIndexChanging">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="الرقم" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="PloicyId" HeaderText="رقم سياسية الخصم" SortExpression="PloicyId" />
            <asp:BoundField DataField="NameAr" HeaderText="المنتجات" SortExpression="NameAr" />
            <asp:CheckBoxField DataField="IsRestricted" HeaderText="يحتوي إستثنائات" SortExpression="IsRestricted" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PricingConnectionString %>" SelectCommand="ShowDiscountPolicyRestriction" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</div>
       </div>
</asp:Content>
