<%@ Page Title="" Language="C#" MasterPageFile="~/Staff.Master" AutoEventWireup="true" CodeBehind="CoursesUpdate.aspx.cs" Inherits="iPrepMgmt.CoursesUpdate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <title>Update Courses</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style type="text/css">
        .auto-style4 {
            height: 34px;
        }
        .auto-style5 {
            width: 378px;
            height: 34px;
        }
        .auto-style6 {
            width: 378px;
        }
        .auto-style7 {
            width: 283px;
            height: 34px;
        }
        .auto-style8 {
            width: 283px;
        }
            .auto-style9 {
                width: 338px;
                height: 85px;
            }
    </style>

            <div>
            <table class="table table-hover">
                <br />
                <br />
                <br />
                <br />
                <br />
                <tr>
                    <td class="auto-style7">CID:</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="tb_cid" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">PFID:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="tb_pfid" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">Start Date:&nbsp; <asp:TextBox ID="tb_startdate" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style6">End Date:<br />
                        <asp:TextBox ID="tb_enddate" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">Title:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="tb_title" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">Price Per Pax:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="tb_price" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="tb_price" ErrorMessage="Only currency value allowed" ForeColor="Blue" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">Claim:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="tb_claim" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="tb_claim" ErrorMessage="Only integer value allowed" ForeColor="Blue" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">No Of Pax:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="tb_noofpax" runat="server" ></asp:TextBox>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="tb_noofpax" ErrorMessage="Only integer value allowed" ForeColor="Blue" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                        <br />
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tb_noofpax" Display="Dynamic" ErrorMessage="Students Exceed Total Allowed" ForeColor="Blue" MaximumValue="200" MinimumValue="0">Students Exceed Total Allowed</asp:RangeValidator>
                        <br />
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">Status:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="tb_status" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">Date Last Action:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="tb_lastaction" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">Exam Required?:</td>
                    <td class="auto-style6">
                        <asp:DropDownList ID="ddl_exam" runat="server">
                            <asp:ListItem>Y</asp:ListItem>
                            <asp:ListItem>N</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">In IMDA pre-approved list?:</td>
                    <td class="auto-style6">
                        <asp:DropDownList ID="ddl_preapproved" runat="server">
                            <asp:ListItem>Y</asp:ListItem>
                            <asp:ListItem>N</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">Comments:</td>
                    <td class="auto-style6">
                        <textarea id="ta_comments" name="S1" runat="server" class="auto-style9"></textarea></td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">
                        &nbsp;</td>
                    <td class="auto-style6">
                        &nbsp;<asp:Button ID="btn_update" runat="server" Text="Update" OnClick="btn_update_Click" CssClass="btn btn-success" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Cancel" CssClass="btn btn-danger" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                    </td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
