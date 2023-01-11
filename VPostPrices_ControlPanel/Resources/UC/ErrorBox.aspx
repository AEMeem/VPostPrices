<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ErrorBox.aspx.vb" Inherits="RelativeIqrar.Web.ErrorBox" MasterPageFile="~/Popup.master" %>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <div class="MsgsBody" onload="window.returnValue='yes';">


        <asp:Label CssClass="lblMessage" ID="lblmsgbox" runat="server" Text="Label"></asp:Label>


        <input onclick="window.returnValue = 'yes'; window.close();" type="button" value="اغلاق" class="inputBtn btn btn-blue">
    </div>
</asp:Content>
