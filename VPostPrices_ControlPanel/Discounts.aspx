<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Discounts.aspx.cs" Inherits="VPostPrices_ControlPanel.Discounts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3><asp:Label ID="PermissonLabel" runat="server" ForeColor="Red"></asp:Label></h3>
   <div id="PageView" runat="server">
    <h3>إضافة خصم جديد</h3>
    <div dir="rtl">
        <table style="width: 25%;">
            <tr>
                <td><Label>أسم الخصم باللغة العربية</Label></td>
                <td><asp:TextBox ID="NameAr" runat="server"></asp:TextBox> </td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameAr" ValidationGroup="AddDsicount" ErrorMessage="حقل مطلوب" ForeColor="Red"></asp:RequiredFieldValidator></td>
                <td><asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="أدخل حروف عربية فقط" ForeColor="Red" ValidationExpression="^[\u0621-\u064A\040 ]{0,500}$" ControlToValidate="NameAr" ValidationGroup="AddDsicount" ></asp:RegularExpressionValidator></td>

                </tr>
            <tr>
                 <td><Label>أسم الخصم باللغة الإنجليزية</Label></td>
                <td><asp:TextBox ID="NameEn" runat="server"></asp:TextBox> </td>     
                 <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="NameEn" ValidationGroup="AddDsicount" ErrorMessage="حقل مطلوب" ForeColor="Red"></asp:RequiredFieldValidator></td>
                <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter English letters" ForeColor="Red" ValidationExpression="^[A-Za-z ]{0,500}$" ControlToValidate="NameEn" ValidationGroup="AddDsicount" ></asp:RegularExpressionValidator></td>

            </tr>
            <tr>
                <td><Label>كود الخصم</Label></td>
                <td><asp:TextBox ID="Code" runat="server"></asp:TextBox> </td>     
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Code" ValidationGroup="AddDsicount" ErrorMessage="حقل مطلوب" ForeColor="Red"></asp:RequiredFieldValidator></td>

            </tr>
             <tr>
                <td><Label>فعال</Label></td>
                <td><asp:Checkbox ID="IsActive" runat="server"></asp:Checkbox> </td>     
            </tr>
            <tr>
               <td> <asp:Button ID="AddDiscount" Text="إضافة الخصم" ValidationGroup="AddDsicount" runat="server" OnClick="AddDiscount_Click" /> </td>
            </tr>

            <tr>
                <td><asp:Label ID="ErrorLabel" runat="server" ForeColor="Red"></asp:Label> </td>
            </tr>
        </table>

    </div>
    <h3>الخصومات الحالية</h3>
    <div dir="rtl">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="20" BackColor="#DEE1E2"  HeaderStyle-Font-Bold="true"  ForeColor="Black"  OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging">
        <Columns>
            <asp:TemplateField HeaderText="الرقم" InsertVisible="False" SortExpression="Id">             
                <ItemTemplate>
                    <asp:Label ID="Id" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="اسم الخصم بالعربي" SortExpression="NameAr">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NameAr") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="أدخل حروف عربية فقط" ForeColor="Red" ValidationExpression="^[\u0621-\u064A\040 ]{0,500}$" ControlToValidate="TextBox1"></asp:RegularExpressionValidator>

                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("NameAr") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="اسم الخصم بالانجليزي" SortExpression="NameEn">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("NameEn") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ErrorMessage="*" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Enter English Letters" ForeColor="Red" ValidationExpression="^[A-Za-z ]{0,500}$" ControlToValidate="TextBox2"></asp:RegularExpressionValidator>

                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("NameEn") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="كود الخصم" SortExpression="Code">         
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Code") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="IsActive" HeaderText="فعال" SortExpression="IsActive" />
            <asp:BoundField DataField="CreateBy" HeaderText="CreateBy" SortExpression="CreateBy" Visible="False" />
            <asp:BoundField DataField="CreationDate" HeaderText="CreationDate" SortExpression="CreationDate" Visible="false" />
            <asp:BoundField DataField="UpdateBy" HeaderText="UpdateBy" SortExpression="UpdateBy" Visible="false" />
            <asp:BoundField DataField="UpdateDate" HeaderText="UpdateDate" SortExpression="UpdateDate" Visible="false"/>
            <asp:CheckBoxField DataField="IsDelete" HeaderText="IsDelete" SortExpression="IsDelete" Visible="false" />
            <asp:BoundField DataField="DeleteBy" HeaderText="DeleteBy" SortExpression="DeleteBy" Visible="false" />
            <asp:BoundField DataField="DeletedDate" HeaderText="DeletedDate" SortExpression="DeletedDate" Visible="false" />
            <asp:CommandField ShowEditButton="true" EditText="[تعديل]" ShowDeleteButton="true" DeleteText="[حذف]" ShowCancelButton="true" CancelText="[إلغاء]" UpdateText="[تحديث]" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PricingConnectionString %>" SelectCommand="ShowDiscounts" SelectCommandType="StoredProcedure" DeleteCommand="DeleteDiscounts" DeleteCommandType="StoredProcedure" OnSelecting="SqlDataSource1_Selecting" UpdateCommand="Updatediscounts" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />          
            <asp:Parameter Name="IsDelete" Type="Byte" />
            <asp:Parameter Name="DeleteBy" Type="String" />
            <asp:Parameter Name="DeletedDate" Type="DateTime" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="NameAr" Type="String" />
            <asp:Parameter Name="NameEn" Type="String" />
            <asp:Parameter Name="Code" Type="String" />
            <asp:Parameter Name="IsActive" Type="Boolean" />
            <asp:Parameter Name="CreateBy" Type="String" />
            <asp:Parameter Name="CreationDate" Type="DateTime" />
            <asp:Parameter Name="UpdateBy" Type="String" />
            <asp:Parameter Name="UpdateDate" Type="DateTime" />        
        </UpdateParameters>
        </asp:SqlDataSource>
</div>
       </div>
</asp:Content>
