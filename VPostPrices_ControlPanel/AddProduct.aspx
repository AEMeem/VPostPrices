<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="VPostPrices_ControlPanel.ShowAndEditProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3><asp:Label ID="PermissonLabel" runat="server" ForeColor="Red"></asp:Label></h3>
   <div id="PageView" runat="server">
    <div dir="auto">
          <h3>إضافة تفضيلات شحن جديدة</h3>
        <table style="width: 100%;">
          
            <tr>
                <td><label>أسم تفضيل الشحن باللغة العربية</label></td>
                <td> 
               <asp:TextBox ID="NameAr" runat="server"></asp:TextBox></td>
               <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="حقل مطلوب" ControlToValidate="NameAr"  ValidationGroup="AddProdcut"></asp:RequiredFieldValidator></td> 
               <td><asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="أدخل حروف عربية فقط , وحجم النص يجب ان يكون أقل من 500 حروف" ForeColor="Red" ValidationExpression="^[\u0621-\u064A\040 ]{0,500}$" ControlToValidate="NameAr" ValidationGroup="AddProdcut" ></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td><label>أسم تفضيل الشحن باللغة الإنجليزية</label></td>
                <td><asp:TextBox ID="NameEn" runat="server"></asp:TextBox></td>   
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="حقل مطلوب"  ControlToValidate="NameEn" ValidationGroup="AddProdcut"></asp:RequiredFieldValidator></td>
                <td><asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Please Enter English letters ,and text length must be less than 500 letters" ForeColor="Red" ControlToValidate="NameEn" ValidationExpression="^[A-Za-z ]{0,500}$" ValidationGroup="AddProdcut"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td><label>الكود</label></td>
                <td><asp:TextBox ID="ProductCode" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="حقل مطلوب" ControlToValidate="ProductCode" ValidationGroup="AddProdcut"></asp:RequiredFieldValidator></td>
                </tr>
             <tr>
                <td><label>ترتيب عرض المنتج بالفاتورة</label></td>
                <td><asp:TextBox ID="DisplayOrder" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="حقل مطلوب" ControlToValidate="DisplayOrder" ValidationGroup="AddProdcut"></asp:RequiredFieldValidator></td>
                <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ControlToValidate="DisplayOrder" ValidationGroup="AddProdcut" ErrorMessage=" يجب أن تحتوي القيمة على رقم صحيح" ValidationExpression="^\d{1,45}$" ></asp:RegularExpressionValidator></td>
             </tr>
            
            <tr>
              <td><label>فيمة المنتج من</label></td>
              <td><ASP:dropdownlist ID="ProductCalcFromAddDDl" runat="server"></ASP:dropdownlist></td>
            </tr>


             <tr>
                <td><label>رقم فاتورة المنتج</label></td>
                <td><asp:TextBox ID="BillProductId" runat="server"></asp:TextBox></td>
                <td></td>
                <td><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ValidationGroup="AddProdcut" ControlToValidate="BillProductId" ErrorMessage=" يجب أن تحتوي القيمة على رقم صحيح" ValidationExpression="^\d{1,45}$" ></asp:RegularExpressionValidator></td>
            </tr>

             <tr>
                <td><label>الوحدة</label> </td>
                <td> <asp:DropDownList ID="UnitIdAdd" runat="server"></asp:DropDownList></td>
            </tr>

             <tr>
                <td><label>شرح المنتج باللغة العربية</label></td>
                <td><asp:TextBox ID="DescriptionAr" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" runat="server" ValidationGroup="AddProdcut" ErrorMessage="حقل مطلوب" ControlToValidate="DescriptionAr"></asp:RequiredFieldValidator></td>
            </tr>

             <tr>
                <td><label>الشرح  باللغة الإنجليزية</label></td>
                <td><asp:TextBox ID="DescriptionEn" runat="server"></asp:TextBox></td>
                 <td><asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" runat="server" ValidationGroup="AddProdcut" ErrorMessage="حقل مطلوب" ControlToValidate="DescriptionEn"></asp:RequiredFieldValidator></td>
            </tr>

             <tr>
                <td><label>حساب القيمة المضافة؟  </label> </td>
                <td><asp:CheckBox ID="DoVATCalc" runat="server"></asp:CheckBox></td>
              </tr>
            <tr>
                <td><label>منتج ضريبي ؟  </label></td>
                <td><asp:CheckBox  ID="IsVATProduct" runat="server"></asp:CheckBox></td>
                </tr>
            <tr>
                <td><label>أظهار قيمة المنتج صفرية  </label> </td>
                <td><asp:CheckBox  ID="ShowZeroAmount" runat="server"></asp:CheckBox></td>
             </tr>

            <tr>
                <td><label>تطبيق القيمة كما هي  </label></td>
                <td><asp:CheckBox ID="ForceValueAsRecieved" runat="server"></asp:CheckBox></td>
                </tr>

            <tr>
                <td><label>إحتساب من المبلغ المحتسب  </label></td>
                <td><asp:CheckBox ID="CalcFromAmountCheck" runat="server"></asp:CheckBox></td>
                </tr>

            <tr>
                <td><label>إحتساب ضمني  </label></td>
                <td><asp:CheckBox ID="InernalCalCheck" runat="server"></asp:CheckBox></td>
                </tr>


            <tr>
                <td><label>تنشيط تفضيل الشحن  </label></td>
                <td><asp:CheckBox ID="IsActive" runat="server"></asp:CheckBox></td>
            </tr>

            
            <tr>
                <td><label>المبلغ * الكمية؟  </label></td>
                <td><asp:CheckBox ID="IsMultipleQuantity" runat="server"></asp:CheckBox></td>
            </tr>

            <tr>
                <td><asp:Label ID="ErrorL" ForeColor="Red" runat="server"></asp:Label></td>
            </tr>
             <tr>
                <td><asp:Button ID="Button1" runat="server" Text="إضافة منتج" OnClick="Button1_Click" ValidationGroup="AddProdcut" /></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>

             <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>

        </table>
    </div>

        

        <br />
    
        <h3>تفضيلات الشحن الحالية</h3>


    <div dir="RTL" style="overflow-x:  auto; overflow-y: auto; height: 100%; width:100%;">        
    <asp:GridView ID="GridView1" runat="server"  DataKeyNames="Id"   AutoGenerateColumns="False" AllowSorting="True"  DataSourceID="SqlDataSource1_Product" AllowPaging="True" BackColor="#DEE1E2"  HeaderStyle-Font-Bold="true"  ForeColor="Black"  PageSize="20" OnPageIndexChanging="GridView1_PageIndexChanging"  OnRowDataBound="GridView1_RowDataBound" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" >
        <Columns>
            

