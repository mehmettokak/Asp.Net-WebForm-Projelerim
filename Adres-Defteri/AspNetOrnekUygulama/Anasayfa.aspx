<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Anasayfa.aspx.cs" Inherits="AspNetOrnekUygulama.Anasayfa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Adres Defteri</title>
<link href="Content/Style/main.css" rel="stylesheet" />
    <link href="Content/Script/fancyapps/source/jquery.fancybox.css" rel="stylesheet" />
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="Content/Script/fancyapps/source/jquery.fancybox.js"></script>
    <script src="Content/Script/main.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="pageContainer">
            <div class="header">Adres Defteri </div>
            <div id="mainContent">
                <div id="operations">
                    <ul>
                        <li>
                            <a id="btnNewAddress" href="javascript:;">Yeni Adress</a>
                        </li>
                        <li>
                            <a id="btnAddresses" href="javascript:;">Adresler</a>
                        </li>
                    </ul>
                </div>
                <div id="operationContainer">
                    <div id ="newAddress">
                      <table>
                            <tr>
                                <td>Ad</td>
                                <td>
                                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Ad Alanı Boş Geçilemez!"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>Soyad</td>
                                <td>
                                    <asp:TextBox ID="txtLastName" runat="server" ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFirstName" ErrorMessage="SoyAd Alanı Boş Geçilemez!"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>Takma Ad</td>
                                <td>
                                     <asp:TextBox ID="txtNickName" runat="server" ></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Doğum Tarihi</td>
                                <td>
                                     <asp:Calendar ID="calBirt" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px">
                                         <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                         <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                         <OtherMonthDayStyle ForeColor="#CC9966" />
                                         <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                         <SelectorStyle BackColor="#FFCC66" />
                                         <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                         <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                     </asp:Calendar>
                                </td>
                            </tr>
                            <tr>
                                <td>Cinsiyet</td>
                                <td>
                                    <asp:DropDownList ID="ddGender" runat="server">
                                        <asp:ListItem>Seçiniz</asp:ListItem>
                                        <asp:ListItem Value="False">Bayan</asp:ListItem>
                                        <asp:ListItem Value="True">Erkek</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Cep Telefonu</td>
                                <td>
                                     <asp:TextBox ID="txtMobileNumb" runat="server" ></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMobileNumb" ErrorMessage="Cep Tlf.  Alanı Boş Geçilemez!"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>Ev Telefonu</td>
                                <td>
                                     <asp:TextBox ID="txtHomeNumb" runat="server" ></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>E-Posta</td>
                                <td>
                                     <asp:TextBox ID="txtEMail" runat="server" ></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Faks</td>
                                <td>
                                     <asp:TextBox ID="txtFax" runat="server" ></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Adres</td>
                                <td>
                                     <asp:TextBox ID="txtAddress" runat="server" ></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Not</td>
                                <td>
                                     <asp:TextBox ID="txtNote" runat="server" ></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Button ID="btnSave" runat="server" Text="Kaydet" OnClick="btnSave_Click" />
                                    <asp:Label ID="lblErr" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>

                        </div>

                    <%--*-******************************--%>
                     <div id ="myAddresses">
                         <asp:GridView ID="gvAddress" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" CssClass="gvAddress">
                             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                             <Columns>
                                 <asp:BoundField DataField="FirstName" HeaderText="Ad" />
                                 <asp:BoundField DataField="LastName" HeaderText="SoyAd" />
                                 <asp:BoundField DataField="MobileNumb" HeaderText="Telefon" />
                                 <asp:BoundField DataField="UserAddress" HeaderText="Adres" />
                                 <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="Detay.aspx?id={0}" Text="Detay" />
                             </Columns>
                             <EditRowStyle BackColor="#999999" />
                             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                             <SortedAscendingCellStyle BackColor="#E9E7E2" />
                             <SortedAscendingHeaderStyle BackColor="#506C8C" />
                             <SortedDescendingCellStyle BackColor="#FFFDF8" />
                             <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                         </asp:GridView>
                         </div>
                </div>
                <div class="cls"></div>
            </div>

        </div>
    </form>
</body>
</html>
