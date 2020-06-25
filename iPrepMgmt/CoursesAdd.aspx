<%@ Page Title="" Language="C#" MasterPageFile="~/Staff.Master" AutoEventWireup="true" CodeBehind="CoursesAdd.aspx.cs" Inherits="iPrepMgmt.CoursesAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <title>Add Course</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 499px;
        }
        .auto-style3 {
            width: 499px;
            height: 29px;
        }
        .auto-style4 {
            height: 29px;
        }
        .auto-style5 {
            width: 469px;
        }
        .auto-style6 {
            height: 29px;
            width: 469px;
        }
    </style>
            <div>
            <table class="table-borderless">
                <br />
                <br />
                <br />
                <br />
                <br />
                <tr>
                    <td class="auto-style2">PID:</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="ddl_pid" runat="server" DataSourceID="SqlDataSource1" DataTextField="PID" DataValueField="PID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT * FROM [Programme_Funding]"></asp:SqlDataSource>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Start Date:</td>
                    <td class="auto-style5">
                        <asp:Calendar ID="c_start"  OnDayRender="c_start_DayRender" runat="server"></asp:Calendar>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">End Date:</td>
                    <td class="auto-style5">
                        <asp:Calendar ID="c_end" OnDayRender="c_end_DayRender" runat="server"></asp:Calendar>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Title:</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="tb_title" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">Price Per Pax ($):</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="tb_price" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="tb_price" ErrorMessage="Only currency value allowed" ForeColor="Blue" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Claim ($):</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="tb_claim" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="tb_claim" ErrorMessage="Only currency value allowed" ForeColor="Blue" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">No Of Pax:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="tb_noofpax" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="tb_noofpax" ErrorMessage="Only integer value allowed" ForeColor="Blue" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Status:</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="ddl_status" runat="server">
                            <asp:ListItem>Approved</asp:ListItem>
                            <asp:ListItem>Cancelled</asp:ListItem>
                            <asp:ListItem>Rejected</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Date of Last Action:</td>
                    <td class="auto-style5">
                        <asp:Calendar ID="c_lastaction"  OnDayRender="c_lastaction_DayRender" runat="server"></asp:Calendar>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Exam:</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="ddl_exam" runat="server">
                            <asp:ListItem>Y</asp:ListItem>
                            <asp:ListItem>N</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Pre Approved:</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="ddl_preapproved" runat="server">
                            <asp:ListItem>Y</asp:ListItem>
                            <asp:ListItem>N</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Comments:</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="tb_comments" runat="server" Height="97px" Width="393px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <br />
    <asp:Button ID="btn_courses" runat="server" OnClick="btn_courses_Click" Text="Add" CssClass="btn btn-info" />
                        <br />
                        <br />
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