<%--          <asp:TemplateField  HeaderText="UnitId"  SortExpression="UnitId">
	<EditItemTemplate>
		<asp:DropDownList ID="UnitDDL" runat="server"
			 DataTextField="UnitNameAr" DataValueField="Id">
		</asp:DropDownList>

	</EditItemTemplate>
	<ItemTemplate>
		<asp:Label ID="UnitId" runat="server" />
	</ItemTemplate>
</asp:TemplateField>--%>
          
            <asp:TemplateField HeaderText="الرقم" InsertVisible="False" SortExpression="Id">
                <ItemTemplate>
                    <asp:Label ID="Id" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الأسم بالعربي">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NameAr") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="R1" runat="server" ControlToValidate="TextBox1" ErrorMessage="أدخل حروف عربية فقط" ForeColor="Red" ValidationExpression="^[\u0621-\u064A\040 ]{0,500}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("NameAr") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الأسم بالانجليزي">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("NameEn") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Please Enter English letters" ForeColor="Red" ControlToValidate="TextBox2" ValidationExpression="^[A-Za-z ]{0,500}$" ></asp:RegularExpressionValidator></td>
                    </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("NameEn") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الكود">      
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ProductCode") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

                <asp:TemplateField HeaderText="قيمة المنتج من">
                   <EditItemTemplate>
                     <asp:DropDownList ID="CalcFromDDL" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label21" runat="server" Text='<%# Bind("ProductCalculateFrom") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

               <asp:CheckBoxField DataField="CalculateFromAmount" HeaderText="إحتساب من المبلغ المحتسب" />
               <asp:CheckBoxField DataField="InternalyCaculated" HeaderText="حساب ضمني " />
     
            <asp:CheckBoxField DataField="DoVATCalc" HeaderText="حساب الضريبة المضافة"  />
            <asp:CheckBoxField DataField="IsVATProduct" HeaderText="منتج ضريبي"  />
            <asp:CheckBoxField DataField="ShowZeroAmount" HeaderText="إظهار قيمة صفرية"  />
            <asp:TemplateField HeaderText="ترتيب العرض" >
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("DisplayOrder") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="TextBox4" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox4" ForeColor="Red" ErrorMessage=" يجب ان تحتوي القيمة على رقم" ValidationExpression="^\d{1,45}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("DisplayOrder") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="فاتورة المنتج">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("BillProductId") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ForeColor="Red" ControlToValidate="TextBox5" ErrorMessage="يجب ان تحتوي القيمة على رقم" ValidationExpression="^\d{1,45}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("BillProductId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الوحدة" >
                <ItemTemplate>
                    <asp:label ID="TextBox1" runat="server" Text='<%# Bind("UnitNameAr") %>'></asp:label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="UnitIDEditDDL" runat="server" ></asp:DropDownList>
               </EditItemTemplate>
            </asp:TemplateField>
          
            <asp:CheckBoxField DataField="ForceValueAsRecieved" HeaderText="تطبيق القيمة؟"  />
            <asp:TemplateField HeaderText="الشرح بالعربي" >
              
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("DescriptionAr") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الشرح بالانجليزي" >        
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("DescriptionEn") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="IsActive" HeaderText="فعال"  />
            <asp:CheckBoxField DataField="IsMultiplyQuantity" HeaderText="المبلغ* الكمية؟"  />
            <asp:BoundField DataField="CreateBy" HeaderText="CreateBy"  Visible="False" />
            <asp:BoundField DataField="CreationDate" HeaderText="CreationDate"  Visible="false" />
            <asp:BoundField DataField="UpdateBy" HeaderText="UpdateBy"   Visible="false"/>
            <asp:BoundField DataField="UpdateDate" HeaderText="UpdateDate"  Visible="false" />
            <asp:CheckBoxField DataField="IsDelete" HeaderText="IsDelete"  Visible="false" />
            <asp:BoundField DataField="DeleteBy" HeaderText="DeleteBy"  Visible="false" />
            <asp:BoundField DataField="DeletedDate" HeaderText="DeletedDate"   Visible="false" />
            <asp:CommandField ShowEditButton="true" EditText="[تعديل]" ShowCancelButton="true" CancelText="[إلغاء]" UpdateText="[تحديث]" ShowDeleteButton="true" DeleteText="[حذف]" />
            
        </Columns>
</asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        </div> 
<asp:SqlDataSource ID="SqlDataSource1_Product" runat="server"  ConnectionString="<%$ ConnectionStrings:PricingConnectionString %>"  SelectCommand="ShowVPostProduct" SelectCommandType="StoredProcedure"  UpdateCommand="UpdateVPostProduct" UpdateCommandType="StoredProcedure" DeleteCommand="Deletevpostproduct" DeleteCommandType="StoredProcedure" >

    <UpdateParameters> 
            <asp:Parameter Name="ProductCalculateFrom" Type="int32"  Direction="Input"  Size="50" />
            <asp:Parameter Name="UnitId" Type="int32"  Direction="Input"  Size="50" />
            <asp:Parameter Name="UpdateBy" Type="String"  Direction="Input"  Size="50" />  
            <asp:Parameter Name="UpdateDate" Type="DateTime" Size="50" />               
    </UpdateParameters>
<DeleteParameters>
    
    <asp:Parameter name="IsDelete" Type="Int32" />
    <asp:Parameter Name="DeleteBy" Type="String"  Direction="Input"  Size="50" />  
    <asp:Parameter Name="DeletedDate" Type="DateTime" Direction="Input" Size="50" />
   
</DeleteParameters>

 
</asp:SqlDataSource>   

    <asp:Label ID="Result" runat="server"></asp:Label>
       </div>
</asp:Content>
