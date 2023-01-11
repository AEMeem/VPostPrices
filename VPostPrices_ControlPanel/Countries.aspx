<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Countries.aspx.cs" Inherits="VPostPrices_ControlPanel.Countries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3><asp:Label ID="PermissonLabel" runat="server" ForeColor="Red"></asp:Label></h3>
   <div id="PageView" runat="server">
    <h3>إضافة دولة</h3>
    <div dir="rtl">
        <table style="width: 20%;">
            <tr>
                <td><label>أسم الدولة باللغة العربية</label></td>
                <td><asp:TextBox ID="CountryNameAr" runat="server" ValidateRequestMode="Disabled"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ErrorMessage="حقل مطلوب" ForeColor="Red" ControlToValidate="CountryNameAr" ValidationGroup="CountryAdd"></asp:RequiredFieldValidator></td>
                <td><asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="أدخل حروف عربية فقط" ForeColor="Red" ValidationExpression="^[\u0621-\u064A\040 ]{0,500}$" ControlToValidate="CountryNameAr" ValidationGroup="CountryAdd" ></asp:RegularExpressionValidator></td>

            </tr>
            <tr>
               <td><label>أسم الدولة باللغة الانجليزية</label></td>
                <td><asp:TextBox ID="CountryNameEn" runat="server"></asp:TextBox></td> 
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  ErrorMessage="حقل مطلوب" ForeColor="Red" ControlToValidate="CountryNameEn" ValidationGroup="CountryAdd"></asp:RequiredFieldValidator></td>
                <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter English Letters" ForeColor="Red" ValidationExpression="^[A-Za-z ]{0,500}$" ControlToValidate="CountryNameEn" ValidationGroup="CountryAdd" ></asp:RegularExpressionValidator></td>

            </tr>

             <tr>
                <td><label>عدد أيام إرسال التنبيهات للفاتورة</label></td>
                <td><asp:TextBox ID="TextBox3044" runat="server"></asp:TextBox></td> 
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"  ErrorMessage="حقل مطلوب" ForeColor="Red" ControlToValidate="TextBox3044" ValidationGroup="CountryAdd"></asp:RequiredFieldValidator> </td>
                <td><asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ForeColor="Red" ValidationGroup="CountryAdd" ControlToValidate="TextBox3044" ErrorMessage="يجب ان تكون القيمة رقمية وصحيحة" ValidationExpression="^\d{1,45}$"></asp:RegularExpressionValidator></td>
                 </tr>

            <tr>
                <td><label>كود الدولة</label></td>
                <td><asp:TextBox ID="CountryCode" runat="server"></asp:TextBox></td> 
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ErrorMessage="حقل مطلوب" ForeColor="Red" ControlToValidate="CountryCode" ValidationGroup="CountryAdd"></asp:RequiredFieldValidator> </td>
            </tr>

            <tr>
               <td><label>تنشيط الدولة</label></td>
               <td><asp:CheckBox ID="IsActive" runat="server"></asp:CheckBox></td> 
           </tr>

              <tr>
               <td><asp:Button ID="AddCountry" Text="إضافة الدولة" OnClick="AddCountry_Click" ValidationGroup="CountryAdd" runat="server"></asp:Button></td> 
           </tr>

            <tr>
                <td><asp:Label ID="CountryLabelError" runat="server" ForeColor="Red"></asp:Label></td>
            </tr>
        </table>

    </div>
       
    <h3>الدول المضافة</h3>
    <div dir="rtl">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="20" BackColor="#DEE1E2"  HeaderStyle-Font-Bold="true"  ForeColor="Black" DataKeyNames="CountryID" DataSourceID="SqlDataSource1"
         OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:TemplateField HeaderText="رقم الدولة" InsertVisible="False" SortExpression="رقم الدولة">
                <ItemTemplate>
                    <asp:Label ID="CountryID" runat="server" Text='<%# Bind("CountryID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="أسم الدولة باللغة العربية" SortExpression="أسم الدولة باللغة العربية">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CountryNameAR") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="حقل مطلوب" ForeColor="Red" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="أدخل حروف عربية فقط" ForeColor="Red" ValidationExpression="^[\u0621-\u064A\040 ]{0,500}$" ControlToValidate="TextBox1"  ></asp:RegularExpressionValidator></td>

                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CountryNameAR") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="أسم الدولة باللغة الإنجليزية" SortExpression="أسم الدولة باللغة الإنجليزية">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CountryNameEN") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ErrorMessage="حقل مطلوب" ForeColor="Red" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator54" runat="server" ErrorMessage="Enter English letters" ForeColor="Red" ValidationExpression="^[A-Za-z ]{0,500}$" ControlToValidate="TextBox2"  ></asp:RegularExpressionValidator></td>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("CountryNameEN") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

              <asp:TemplateField HeaderText="عدد ايام أرسال تنبيه للفاتورة" SortExpression="عدد ايام أرسال تنبيه للفاتورة">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox22" runat="server" Text='<%# Bind("NotificationDays") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator303" runat="server" ErrorMessage="حقل مطلوب" ForeColor="Red" ControlToValidate="TextBox22"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator60" runat="server" ForeColor="Red" ControlToValidate="TextBox22" ErrorMessage="يجب ان تكون القيمة رقمية وصحيحة" ValidationExpression="^\d{1,45}$"></asp:RegularExpressionValidator></td>

                    </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label33" runat="server" Text='<%# Bind("NotificationDays") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="كود الدولة" SortExpression="كود الدولة">             
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("CountryCode") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="IsActive" HeaderText="فعالة" SortExpression="فعالة" />
            <asp:BoundField DataField="CreateBy" HeaderText="CreateBy" SortExpression="CreateBy" Visible="False" />
            <asp:BoundField DataField="CreationDate" HeaderText="CreationDate" SortExpression="CreationDate" Visible="false"  />
            <asp:BoundField DataField="UpdateBy" HeaderText="UpdateBy" SortExpression="UpdateBy" Visible="false" />
            <asp:BoundField DataField="UpdateDate" HeaderText="UpdateDate" SortExpression="UpdateDate" Visible="false" />
            <asp:CheckBoxField DataField="IsDelete" HeaderText="IsDelete" SortExpression="IsDelete" Visible="false" />
            <asp:BoundField DataField="DeleteBy" HeaderText="DeleteBy" SortExpression="DeleteBy" Visible="false" />
            <asp:BoundField DataField="DeletedDate" HeaderText="DeletedDate" SortExpression="DeletedDate" Visible="false" />
            <asp:CommandField ShowEditButton="true" EditText="[تعديل]" ShowDeleteButton="true" DeleteText="[حذف]" ShowCancelButton="true" CancelText="[إلغاء]" UpdateText="[تحديث]" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ConnectionString="<%$ ConnectionStrings:PricingConnectionString %>" SelectCommand="ShowCountries" SelectCommandType="StoredProcedure" OnSelecting="SqlDataSource1_Selecting" DeleteCommand="DeleteCountries" DeleteCommandType="StoredProcedure" UpdateCommand="UpdateCountries" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="IsDelete" Type="Byte" />
            <asp:Parameter Name="DeleteBy" Type="String" />
            <asp:Parameter Name="DeletedDate" Type="DateTime" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="UpdateBy" Type="String" />
            <asp:Parameter Name="UpdateDate" Type="DateTime" /> 
        </UpdateParameters>
        </asp:SqlDataSource>
</div>
      </div>
</asp:Content>
