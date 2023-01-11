<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="DiscountTypes.aspx.cs" Inherits="VPostPrices_ControlPanel.DiscountTypes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div dir="ltr">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="NameAr" HeaderText="NameAr" SortExpression="NameAr" />
            <asp:BoundField DataField="NameEn" HeaderText="NameEn" SortExpression="NameEn" />
            <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
            <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" />
            <asp:BoundField DataField="CreateBy" HeaderText="CreateBy" SortExpression="CreateBy" Visible="false" />
            <asp:BoundField DataField="CreationDate" HeaderText="CreationDate" SortExpression="CreationDate" Visible="false" />
            <asp:BoundField DataField="UpdateBy" HeaderText="UpdateBy" SortExpression="UpdateBy" Visible="false" />
            <asp:BoundField DataField="UpdateDate" HeaderText="UpdateDate" SortExpression="UpdateDate" Visible="false" />
            <asp:CheckBoxField DataField="IsDelete" HeaderText="IsDelete" SortExpression="IsDelete" Visible="false" />
            <asp:BoundField DataField="DeleteBy" HeaderText="DeleteBy" SortExpression="DeleteBy" Visible="false" />
            <asp:BoundField DataField="DeletedDate" HeaderText="DeletedDate" SortExpression="DeletedDate" Visible="false" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PricingConnectionString %>" SelectCommand="ShowDiscountTypes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</div>
</asp:Content>
