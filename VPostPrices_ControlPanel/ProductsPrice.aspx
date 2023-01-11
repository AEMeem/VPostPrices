<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ProductsPrice.aspx.cs" Inherits="VPostPrices_ControlPanel.ProductsPrice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 264px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h3><asp:Label ID="PermissonLabel" runat="server" ForeColor="Red"></asp:Label></h3>
   <div id="PageView" runat="server">
    <div dir="rtl">
        <h3>إضافة سعر على تفضيلات الشحن</h3>
        <table style="width: 100%;">         
            <tr>
                <td> <label>أسم تفضيل الشحن</label></td>
                <td class="auto-style3"><asp:DropDownList id="AddProductDDL" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td> <label>الدولة</label></td>
                <td class="auto-style3"> <asp:DropDownList ID="addCountrDDL" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td><label>مقدم الخدمة</label></td>
                <td class="auto-style3"><asp:DropDownList ID="addVendorDDl" runat="server" ></asp:DropDownList></td>             
            </tr>
             <tr>
                <td><label>طريقة الحساب</label></td>
                <td class="auto-style3"> <asp:DropDownList ID="AddCalcTypeDDl" runat="server" ></asp:DropDownList></td>              
            </tr>
             <tr>
                <td><label>القيمة التزايدية</label></td>
                <td class="auto-style3"><asp:textbox ID="IncremantValue" runat="server" ></asp:textbox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="Red" ErrorMessage="حقل مطلوب" ControlToValidate="IncremantValue" ValidationGroup="ProductPrice"></asp:RequiredFieldValidator></td>
                 <td><asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ForeColor="Red"  ValidationGroup="ProductPrice"  ValidationExpression="^\d*\.?\d*$" ErrorMessage="يجب أن تكون القيمة رقمية" ControlToValidate="IncremantValue"></asp:RegularExpressionValidator></td>
             </tr>
             <tr>
                <td><label>اقل قيمة مطبقة</label></td>
                <td class="auto-style3"><asp:textbox ID="MinApplyValueTextBox" runat="server" ></asp:textbox></td>   
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ValidationGroup="ProductPrice"  runat="server" ErrorMessage="حقل مطلوب" ControlToValidate="MinApplyValueTextBox"></asp:RequiredFieldValidator>
                 <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red"  ValidationGroup="ProductPrice"  ValidationExpression="^[-+]?\d+(\.\d+)?$" ErrorMessage="يجب أن تكون القيمة رقمية" ControlToValidate="MinApplyValueTextBox"></asp:RegularExpressionValidator></td>
                 <td><asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="أقل قيمة مطبقة يجب أن تكون  اصغر من  أو تساوي أعلى قيمة مطبقة" ForeColor="Red" ControlToValidate="MinApplyValueTextBox" ControlToCompare="MaxApplyValueTextBox" Operator="LessThanEqual" ValidationGroup="ProductPrice" Type="Double"></asp:CompareValidator></td>
                 </tr>
             <tr>
                <td><label>أعلى قيمة مطبقة</label></td>
                <td class="auto-style3"><asp:textbox ID="MaxApplyValueTextBox" runat="server" ></asp:textbox></td>
                 <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ValidationGroup="ProductPrice"  runat="server" ErrorMessage="حقل مطلوب" ControlToValidate="MaxApplyValueTextBox"></asp:RequiredFieldValidator></td>
                 <td><asp:RegularExpressionValidator ID="RegularExpressionValidator29" ForeColor="Red" runat="server"  ValidationGroup="ProductPrice"  ValidationExpression="^[-+]?\d+(\.\d+)?$" ErrorMessage="يجب أن تكون القيمة رقمية" ControlToValidate="MaxApplyValueTextBox"></asp:RegularExpressionValidator></td>
                 <td><asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="Red" ErrorMessage="أعلى قيمة مطبقة يجب أن تكون  أعلى من أو تساوي اصغر قيمة مطبفة" ControlToValidate="MaxApplyValueTextBox" ControlToCompare="MinApplyValueTextBox" Operator="GreaterThanEqual" ValidationGroup="ProductPrice" Type="Double"></asp:CompareValidator></td>
            </tr>
             <tr>
                <td><label>أكثر قيمة للحد</label></td>
                <td class="auto-style3"><asp:textbox ID="MaxLimitValueTextBox" runat="server" ></asp:textbox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ValidationGroup="ProductPrice"  runat="server" ErrorMessage="حقل مطلوب" ControlToValidate="MaxLimitValueTextBox"></asp:RequiredFieldValidator></td>
                 <td><asp:RegularExpressionValidator ID="RegularExpressionValidator5" ForeColor="Red" runat="server"  ValidationGroup="ProductPrice"  ValidationExpression="^[-+]?\d+(\.\d+)?$" ErrorMessage="يجب أن تكون القيمة رقمية" ControlToValidate="MaxLimitValueTextBox"></asp:RegularExpressionValidator></td>
            </tr>
             <tr>
                <td><label>القيمة</label></td>
                <td class="auto-style3"><asp:textbox ID="AmountTextBox" runat="server" ></asp:textbox></td> 
                 <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ValidationGroup="ProductPrice"  runat="server" ErrorMessage="حقل مطلوب" ControlToValidate="AmountTextBox"></asp:RequiredFieldValidator></td>
                 <td><asp:RegularExpressionValidator ID="RegularExpressionValidator4" ForeColor="Red" runat="server"  ValidationGroup="ProductPrice"  ValidationExpression="^[-+]?\d+(\.\d+)?$" ErrorMessage="يجب أن تكون القيمة رقمية" ControlToValidate="AmountTextBox"></asp:RegularExpressionValidator></td>
            </tr>

                         <tr>
                <td><label>أقل قيمة</label></td>
                <td class="auto-style3"><asp:textbox ID="Textbox9" runat="server" ></asp:textbox></td> 
                 <td><asp:RequiredFieldValidator ID="RequiredFieldValidator12" ForeColor="Red" ValidationGroup="ProductPrice"  runat="server" ErrorMessage="حقل مطلوب" ControlToValidate="Textbox9"></asp:RequiredFieldValidator></td>
                 <td><asp:RegularExpressionValidator ID="RegularExpressionValidator2" ForeColor="Red" runat="server"  ValidationGroup="ProductPrice"  ValidationExpression="^[-+]?\d+(\.\d+)?$" ErrorMessage="يجب أن تكون القيمة رقمية" ControlToValidate="Textbox9"></asp:RegularExpressionValidator></td>
                 <td><asp:CompareValidator ID="CompareValidator6" runat="server" ForeColor="Red" ErrorMessage="أقل قيمة  يجب أن تكون  أقل من أو تساوي أعلى  قيمة " ControlToValidate="Textbox9" ControlToCompare="Textbox10" Operator="LessThanEqual" ValidationGroup="ProductPrice" Type="Double"></asp:CompareValidator></td>

                             </tr>

                         <tr>
                <td><label>أعلى قيمة</label></td>
                <td class="auto-style3"><asp:textbox ID="Textbox10" runat="server" ></asp:textbox></td> 
                 <td><asp:RequiredFieldValidator ID="RequiredFieldValidator13" ForeColor="Red" ValidationGroup="ProductPrice"  runat="server" ErrorMessage="حقل مطلوب" ControlToValidate="Textbox10"></asp:RequiredFieldValidator></td>
                 <td><asp:RegularExpressionValidator ID="RegularExpressionValidator3" ForeColor="Red" runat="server"  ValidationGroup="ProductPrice"  ValidationExpression="^[-+]?\d+(\.\d+)?$" ErrorMessage="يجب أن تكون القيمة رقمية" ControlToValidate="Textbox10"></asp:RegularExpressionValidator></td>
                 <td><asp:CompareValidator ID="CompareValidator7" runat="server" ForeColor="Red" ErrorMessage="أعلى قيمة  يجب أن تكون  أعلى من أو تساوي أقل  قيمة " ControlToValidate="Textbox10" ControlToCompare="Textbox9" Operator="GreaterThanEqual" ValidationGroup="ProductPrice" Type="Double"></asp:CompareValidator></td>

                             </tr>


             <tr>
                <td><label>تنفيذ الترتيب</label></td>
                <td class="auto-style3"><asp:textbox ID="ApplyOrderTextBox" runat="server" ></asp:textbox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ForeColor="Red" ErrorMessage="حقل مطلوب" ControlToValidate="ApplyOrderTextBox" ValidationGroup="ProductPrice"></asp:RequiredFieldValidator></td>
                 <td><asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ForeColor="Red" ValidationGroup="ProductPrice" ControlToValidate="ApplyOrderTextBox" ErrorMessage="يجب ان تكون القيمة رقمية وصحيحة" ValidationExpression="^\d{1,45}$"></asp:RegularExpressionValidator></td>
             </tr>
                
              <tr>
                <td><label>نسبة مئوية؟</label></td>
                <td class="auto-style3"><asp:Checkbox ID="IsPercntageCheckBox" runat="server" ></asp:Checkbox></td>            
            </tr>
            
              <tr>
                <td>هل يتغير السعر علي حسب الحجم؟</td>
                <td class="auto-style3">
                    <asp:CheckBox ID="IsPriceChangeCheckBox" runat="server"   />
                  </td>            
            </tr>
            
              <tr>
                <td><label>الدولة</label></td>
                <td class="auto-style3">
                    <asp:DropDownList ID="addPricingRoleDDL" runat="server">
                    </asp:DropDownList>
                  </td>            
            </tr>
            
             <tr>
                <td><label>تفعيل</label></td>
                <td class="auto-style3"><asp:checkbox ID="IsActiveCheckBox" runat="server"  ></asp:checkbox></td>           
            </tr>
             <tr>
                <td><asp:Button ID="AddPoductPrice" Text="إضافة المنتج" runat="server"  ValidationGroup="ProductPrice"  OnClick="AddPoductPrice_Click" /></td>    
            </tr>
        </table>
    </div>
             
    <div dir="rtl">
        <h3>أسعار تفضيلات الشحن الحالية</h3>

     <div dir="RTL" style="overflow-x: auto; overflow-y: auto; height: 100%; width:100%;">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowSorting="True" OnRowCancelingEdit="GridView1_RowCancelingEdit" AllowPaging="True" PageSize="20" BackColor="#DEE1E2"  HeaderStyle-Font-Bold="true"  ForeColor="Black"  OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDataBound="GridView1_RowDataBound" OnPageIndexChanging="GridView1_PageIndexChanging">
        <Columns>
            <asp:TemplateField HeaderText="الرقم" InsertVisible="False" SortExpression="Id">
                <ItemTemplate>
                    <asp:Label ID="Id" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="اسم المنتج" SortExpression="ProductNameAR">
                <EditItemTemplate>
                    <asp:DropDownList ID="ProductsDDL" runat="server" ></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ProductNameAR") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="اسم الدولة" SortExpression="CountryNameAR">
                <EditItemTemplate>
                    <asp:DropDownList ID="ContryDDL" runat="server"></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CountryNameAR") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="نوع التسعير" SortExpression="Value_Ar">
                <EditItemTemplate>
                    <asp:DropDownList ID="PricingRoleDDL" runat="server"></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Value_Ar") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="مقدم الخدمة">
                <EditItemTemplate>
                    <asp:DropDownList ID="VendorDDL" runat="server" ></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("vendorNameAR") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="طريقة الحساب">
                <EditItemTemplate>
                   <asp:DropDownList ID="CalcTypesDDl" runat="server"></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("calctypeAR") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="القيمة التزايدية">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IncreamentValue") %>'></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator55"  ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ForeColor="Red" ID="RegularExpressionValidator6" runat="server"   ValidationExpression="^[-+]?\d+(\.\d+)?$" ErrorMessage="ادخل رقم" ControlToValidate="TextBox1"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("IncreamentValue") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="اقل قيمة للتطبيق">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("MinApplyValue") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5"  ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="CustomValidator11"  ForeColor="Red"  runat="server" ErrorMessage="ادخل رقم" ControlToValidate="TextBox2" ValidationExpression="^[-+]?\d+(\.\d+)?$"></asp:RegularExpressionValidator>
                    <asp:CompareValidator ID="CompareValidator5"  ForeColor="Red"  runat="server" ErrorMessage="Error" Type="Double" ControlToValidate="TextBox2" ControlToCompare="TextBox3"  Operator="LessThanEqual"></asp:CompareValidator>
                    </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("MinApplyValue") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="أعلى قيمة للتطبيق">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("MaxApplyValue") %>'></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ForeColor="Red"  runat="server" ErrorMessage="*" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="CustomValidator12"  ForeColor="Red"  runat="server" ErrorMessage="ادخل رقم" ControlToValidate="TextBox3" ValidationExpression="^[-+]?\d+(\.\d+)?$"></asp:RegularExpressionValidator>
                    <asp:CompareValidator ID="CompareValidator2"  ForeColor="Red"  runat="server" ErrorMessage="Error" Type="Double" ControlToValidate="TextBox3" ControlToCompare="TextBox2" Operator="GreaterThanEqual"></asp:CompareValidator></td>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("MaxApplyValue") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="أكثر قيمة للحد">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("MaxLimitValue") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8"  ForeColor="Red"  runat="server" ErrorMessage="*" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="CustomValidator13" runat="server"  ForeColor="Red"  ErrorMessage="ادخل رقم" ControlToValidate="TextBox4" ValidationExpression="^[-+]?\d+(\.\d+)?$"></asp:RegularExpressionValidator>

                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("MaxLimitValue") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="أقل قيمة">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("MinAmount") %>'></asp:TextBox>
                     <asp:RegularExpressionValidator ID="CustomValidator33" runat="server"  ForeColor="Red"   ErrorMessage="ادخل رقم" ControlToValidate="TextBox7" ValidationExpression="^[-+]?\d+(\.\d+)?$" ></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator88"  ForeColor="Red"  runat="server" ErrorMessage="*" ControlToValidate="TextBox7"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator3"  ForeColor="Red"  runat="server" ErrorMessage="خطأ" Type="Double" ControlToValidate="TextBox7" ControlToCompare="TextBox8" Operator="LessThanEqual"></asp:CompareValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="MinAmountLabel" runat="server" Text='<%# Bind("MinAmount") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="أعلى قيمة">
                <EditItemTemplate>
                  <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("MaxAmount") %>'></asp:TextBox>
                  <asp:RegularExpressionValidator ID="CustomValidator1" runat="server" ControlToValidate="TextBox8" ErrorMessage="أدخل رقم" ForeColor="Red" ValidationExpression="^[-+]?\d+(\.\d+)?$" ></asp:RegularExpressionValidator>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator89"  ForeColor="Red"  runat="server" ErrorMessage="*" ControlToValidate="TextBox8"></asp:RequiredFieldValidator>
                 <asp:CompareValidator ID="CompareValidator4"  ForeColor="Red"  runat="server" ErrorMessage="خطأ" Type="Double" ControlToValidate="TextBox8" ControlToCompare="TextBox7"  Operator="GreaterThanEqual" ></asp:CompareValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="MaxAmountLabel" runat="server" Text='<%# Bind("MaxAmount") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>


            <asp:CheckBoxField DataField="IsPercntage" HeaderText="مئوي" />
            <asp:CheckBoxField DataField="IsPriceChange" HeaderText="السعر يتغير حسب الحجم" />
            <asp:TemplateField HeaderText="القيمة">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator9"  ForeColor="Red"  runat="server" ErrorMessage="*" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="CustomValidator14" runat="server"  ForeColor="Red"  ErrorMessage="ادخل رقم" ControlToValidate="TextBox5" ValidationExpression="^[-+]?\d+(\.\d+)?$"></asp:RegularExpressionValidator>

                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="تنفيذ الترتيب">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ApplyOrder") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10"  ForeColor="Red"  runat="server" ErrorMessage="*" ControlToValidate="TextBox6"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="CustomValidator15" runat="server"  ForeColor="Red"  ErrorMessage="ادخل رقم " ControlToValidate="TextBox6" ValidationExpression="^\d{1,45}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("ApplyOrder") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="IsActive" HeaderText="فعال" />
            <asp:BoundField DataField="CreateBy" HeaderText="CreateBy" Visible="False" />
            <asp:BoundField DataField="CreationDate" HeaderText="CreationDate"    Visible="false" />
            <asp:BoundField DataField="UpdateBy" HeaderText="UpdateBy"    Visible="false" />
            <asp:BoundField DataField="UpdateDate" HeaderText="UpdateDate"    Visible="false" />
            <asp:CheckBoxField DataField="IsDelete" HeaderText="IsDelete"    Visible="false" />
            <asp:BoundField DataField="DeleteBy" HeaderText="DeleteBy"   Visible="false" />
            <asp:BoundField DataField="DeletedDate" HeaderText="DeletedDate"    Visible="false" />
            <asp:CommandField ShowEditButton="true" EditText="[تعديل]" ShowDeleteButton="true" DeleteText="[حذف]" ShowCancelButton="true" CancelText="[إلغاء]" UpdateText="[تحديث]"/>
        </Columns>
    </asp:GridView>
         <br />
         </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PricingConnectionString %>" SelectCommand="ShowVPostProductPrice" SelectCommandType="StoredProcedure" UpdateCommand="UpdateVPostProductPrice" UpdateCommandType="StoredProcedure" DeleteCommand="DeletevpostproductPrice" DeleteCommandType="StoredProcedure">
        <UpdateParameters>         
            <asp:Parameter Name="ProductID" Type="Int32" Direction="Input" Size="50" />
            <asp:Parameter Name="CountryID" Type="Int32" Direction="Input" Size="50" />
             <asp:Parameter Name="VendorID" Type="Int32" Direction="Input" Size="50" />
             <asp:Parameter Name="CalcTypeId" Type="Int32" Direction="Input" Size="50" />          
             <asp:Parameter Name="PricingRoleId" Type="Int32" Direction="Input" Size="50" />          
            <asp:Parameter Name="UpdateBy" Type="String" Direction="Input" Size="50"  />
            <asp:Parameter Name="UpdateDate" Type="DateTime"  Direction="Input" Size="50" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="IsDelete" Type="Byte" Direction="Input" Size="50"  />
            <asp:Parameter Name="DeleteBy" Type="String"  Direction="Input" Size="50" />
            <asp:Parameter Name="DeletedDate" Type="DateTime"  Direction="Input" Size="50" />
        </DeleteParameters>
    </asp:SqlDataSource>
</div>
        </div>
</asp:Content>
