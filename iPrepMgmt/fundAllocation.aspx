<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="fundAllocation.aspx.cs" Inherits="iPrepMgmt.fundAllocation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <title>Manage Funding Allocation</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="panel panel-default">
        <div class="panel-heading">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <h2>
            <center>Manage Funding Allocation for Programmes</center>&nbsp;
    <asp:Button ID="btnBack1" runat="server" Text="Back" OnClick="btnBack1_Click" CssClass="btn btn-success" Width="94px" />
            &nbsp;</h2>
            &nbsp;&nbsp;
            <asp:Label ID="lblyear" runat="server"></asp:Label>
               <br />
            &nbsp;
            <asp:Label ID="lblamount" runat="server"></asp:Label>
         
            <br />

            &nbsp;

            <asp:Label ID="lblAllocated" runat="server"></asp:Label>
            <br />
            &nbsp;
            <asp:Label ID="lblUnallocated" runat="server"></asp:Label>
            <br />
            <br />
&nbsp;<asp:Label ID="lblresult" runat="server" style="color: green" ></asp:Label>
            <br />
    <asp:Label ID="lblerror" runat="server" style="color: Red" ></asp:Label>
    <asp:Label ID="lblstore" runat="server" Visible="False"></asp:Label>
            <br />
              
            
            
        </div>
        <br />
        <br />
        <asp:Repeater ID="faidRepeater" runat="server" OnItemCommand="faidRepeater_ItemCommand">
            <HeaderTemplate>
                <table class="table" style="width: 50%  auto;margin-right:auto">
                    <thead>
                        <tr>

                            <th><center>Fund ID</center> </th>
                            <th><center>Programme Type</center> </th>
                            <th><center>Amount</center> </th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>

                <tr style="text-align: center">

                    <td><%# Eval("FID") %></td>
                    <td><%# Eval("Pro_Desc") %></td>
                    <td>$<%# Eval("Amt") %></td>

                </tr>

            </ItemTemplate>
            <FooterTemplate>
                </tbody>
                 </table>
            </FooterTemplate>

        </asp:Repeater>



        &nbsp;&nbsp;



        <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="Allocate" CssClass="btn btn-info" />
    </div>
    <asp:Repeater ID="editRepeater" runat="server" OnItemCommand="editRepeater_ItemCommand">

        <HeaderTemplate>
            <table class="table" style="width: 50%">
                <thead>
                    <tr>

                        <th>Fund ID  </th>
                        <th>Description </th>
                        <th>Amount  </th>
                        <th>  </th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>

            <tr  style="text-align: center"   >


                <td><%# Eval("FID") %></td>
                <td>
                    <asp:TextBox ID="txtDesc" runat="server" Text='<%# Eval("Pro_Desc") %>' autocomplete="off" />
                    <asp:RequiredFieldValidator runat="server" ID="DescValidator" ValidationGroup="valGroup1" ControlToValidate="txtDesc" ErrorMessage="Required Field" Display="Dynamic" Style="color: Red" />

                </td>
                <td>
                    <asp:TextBox ID="txtAmt" runat="server" Text='<%# Eval("Amt") %>' autocomplete="off" />
                     <asp:RequiredFieldValidator runat="server" ID="AmountValidator" ValidationGroup="valGroup1" ControlToValidate="txtAmt" ErrorMessage="Required Field" Display="Dynamic" Style="color: Red" />
                    <asp:RegularExpressionValidator ID="amtValidator2" ControlToValidate="txtAmt"
                        runat="server"
                        ErrorMessage="Enter a Valid Amount"
                        Display="Dynamic"
                        ValidationGroup="valGroup1"
                        ValidationExpression="\d+"
                        Style="color: Red">

                    </asp:RegularExpressionValidator>
                </td>
                <td>
                    <asp:LinkButton ID="fundEdit" CommandName="update" ValidationGroup= "valGroup1" CommandArgument='<%# Eval("FAID") %>' runat="server">Update</asp:LinkButton>
                    <asp:LinkButton ID="fundDelete" CommandName="delete" CommandArgument='<%# Eval("FAID") %>' runat="server">Delete</asp:LinkButton>
                </td>
            </tr>

        </ItemTemplate>
        <FooterTemplate>
            </tbody>
                 </table>
        </FooterTemplate>


    </asp:Repeater>
    &nbsp;&nbsp;
    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add Row" CssClass="btn btn-warning" />
        <br />
    </br>
    &nbsp;
    <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="btn btn-success" Width="91px" />

    <br />

    <br />
    </asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
