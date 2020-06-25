<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="viewFunds.aspx.cs" Inherits="iPrepMgmt.viewFunds" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <title>Allocation of Funds</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
        <h2><center>Input Funds</center></h2>

    <table class="table" style="width: 50%;margin-left:auto;margin-right:auto; ">
        <tr>
            <td>Fund Year</td>
            <td height="30">

                <asp:TextBox ID="txtYear" display="static" pattern=".{4,4}" runat="server" autocomplete="off" Columns="1" placeholder="E.g. 2020" Width="120px"></asp:TextBox>
                <br />


                <asp:RequiredFieldValidator runat="server" ValidationGroup='valGroup1' ID="yearValidator" ControlToValidate="txtYear" ErrorMessage="Required Field" Display="Dynamic" Style="color: Red" />
                <asp:RegularExpressionValidator ID="yearValidator1" ControlToValidate="txtYear" runat="server" ErrorMessage="Only Numbers allowed" Display="Dynamic" ValidationExpression="\d+" Style="color: Red"></asp:RegularExpressionValidator>

            </td>
        </tr>
        <tr>
            <td>Overall Fund Amount ($)</td>
            <td height="50">
                <asp:TextBox ID="txtAmt" runat="server" autocomplete="off" Width="122px"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator runat="server" ID="amtValidator" 
                    ValidationGroup='valGroup1'
                    ControlToValidate="txtAmt" 
                    ErrorMessage="Required Field" 
                    Display="Dynamic" 
                    Style="color: Red" />
                 
                <asp:RegularExpressionValidator ID="amtValidator2" ControlToValidate="txtAmt" 
                    runat="server" 
                    ErrorMessage="Only Numbers allowed"
                    Display="Dynamic" 
                    ValidationExpression="\d+"
                    Style="color: Red">

                </asp:RegularExpressionValidator>

            </td>

        </tr>
        <tr>
            <td>Comments (optional)
                <br />
                <br />
                <br />
                <br />
            </td>
            <td>
                <asp:TextBox ID="txtComments" runat="server" autocomplete="off" TextMode="Multiline" Columns="22" Rows="6" Height="113px" Width="397px"></asp:TextBox></td>

        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr style="font-weight: bold">

            <td><center>Start Date</center></td>
            <td><center>End Date</center></td>

        </tr>
        <tr>
            <td>
                <asp:Calendar ID="startDate" runat="server" OnSelectionChanged="startDate_SelectionChanged"  Format="mm/dd/yy"></asp:Calendar>
            </td>
            <td>
                <asp:Calendar ID="endDate" runat="server" OnSelectionChanged="endDate_SelectionChanged"  Format="mm/dd/yy"></asp:Calendar>
            </td>
        </tr>

        <tr>
            <td>
                <center><asp:TextBox ID="txtStartDate" runat="server"  style="border: none;" readonly=true ></asp:TextBox></center>
            </td>
            <td>
                <center><asp:TextBox ID="txtEndDate" runat="server"  style="border: none;" readonly=true ></asp:TextBox></center>
               
                </td>
            <td>
                <asp:Button ID="btnSubmit" ValidationGroup='valGroup1' runat="server" OnClick="btnSubmit_Click" Text="Submit" CssClass="btn btn-success" />
            </td>

        </tr>
        <tr>
            <td> 
                <asp:CompareValidator ID="CompareValidator1" runat="server"
                ControlToValidate="txtEndDate"
                ControlToCompare="txtStartDate"
                CultureInvariantValues="true"
                Type="Date"
                ValidationGroup='valGroup1'
                Operator="GreaterThanEqual"
                Style="color: Red"
                ErrorMessage="end date must be after start date" />

            </td>
        </tr>
       
    </table>

    <asp:Label ID="lblResult" runat="server" Text=" "></asp:Label>

    <br />
    <br />


    <h2><center>Current Funds</center></h2>

    <div class="panel panel-default">
        <asp:Repeater ID="fundRepeater" runat="server" OnItemCommand="fundRepeater_ItemCommand">
            <HeaderTemplate>
                <table class="table" style="width: 50%; margin-left:auto;margin-right:auto;">
                    <thead>
                        <tr>
                            <th><center>Fund ID</center></th>
                            <th><center>Year</center></th>
                            <th><center>Amount</center></th>
                            <th><center>Comments</center></th>
                            <th><center>Allocate</center></th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>

                <tr style="text-align: center">
                    <th>
                        <div><%#Eval("FID")%></div>

                    </th>
                    <td>
                        <div><%# Eval("Year") %></div>

                    </td>
                    <td>
                        <div>$<%#  Eval("Amount") %></div>

                    </td>
                    <td>
                        <div><%#  Eval("Comments") %></div>

                    </td>

                    <td>
                        <asp:LinkButton ID="fundEdit" CommandName="edit" CommandArgument='<%# Eval("FID") %>' runat="server">Allocate</asp:LinkButton>

                    </td>

                </tr>

            </ItemTemplate>
            <FooterTemplate>
                </tbody>
                 </table>
            </FooterTemplate>

        </asp:Repeater>
    </div>
    <br />


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
