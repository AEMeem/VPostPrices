<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="YesNoConfirmBox.aspx.vb" Inherits="RelativeIqrar.Web.YesNoConfirmBox" MasterPageFile="~/Popup.master" %>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <div class="MsgsBody" onload="document.all('btnNo').focus();">
        <div id="trMessage">
            <img src="../images/dialog.png" style="width: 28px; height: 27px" />
            <asp:Label ID="lblMessage" runat="server" CssClass="lblMessage"></asp:Label>
            <input onclick="Answer(true);" type="button" value="نعم" class="inputBtn btn btn-blue" style="width: 60px;" id="btnYes" name="btnYes">
            <input onclick="Answer(false);" type="button" value="لا" class="inputBtn btn btn-blue" style="width: 60px;" id="btnNo" name="btnNo"></td>
        </div>
    </div>

    <script>
        window.returnValue = false;
        window.document.onkeydown = function () {
            if (event.keyCode == 27) {
                window.close();
            }
        }
        document.all("trMessage").style.height = parseInt(window.dialogHeight, 10) - 35;

        function Answer(a) {
            window.returnValue = a;
            window.close();
        }
    </script>
</asp:Content>
