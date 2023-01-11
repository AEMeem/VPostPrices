<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="VPostPrices_ControlPanel.VPost_Main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            height: 26px;
        }
        .auto-style4 {
            text-align: center;
            width: 48px;
        }
        .auto-style7 {
            font-size: xx-large;
        }
        .auto-style8 {
            text-align: center;
            font-family: URWGeometricArabic-Bold, Roboto, sans-serif;
            font-size: xx-large;
            color: #6658DD;
            width: 48px;
        }
        .auto-style10 {
            height: 26px;
            width: 797px;
            text-align: center;
        }
        .auto-style12 {
            text-align: center;
            font-family: URWGeometricArabic-Bold, Roboto, sans-serif;
            font-size: xx-large;
            color: #6658DD;
            width: 797px;
        }
        .auto-style13 {
            text-align: left;
            width: 48px;
        }
        .auto-style15 {
            text-align: right;
            width: 527px;
        }
        .auto-style16 {
            text-align: center;
            height: 26px;
            width: 48px;
        }
        .auto-style17 {
            text-align: right;
            height: 26px;
            width: 527px;
        }
        .auto-style18 {
            width: 527px;
        }
        .auto-style19 {
            height: 26px;
            width: 527px;
        }
        .auto-style20 {
            text-align: center;
            width: 527px;
        }
        .auto-style21 {
            text-align: center;
            width: 797px;
        }
        .auto-style22 {
            width: 48px;
        }
        .auto-style23 {
            height: 26px;
            width: 48px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                &nbsp;</td>
            <td class="auto-style21">
                <asp:ImageButton ID="ImageButton1" runat="server" Height="156px" ImageUrl="~/assets/Main/Product.png" OnClick="ImageButton1_Click" PostBackUrl="~/ProductMain.aspx" Width="182px" />
            </td>
            <td class="auto-style20">
                <asp:ImageButton ID="ImageButton2" runat="server" Height="156px" ImageUrl="~/assets/Main/Discount.png" OnClick="ImageButton2_Click" PostBackUrl="~/DiscountMain.aspx" Width="182px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style21">
                <asp:HyperLink ID="HyperLink6" runat="server" CssClass="auto-style7" ForeColor="Black" NavigateUrl="~/ProductMain.aspx">تفضيلات الشحن</asp:HyperLink>
            </td>
            <td class="auto-style20">
                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="auto-style7" NavigateUrl="~/DiscountMain.aspx" ForeColor="Black"> الخصومات</asp:HyperLink>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style16">
                </td>
            <td class="auto-style10">
                </td>
            <td class="auto-style17"></td>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style21">
                &nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style21">
                &nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style21">
                &nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style21">
                &nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style21">
                &nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style21">
                <asp:ImageButton ID="ImageButton3" runat="server" Height="156px" ImageUrl="~/assets/Main/Countrys.png" PostBackUrl="~/Countries.aspx" Width="182px" />
            </td>
            <td class="auto-style20">
                <asp:ImageButton ID="ImageButton4" runat="server" Height="156px" ImageUrl="~/assets/Main/Vendor.png" PostBackUrl="~/Vendors.aspx" Width="182px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style21">
                <asp:HyperLink ID="HyperLink3" runat="server" CssClass="auto-style7" NavigateUrl="~/Countries.aspx" ForeColor="Black">إدارة الدول</asp:HyperLink>
            </td>
            <td class="auto-style20">
                <asp:HyperLink ID="HyperLink5" runat="server" CssClass="auto-style7" NavigateUrl="~/Vendors.aspx" ForeColor="Black">إدارة مقدمي الخدمات</asp:HyperLink>
            </td>
            <td>&nbsp;</td>
        </tr>
 <%--       <tr>
            <td class="auto-style5">
                <asp:HyperLink ID="HyperLink4" runat="server" CssClass="auto-style7" NavigateUrl="~/Currency.aspx">عرض وتعديل العملات</asp:HyperLink>
            </td>
            <td class="auto-style3"></td>
            <td class="auto-style3"></td>
        </tr>--%>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style21">
                &nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style21">
                &nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style21">
                &nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style21">
                &nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style21">
                &nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style21">
                &nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style21">
                <asp:ImageButton ID="ImageButton5" runat="server" Height="156px" ImageUrl="~/assets/Main/Log.png" PostBackUrl="~/ShowLog.aspx" Width="182px" />
            </td>
            <td class="auto-style18">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">
                &nbsp;</td>
            <td class="auto-style12">
                <asp:HyperLink ID="HyperLink7" runat="server" ForeColor="Black" NavigateUrl="~/ShowLog.aspx">سجل الأحداث</asp:HyperLink>
            </td>
            <td class="auto-style18">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">
                &nbsp;</td>
            <td class="auto-style12">
                &nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
