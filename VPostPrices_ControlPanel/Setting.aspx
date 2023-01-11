<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Setting.aspx.cs" Inherits="VPostPrices_ControlPanel.Setting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h3><asp:Label ID="PermissonLabel" runat="server" ForeColor="Red"></asp:Label></h3>
   <div id="PageView" runat="server">
    <h3>إضافة مستخدم جديد</h3>
    <div dir="rtl">
        <table style="width: 10%;">
            <tr>
                <td><label>أسم المستخدم</label></td>
                <td><asp:TextBox ID="UserName" runat="server" ValidateRequestMode="Disabled"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ErrorMessage="حقل مطلوب" ForeColor="Red" ControlToValidate="UserName" ValidationGroup="UserAdd"></asp:RequiredFieldValidator></td>
                <td><asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="اسم المستخدم  باللغة الإنجليزية" ForeColor="Red" ValidationExpression="^[A-Za-z ]{0,500}$" ControlToValidate="UserName" ValidationGroup="UserAdd" ></asp:RegularExpressionValidator></td>

            </tr>
            <tr>
               <td><label>الأسم باللغة العربية</label></td>
                <td><asp:TextBox ID="UserNameAR" runat="server"></asp:TextBox></td> 
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  ErrorMessage="حقل مطلوب" ForeColor="Red" ControlToValidate="UserNameAR" ValidationGroup="UserAdd"></asp:RequiredFieldValidator></td>
                <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="الأسم يجب أن يكون باللغة العربية" ForeColor="Red" ValidationExpression="^[\u0621-\u064A\040 ]{0,500}$" ControlToValidate="UserNameAR" ValidationGroup="UserAdd" ></asp:RegularExpressionValidator></td>

            </tr>

                <tr>
               <td><label>صلاحية الإعدادات</label></td>
                <td><asp:CheckBox ID="SettingCheck" runat="server"></asp:CheckBox></td>    
            </tr>

               <tr>
               <td><asp:Button ID="AddUser" Text="إضافة مستخدم جديد"  ValidationGroup="UserAdd" runat="server" OnClick="AddUser_Click"></asp:Button></td> 
           </tr>
        </table>

    </div>
     
   


     <h3>الصلاحيات الحالية للمستخدمين</h3>
    <div dir="rtl">
        <asp:GridView ID="CurrentPermisson" runat="server" AutoGenerateColumns="False" BackColor="#DEE1E2"  HeaderStyle-Font-Bold="true"  ForeColor="Black" OnRowDeleting="CurrentPermisson_RowDeleting" DataSourceID="SqlDataSource1" DataKeyNames="ID">
            <Columns>
                <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="ArName" HeaderText="ArName" SortExpression="ArName" />
                <asp:CheckBoxField DataField="WithSettings" HeaderText="WithSettings" SortExpression="WithSettings" Visible="false" />
                <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" Visible="false" />
                <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" Visible="false" />
                <asp:CheckBoxField DataField="IsDelete" HeaderText="IsDelete" SortExpression="IsDelete"  Visible="false"/>
                <asp:BoundField DataField="DeleteBy" HeaderText="DeleteBy" SortExpression="DeleteBy" Visible="false" />
                <asp:BoundField DataField="DeleteDate" HeaderText="DeleteDate" SortExpression="DeleteDate" Visible="false" />
                <asp:CommandField ShowDeleteButton="true" DeleteText="حذف المستخدم" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PricingConnectionString %>" SelectCommand="ShowUserPages" SelectCommandType="StoredProcedure" DeleteCommand="DeleteUser" DeleteCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="ArName" Type="String" />
                <asp:Parameter Name="WithSettings" Type="Boolean" />
                <asp:Parameter Name="CreatedBy" Type="String" />
                <asp:Parameter Name="DeleteBy" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>

    </div>
       </div>
</asp:Content>
