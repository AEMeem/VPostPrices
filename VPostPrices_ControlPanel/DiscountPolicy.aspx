<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="DiscountPolicy.aspx.cs" Inherits="VPostPrices_ControlPanel.DiscountPolicy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3><asp:Label ID="PermissonLabel" runat="server" ForeColor="Red"></asp:Label></h3>
   <div id="PageView" runat="server">
    <h3>إضافة سياسة خصم جديدة</h3>
    <div dir="rtl">
        <table style="width: 50%;">
            <tr>
                <td>اسم الخصم</td>
                <td><asp:DropDownList ID="DiscountNameAddDDL" runat="server"></asp:DropDownList></td>    
            </tr>
            <tr>
                <td>نوع الخصم</td>
                <td><asp:DropDownList ID="DiscountTypeAddDDL" runat="server"></asp:DropDownList></td> 
            </tr>
            <tr>
                <td>الدولة</td>
                <td><asp:DropDownList ID="CounrtyAddDDL" runat="server"></asp:DropDownList></td> 
            </tr>

            <tr>
                <td>مقدم الخدمة</td>
                <td><asp:DropDownList ID="VendorAddDDL" runat="server"></asp:DropDownList></td>
            </tr>

            <tr>
                <td>الخدمة</td>
                <td><asp:DropDownList ID="BillSystemtypeAddDDL" runat="server"></asp:DropDownList></td>   
            </tr>

         
            <tr>
                <td>قيمة الخصم</td>
                <td><asp:TextBox ID="DiscountValueAdd" runat="server"></asp:TextBox> </td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="حقل مطلوب" ControlToValidate="DiscountValueAdd" ValidationGroup="DiscountAdd"></asp:RequiredFieldValidator></td>
                <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ErrorMessage="يجب ان تكون القيمة رقمية"  ValidationExpression="^[-+]?\d+(\.\d+)?$" ControlToValidate="DiscountValueAdd" ValidationGroup="DiscountAdd"></asp:RegularExpressionValidator></td>
            </tr>


            <tr>
                <td>أقل قيمة للمنتج</td>
                <td><asp:TextBox ID="ProductMinValueAdd" runat="server"></asp:TextBox> </td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="حقل مطلوب" ForeColor="Red" ControlToValidate="ProductMinValueAdd" ValidationGroup="DiscountAdd"></asp:RequiredFieldValidator></td>
                <td><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="يجب ان تكون القيمة رقمية" ForeColor="Red"  ValidationExpression="^[-+]?\d+(\.\d+)?$" ControlToValidate="ProductMinValueAdd" ValidationGroup="DiscountAdd"></asp:RegularExpressionValidator></td>
                <td><asp:CompareValidator ID="CompareValidator5" runat="server" ErrorMessage="Error" ControlToValidate="ProductMinValueAdd"  Type="Double" ForeColor="Red" ControlToCompare="ProductMaxValueAdd" Operator="LessThanEqual"  ValidationGroup="DiscountAdd"></asp:CompareValidator></td>
                </tr>
               
            <tr>
                <td>أعلى قيمة للمنتج</td>
                <td><asp:TextBox ID="ProductMaxValueAdd" runat="server"></asp:TextBox> </td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="حقل مطلوب" ForeColor="Red" ControlToValidate="ProductMaxValueAdd" ValidationGroup="DiscountAdd"></asp:RequiredFieldValidator></td> 
                <td><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="يجب ان تكون القيمة رقمية" ForeColor="Red"  ValidationExpression="^[-+]?\d+(\.\d+)?$" ControlToValidate="ProductMaxValueAdd" ValidationGroup="DiscountAdd"></asp:RegularExpressionValidator></td>
                <td><asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Error" ControlToValidate="ProductMaxValueAdd" ForeColor="Red" Type="Double" ControlToCompare="ProductMinValueAdd" Operator="GreaterThanEqual"  ValidationGroup="DiscountAdd"></asp:CompareValidator></td>
                </tr>
            
       

            <tr>
                <td>أقل قيمة للخصم</td>
                <td><asp:TextBox ID="MinDiscountAmountAdd" runat="server"></asp:TextBox> </td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="حقل مطلوب" ControlToValidate="MinDiscountAmountAdd" ForeColor="Red" ValidationGroup="DiscountAdd"></asp:RequiredFieldValidator></td>
                <td><asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="يجب ان تكون القيمة رقمية" ForeColor="Red"  ValidationExpression="^[-+]?\d+(\.\d+)?$" ControlToValidate="MinDiscountAmountAdd" ValidationGroup="DiscountAdd"></asp:RegularExpressionValidator></td>
                <td><asp:CompareValidator ID="CompareValidator6" runat="server" ErrorMessage="Error" ControlToValidate="MinDiscountAmountAdd" ForeColor="Red" ControlToCompare="MaxDiscountAmountAdd" Operator="LessThanEqual" Type="Double"  ValidationGroup="DiscountAdd"></asp:CompareValidator></td>
            </tr>

            <tr>
                <td>أعلى قيمة للخصم</td>
                <td><asp:TextBox ID="MaxDiscountAmountAdd" runat="server"></asp:TextBox> </td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="حقل مطلوب" ForeColor="Red" ControlToValidate="MaxDiscountAmountAdd" ValidationGroup="DiscountAdd"></asp:RequiredFieldValidator></td>
                <td><asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="يجب ان تكون القيمة رقمية" ForeColor="Red" ValidationExpression="^[-+]?\d+(\.\d+)?$" ControlToValidate="MaxDiscountAmountAdd" ValidationGroup="DiscountAdd"></asp:RegularExpressionValidator></td>
                <td><asp:CompareValidator ID="CompareValidator4" runat="server" ErrorMessage="Error" ControlToValidate="MaxDiscountAmountAdd" ForeColor="Red" ControlToCompare="MinDiscountAmountAdd" Operator="GreaterThanEqual" Type="Double"  ValidationGroup="DiscountAdd"></asp:CompareValidator>  </td>
            </tr>

              <tr>
                <td>نسبة مئوية بالخصم ؟</td>
                <td><asp:CheckBox ID="IsPercntegeADD" runat="server" /></td>        
            </tr>

               <tr>
              <td> منتج خصمي؟</td>
                <td><asp:CheckBox ID="IsProductValueDiscountAdd" runat="server" /></td>
            </tr>

            <tr>
             <td>جميع المواد</td>
                <td><asp:CheckBox ID="AllProduct" runat="server" /></td>
            </tr>

            <tr>
                <td>إستثنائات؟</td>
                <td><asp:CheckBox ID="HaveRestrictedAdd" runat="server" /></td>
            </tr>

            <tr>
                <td>تطبيق التنفيذ الإجباري</td>
                <td><asp:CheckBox ID="AutoForceApplyAdd" runat="server" /></td>
            </tr>

            <tr>
                 <td>فعال</td>
                <td><asp:CheckBox ID="IsActiveAdd" runat="server" /></td>
            </tr>

               <tr>
               <td>بداية الخصم</td>
                <td><asp:Calendar ID="StartDateAdd" runat="server"></asp:Calendar> </td>
                <td></td>
                <td>نهاية الخصم</td>
                <td><asp:Calendar ID="EndDateAdd" runat="server"></asp:Calendar> </td>
                <td><asp:Label ID="DayError" ForeColor="Red" runat="server"></asp:Label></td>
            </tr>

            <tr>
                
                <td><asp:Button ID="AddDiscountPolicy" runat="server" Text="إضافة سياسة الخصم" ValidationGroup="DiscountAdd" OnClick="AddDiscountPolicy_Click" /></td> 
            </tr>

     
        </table>

    </div>
     <h3>سياسات الخصم المطبقة</h3>
    <div dir="RTL" style="overflow-x: auto; overflow-y:auto; height: 100%; width:100%;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEE1E2"  HeaderStyle-Font-Bold="true"  ForeColor="Black" DataKeyNames="Id" DataSourceID="SqlDataSource1" 
        EditRowStyle-VerticalAlign="Middle" EditRowStyle-Wrap="true" AllowPaging="True" PageSize="20"   EditRowStyle-Width="20%"
         OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" OnRowDataBound="GridView1_RowDataBound" OnPageIndexChanging="GridView1_PageIndexChanging" >
        <Columns>
            <asp:TemplateField HeaderText="الرقم" InsertVisible="False" SortExpression="Id">               
                <ItemTemplate>
                    <asp:Label ID="Id" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="أسم الخصم" SortExpression="DiscountName">
                <EditItemTemplate>
                    <asp:DropDownList ID="DiscountNameDDL" runat="server" ></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("DiscountName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="نوع الخصم" SortExpression="Discountype">
                <EditItemTemplate>
                   <asp:DropDownList ID="DiscountypeDDL" runat="server" ></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Discountype") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الدولة" SortExpression="ContryName">
                <EditItemTemplate>
                    <asp:DropDownList ID="ContryNameDDL" runat="server" ></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ContryName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="مقدم الخدمة" SortExpression="VendorName">
                <EditItemTemplate>
                   <asp:DropDownList ID="VendorNameDDL" runat="server"></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("VendorName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الخدمة" SortExpression="BillSystemType">
                <EditItemTemplate>
                    <asp:DropDownList ID="BillSystemTypeDDL" runat="server"></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("BillSystemType") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="IsPrcntg" HeaderText="مئوي؟" SortExpression="IsPrcntg" />
            <asp:TemplateField HeaderText="قيمة التخفيض" SortExpression="DiscountValue">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DiscountValue") %>'></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ForeColor="Red" ErrorMessage="*" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator21" ForeColor="Red" runat="server" ErrorMessage="يجب ان تكون القيمة رقمية"  ValidationExpression="^[-+]?\d+(\.\d+)?$" ControlToValidate="TextBox1"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("DiscountValue") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="IsProductValueDiscount" HeaderText="منتج خصمي؟" SortExpression="IsProductValueDiscount"/>
            <asp:CheckBoxField DataField="AllProduct" HeaderText="جميع المنتجات" SortExpression="AllProduct" />
            <asp:CheckBoxField DataField="HaveRestricted" HeaderText="إستثنائات" SortExpression="HaveRestricted" />
            <asp:TemplateField HeaderText="أقل قيمة للمنتج" SortExpression="ProductMinValue">
                <EditItemTemplate>
                   <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ProductMinValue") %>'></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" ForeColor="Red" ErrorMessage="*" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator23" runat="server" ForeColor="Red" ErrorMessage="يجب ان تكون القيمة رقمية"  ValidationExpression="^[-+]?\d+(\.\d+)?$" ControlToValidate="TextBox2"></asp:RegularExpressionValidator>
                   <asp:CompareValidator ID="CompareValidator20" runat="server" ErrorMessage="Error" ForeColor="Red" Type="Double" ControlToValidate="TextBox2" ControlToCompare="TextBox3"  Operator="LessThanEqual"></asp:CompareValidator>
                    </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("ProductMinValue") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="اعلى قيمة للمنتج" SortExpression="ProductMaxValue">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ProductMaxValue") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" ForeColor="Red" ErrorMessage="*" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator24" runat="server" ForeColor="Red" ErrorMessage="يجب ان تكون القيمة رقمية"  ValidationExpression="^[-+]?\d+(\.\d+)?$" ControlToValidate="TextBox3"></asp:RegularExpressionValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" Type="Double" ErrorMessage="Error" ForeColor="Red" ControlToValidate="TextBox3" ControlToCompare="TextBox2" Operator="GreaterThanEqual"></asp:CompareValidator>
                    </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("ProductMaxValue") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="تاريخ البداية" SortExpression="StartDate">            
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("StartDate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="تاريخ النهاية" SortExpression="EndDate">         
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("EndDate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="أقل قيمة للخصم" SortExpression="MinDiscountAmount">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("MinDiscountAmount") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator25" ForeColor="Red" runat="server" ErrorMessage="يجب ان تكون القيمة رقمية"  ValidationExpression="^[-+]?\d+(\.\d+)?$" ControlToValidate="TextBox4"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator24" runat="server"  Type="Double" ErrorMessage="Error" ForeColor="Red" ControlToValidate="TextBox4" ControlToCompare="TextBox5"  Operator="LessThanEqual"></asp:CompareValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("MinDiscountAmount") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="أعلى قيمة للخصم" SortExpression="MaxDiscountAmount">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("MaxDiscountAmount") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator27" ForeColor="Red" runat="server" ErrorMessage="يجب ان تكون القيمة رقمية"  ValidationExpression="^[-+]?\d+(\.\d+)?$" ControlToValidate="TextBox5"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ForeColor="Red" ErrorMessage="*" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" Type="Double" ForeColor="Red" ErrorMessage="Error" ControlToValidate="TextBox5" ControlToCompare="TextBox4" Operator="GreaterThanEqual" ></asp:CompareValidator>
                    </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("MaxDiscountAmount") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="AutoForceApply" HeaderText="تنفيذ تلقائي؟" SortExpression="AutoForceApply" />
            <asp:CheckBoxField DataField="IsActive" HeaderText="فعال" SortExpression="IsActive" />
            <asp:BoundField DataField="CreateBy" HeaderText="CreateBy" SortExpression="CreateBy" Visible="False" />
            <asp:BoundField DataField="CreationDate" HeaderText="CreationDate" SortExpression="CreationDate" Visible="false" />
            <asp:BoundField DataField="UpdateBy" HeaderText="UpdateBy" SortExpression="UpdateBy" Visible="false" />
            <asp:BoundField DataField="UpdateDate" HeaderText="UpdateDate" SortExpression="UpdateDate" Visible="false" />
            <asp:CheckBoxField DataField="IsDelete" HeaderText="IsDelete" SortExpression="IsDelete" Visible="false"  />
            <asp:BoundField DataField="DeleteBy" HeaderText="DeleteBy" SortExpression="DeleteBy" Visible="false"  />
            <asp:BoundField DataField="DeletedDate" HeaderText="DeletedDate" SortExpression="DeletedDate" Visible="false" />
            <asp:CommandField ShowEditButton="true" EditText="[تعديل]" UpdateText="[تحديث]" CancelText="[إلغاء]" DeleteText="[حذف]" ShowDeleteButton="true" ShowCancelButton="true" />
        </Columns>

<EditRowStyle VerticalAlign="Middle"></EditRowStyle>
    </asp:GridView>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PricingConnectionString %>" SelectCommand="ShowDiscountPolicy" SelectCommandType="StoredProcedure" DeleteCommand="Deletediscountpolicy" DeleteCommandType="StoredProcedure" UpdateCommand="Updatediscountpolicy" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="IsDelete" Type="Byte" />
            <asp:Parameter Name="DeleteBy" Type="String" />
            <asp:Parameter Name="DeletedDate" Type="DateTime" />
        </DeleteParameters>
        <UpdateParameters>    
            <asp:Parameter Name="DiscountId" Type="Int32" />
            <asp:Parameter Name="DiscounttypeId" Type="Int32" />
            <asp:Parameter Name="CountryID" Type="Int32" />
            <asp:Parameter Name="VendorID" Type="Int32" />
            <asp:Parameter Name="ServiceId" Type="Int32" />
            <asp:Parameter Name="IsPrcntg" Type="Byte"/>    
            <asp:Parameter Name="IsProductValueDiscount" Type="Byte" />
            <asp:Parameter Name="AllProduct" Type="Byte" />
            <asp:Parameter Name="HaveRestricted"  Type="Byte" />
            <asp:Parameter Name="StartDate" Type="DateTime" />
            <asp:Parameter Name="EndDate" Type="DateTime" />
            <asp:Parameter Name="AutoForceApply"  Type="Byte"/>
            <asp:Parameter Name="IsActive"  Type="Byte" />
            <asp:Parameter Name="UpdateBy" Type="String" />
            <asp:Parameter Name="UpdateDate" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
       </div>
</asp:Content>
