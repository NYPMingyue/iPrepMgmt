<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="iPrepMgmt.View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <title>Programme Funding</title>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div style="margin-left:auto; margin-right:auto;">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <h1><center>Programme Funding</center><br />
            </h1>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" CssClass="table-hover" Width="1254px">
                    <Columns>
                        <asp:TemplateField HeaderText="PID">
                            <EditItemTemplate>
                                <asp:Label ID="lblpid" runat="server" Text='<%# Bind("PID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("PID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FAID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="FAID" DataTextField="FAID" DataValueField="FAID">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="FAID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT * FROM [Funds_Allocation]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("FAID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Staff In Charge">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style1" DataSourceID="SqlDataSource1" DataTextField="SID" DataValueField="SID">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT [SID] FROM [Staff]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Staff_In_Charge") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Comments">
                            <EditItemTemplate>
                                <asp:Label ID="lblcomments" runat="server" Text='<%# Bind("Comments") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Comments") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Program Code">
                            <EditItemTemplate>
                                <asp:Label ID="lblprogcode" runat="server" Text='<%# Bind("Sub_Prog_Code") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Sub_Prog_Code") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Claim Per Pax">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ClaimPerPax") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv_claim" runat="server" ErrorMessage="Please enter Claim Per Pax"
                                    ControlToValidate="TextBox4" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cv_claim" runat="server" ControlToValidate="TextBox4" ErrorMessage="Only currency value allowed" ForeColor="Blue" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("ClaimPerPax") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="NoOfPax">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("NoOfPax") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv_noofpax" runat="server" ErrorMessage="Please enter No Of Pax"
                                    ControlToValidate="TextBox5" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                 <asp:CompareValidator ID="cv_noofpax" runat="server" ControlToValidate="TextBox5" ErrorMessage="Only numeric Interger allowed" ForeColor="Blue" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("NoOfPax") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton OnClientClick="return confirm('Are you sure you want to delete this ?');"  ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" />
                    </Columns>  
                </asp:GridView>
            <br />
            <br />
            &nbsp;
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add" CssClass="btn btn-info" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" runat="server" />
        </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
