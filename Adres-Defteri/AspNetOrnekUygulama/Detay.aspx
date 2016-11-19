<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detay.aspx.cs" Inherits="AspNetOrnekUygulama.Detay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
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
                                    <asp:Button ID="btnSave" runat="server" Text="Kaydet" OnClick="btnSave_Click"  />
                                    <asp:Button ID="btnDelete" runat="server" Text="Sil" OnClientClick="javascript:return confirm('Bu Kaydı Silmek İstiyor musunuz?')" OnClick="btnDelete_Click"  />
                                    <asp:Label ID="lblErr" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
    </div>
    </form>
</body>
</html>
