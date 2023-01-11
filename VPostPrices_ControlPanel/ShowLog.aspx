<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ShowLog.aspx.cs" Inherits="VPostPrices_ControlPanel.ShowLog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>سجل الاحداث</h3>
    <div dir="rtl">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" BackColor="#DEE1E2"  HeaderStyle-Font-Bold="true"  ForeColor="Black"  PageSize="20" OnPageIndexChanging="GridView1_PageIndexChanging" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="ID" HeaderText="الرقم" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
        <asp:BoundField DataField="LogDate" HeaderText="التاريخ" SortExpression="LogDate" />
        <asp:BoundField DataField="Log_Text" HeaderText="الرسالة" SortExpression="Log_Text" />
    </Columns>
</asp:GridView>
      </div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PricingConnectionString%>" SelectCommand="ShowLogData" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
