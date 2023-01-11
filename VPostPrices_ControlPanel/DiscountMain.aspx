<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="DiscountMain.aspx.cs" Inherits="VPostPrices_ControlPanel.DiscountMain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:ImageButton ID="ImageButton1" runat="server" Height="125px" ImageUrl="~/assets/Main/AddDiscount.png" PostBackUrl="~/Discounts.aspx" Width="176px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3" style="text-align: center">
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="auto-style4" NavigateUrl="~/Discounts.aspx" style="font-size: xx-large" ForeColor="Black">إدارة الخصومات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" style="text-align: center">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3" style="text-align: center">
                <asp:ImageButton ID="ImageButton2" runat="server" Height="125px" ImageUrl="~/assets/Main/DiscountPolicy.png" PostBackUrl="~/DiscountPolicy.aspx" Width="176px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3" style="text-align: center">
                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="auto-style4" NavigateUrl="~/DiscountPolicy.aspx" style="font-size: xx-large" ForeColor="Black">إدارة سياسة الخصومات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" style="text-align: center">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3" style="text-align: center">
                <asp:ImageButton ID="ImageButton3" runat="server" Height="125px" ImageUrl="~/assets/Main/DiscountPolicyResricsons.png" PostBackUrl="~/DiscountPolicyRestriction.aspx" Width="176px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:HyperLink ID="HyperLink3" runat="server" CssClass="auto-style4" NavigateUrl="~/DiscountPolicyRestriction.aspx" style="font-size: xx-large" ForeColor="Black">إدارة القيود على الخصومات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
