<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Vendors.aspx.cs" Inherits="VPostPrices_ControlPanel.Vendors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3><asp:Label ID="PermissonLabel" runat="server" ForeColor="Red"></asp:Label></h3>
   <div id="PageView" runat="server">
    <div dir="rtl">
        <h3>إضافة مقدم خدمة جديد</h3>
        <table style="width: 20%;">
            <tr>
                <td><Label>أسم مقدم الخدمة باللغة العربية</Label></td>
                <td><asp:TextBox ID="NameAR" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ErrorMessage="حقل مطلوب" ForeColor="Red" ControlToValidate="NameAR" ValidationGroup="VenddorAdd"></asp:RequiredFieldValidator></td>
                <td><asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="أدخل حروف عربية فقط" ForeColor="Red" ValidationExpression="^[\u0621-\u064A\040 ]{0,500}$" ControlToValidate="NameAR" ValidationGroup="VenddorAdd" ></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
               <td><Label>أسم مقدم الخدمة باللغة الإنجليزية</Label></td>
                <td><asp:TextBox ID="NameEn" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ErrorMessage="حقل مطلوب" ForeColor="Red" ControlToValidate="NameEn" ValidationGroup="VenddorAdd"></asp:RequiredFieldValidator></td>
                <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter English Letters" ForeColor="Red" ValidationExpression="^[A-Za-z ]{0,500}$"  ControlToValidate="NameEn" ValidationGroup="VenddorAdd" ></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td><Label>الكود</Label></td>
                <td><asp:TextBox ID="VenderCode" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  ErrorMessage="حقل مطلوب" ForeColor="Red" ControlToValidate="VenderCode" ValidationGroup="VenddorAdd"></asp:RequiredFieldValidator></td>

            </tr>
            <tr>
                 <td><Label>تنشيط مقدم الخدمة</Label></td>
                <td><asp:checkbox ID="isActive" runat="server"></asp:checkbox></td>
            </tr>
                 <tr>      
                <td><asp:Button ID="AddVendor" OnClick="AddVendor_Click" Text="إضافة مقدم الخدمة" ValidationGroup="VenddorAdd" runat="server"></asp:Button></td>
            </tr>

            <tr>
                <td><asp:Label ID="VendorError" runat="server" ForeColor="Red"></asp:Label></td>
            </tr>
        </table>
    </div>
    <div dir="rtl">
         <h3>قائمة مقدمي الخدمة</h3>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEE1E2"  HeaderStyle-Font-Bold="true"  ForeColor="Black"   AllowPaging="True" PageSize="20" DataKeyNames="Id" DataSourceID="SqlDataSource1"
         OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging">
        <Columns>
            <asp:TemplateField HeaderText="الرقم" InsertVisible="False" SortExpression="Id">
                <EditItemTemplate>
                    <asp:Label ID="Id" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الأسم بالعربي" SortExpression="NameAR">
                <EditItemTemplate>
                    <asp:TextBox ID="NameAR" runat="server" Text='<%# Bind("NameAR") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server"  ErrorMessage="حقل مطلوب" ForeColor="Red" ControlToValidate="NameAR"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator50" runat="server" ErrorMessage="أدخل حروف عربية فقط" ForeColor="Red" ValidationExpression="^[\u0621-\u064A\040 ]{0,500}$" ControlToValidate="NameAR" ></asp:RegularExpressionValidator>

                    </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("NameAR") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الأسم بالانجليزي" SortExpression="NameEn">
                <EditItemTemplate>
                    <asp:TextBox ID="NameEn" runat="server" Text='<%# Bind("NameEn") %>'></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server"  ErrorMessage="حقل مطلوب" ForeColor="Red" ControlToValidate="NameEn"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator51" runat="server" ErrorMessage="أدخل حروف عربية فقط" ForeColor="Red" ValidationExpression="^[A-Za-z ]{0,500}$" ControlToValidate="NameEn" ></asp:RegularExpressionValidator>

                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("NameEn") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الكود" SortExpression="VenderCode">  
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("VenderCode") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="IsActive" HeaderText="فعال" SortExpression="IsActive" />
            <asp:BoundField DataField="CreateBy" HeaderText="CreateBy" SortExpression="CreateBy"  Visible="false" />
            <asp:BoundField DataField="CreationDate" HeaderText="CreationDate" SortExpression="CreationDate" Visible="false"  />
            <asp:BoundField DataField="UpdateBy" HeaderText="UpdateBy" SortExpression="UpdateBy"  Visible="false" />
            <asp:BoundField DataField="UpdateDate" HeaderText="UpdateDate" SortExpression="UpdateDate" Visible="false"  />
            <asp:CheckBoxField DataField="IsDelete" HeaderText="IsDelete" SortExpression="IsDelete" Visible="false"  />
            <asp:BoundField DataField="DeleteBy" HeaderText="DeleteBy" SortExpression="DeleteBy" Visible="false"  />
            <asp:BoundField DataField="DeletedDate" HeaderText="DeletedDate" SortExpression="DeletedDate" Visible="false"  />
            <asp:CommandField ShowCancelButton="true" ShowDeleteButton="true" ShowEditButton="true" UpdateText="[تحديث]" DeleteText="[حذف]" CancelText="[إلغاء]" EditText="[تعديل]" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PricingConnectionString %>" SelectCommand="ShowVendors" SelectCommandType="StoredProcedure" DeleteCommand="DeleteVendors" DeleteCommandType="StoredProcedure" UpdateCommand="UpdateVendors" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="IsDelete" Type="Byte" />
            <asp:Parameter Name="DeleteBy" Type="String" />
            <asp:Parameter Name="DeletedDate" Type="DateTime" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="NameAR" Type="String" />
            <asp:Parameter Name="NameEn" Type="String" />
            <asp:Parameter Name="VenderCode" Type="String" />
            <asp:Parameter Name="IsActive" Type="Byte" />
            <asp:Parameter Name="CreateBy" Type="String" />
            <asp:Parameter Name="CreationDate" Type="DateTime" />
            <asp:Parameter Name="UpdateBy" Type="String" />
            <asp:Parameter Name="UpdateDate" Type="DateTime" />
            <asp:Parameter Name="IsDelete" Type="Boolean" />
            <asp:Parameter Name="DeleteBy" Type="String" />
            <asp:Parameter Name="DeletedDate" Type="DateTime" />
        </UpdateParameters>
         </asp:SqlDataSource>
</div>
       </div>
</asp:Content>
