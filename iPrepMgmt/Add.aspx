<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="iPrepMgmt.Add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <title>Add Funding</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style type="text/css">
        .auto-style2 {
            width: 326px;
        }
        .auto-style3 {
            width: 441px;
        }
    </style>
            <div>
            <table style="width:100%, height:156px" class="table-borderless">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <tr>
            <h1><center>Add Funding</center><br />
                    <td class="auto-style2">&nbsp;&nbsp; Staff In Charge:</td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="ddl_staff" runat="server" DataSourceID="SqlDataSource3" DataTextField="SID" DataValueField="SID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT * FROM [Staff]"></asp:SqlDataSource>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;&nbsp; Funding Allocation ID:</td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="ddl_fundallocation" runat="server" DataSourceID="SqlDataSource2" DataTextField="FAID" DataValueField="FAID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT [FAID], [Pro_Desc] FROM [Funds_Allocation]"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;&nbsp; Comments:</td>
                    <td class="auto-style3">
                        <textarea id="TextArea1"  runat="server" cols="20" name="S1" rows="2"></textarea></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_comments" runat="server" ControlToValidate="TextArea1" ErrorMessage="Please enter Comments" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;&nbsp;Sub Program Code:</td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="ddl_progcode" runat="server" DataSourceID="SqlDataSource1" DataTextField="ID" DataValueField="ID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT [ID] FROM [Programme_Subcode]"></asp:SqlDataSource>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;&nbsp;Claim Per Pax ($):</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="tb_claimperpax" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_claim" runat="server" ControlToValidate="tb_claimperpax" ErrorMessage="Please enter Claim Per Pax" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="cv_claim" runat="server" ControlToValidate="tb_claimperpax" ErrorMessage="Only currency value allowed" ForeColor="Blue" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;&nbsp;No Of Pax:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="tb_noofpax" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_noofpax" runat="server" ControlToValidate="tb_noofpax" ErrorMessage="Please enter No Of Pax" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="cv_noofpax" runat="server" ControlToValidate="tb_noofpax" ErrorMessage="Only numeric Interger allowed" ForeColor="Blue" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add" CssClass="btn btn-success" Width="110px" />
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
