<html>
  <head>
    <style>
    <!--
      body { font: 10pt verdana };
      table { font: 10pt verdana };
      input { font: 10pt verdana };
    -->
    </style>
  </head>
  <body>
    <table cellpadding="4" border="1">
      <tr bgcolor="yellow">
        <td>
������������! �� ������������ ����� "���� � ������".
 ���� ��� ��������� ���� ������� � �� ������ �� �������������, �������� �������� � ��� � 
 �� ����� ��������� ������� ��� � ����� �������. ��������� ���� ��� ��� ������ 
 ����� ��������, ������� �������� ����� ����� ��������� ����� � �� 
 �������� ��� �������� �������������� �� ��������������� 
 ���������� � ���.
        </td>
      </tr>
    </table>
    <h3>���� �� ������ ������������� ���� �����, ���������� ������� ���� ���������:</h3>
    <form runat="server">
      <table cellpadding="4">
        <tr>
          <td align="right">
            ���
          </td>
          <td>
            <asp:TextBox ID="Name" RunAt="server" />
          </td>
          <td>
            <asp:RequiredFieldValidator
              ControlToValidate="Name"
              ErrorMessage="����������, ������� ���� ���"
              Display="dynamic"
              RunAt="server"
            />
          </td>
        </tr>
        <tr>
          <td align="right">
           ���� E-Mail 
          </td>
          <td>
            <asp:TextBox ID="EMail" RunAt="server" />
          </td>
          <td>
            <asp:RequiredFieldValidator
              ControlToValidate="EMail"
              ErrorMessage="����������, ������� ����� ����� e-mail "
              Display="dynamic"
              RunAt="server"
            />
            <asp:RegularExpressionValidator
              ControlToValidate="EMail"
              ValidationExpression="^[\w\.-]+@[\w-]+\.[\w\.-]+$"
              ErrorMessage="�������� ������ e-mail ������"
              Display="dynamic"
              RunAt="server"
            />
          </td>
        </tr>
        <tr>
          <td align="right">
            ����� ����������
          </td>
          <td>
            <asp:TextBox ID="Address" RunAt="server" />
          </td>
          <td>
          </td>
        </tr>
        <tr>
          <td align="right">
            �����
          </td>
          <td>
            <asp:TextBox ID="City" RunAt="server" />
          </td>
          <td>
          </td>
        </tr>
        <tr>
          <td align="right">
            �������
          </td>
          <td>
            <asp:DropDownList ID="StateList" RunAt="server">
              <asp:ListItem Text="���������" RunAt="server" />
              <asp:ListItem Text="���������" RunAt="server" />
              <asp:ListItem Text="����������" RunAt="server" />
              <asp:ListItem Text="�����������" RunAt="server" />
              <asp:ListItem Text="�������" RunAt="server" />
             <asp:ListItem Text="�����������" RunAt="server" />

            </asp:DropDownList>
          </td>
          <td>
          </td>
        </tr>
        <tr>
          <td align="right">
            �������� ������
          </td>
          <td>
            <asp:TextBox ID="ZipCode" RunAt="server" />
          </td>
          <td>
            <asp:RegularExpressionValidator
              ControlToValidate="ZipCode"
              ValidationExpression="^(\d{6})$"
              ErrorMessage="�������� ������"
              Display="dynamic"
              RunAt="server"
            />
          </td>
        </tr>
        <tr>
          <td align="right">
            ����� ���������� �����
          </td>
          <td>
            <asp:TextBox ID="CreditCardNumber" RunAt="server" />
          </td>
          <td>
            <asp:RegularExpressionValidator
              ControlToValidate="CreditCardNumber"
              ValidationExpression="^(\d{16})$"
              ErrorMessage="�������� ����� �����"
              Display="dynamic"
              RunAt="server"
            />
          </td>
        </tr>
        <tr>
          <td>
          </td>
          <td>
            <asp:Button Text="��������� ������" OnClick="OnSignMeUp"
              RunAt="server" />
          </td>
          <td>
              
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>

<script language="C#" runat="server">
  void OnSignMeUp (Object sender, EventArgs e)
  {
      if (IsValid) {
          StringBuilder sb = new StringBuilder ("Thanks.aspx?Name=", 256);
          sb.Append (Name.Text);
          sb.Append ("&EMail=");
          sb.Append (EMail.Text);

          string address = Address.Text;
          string city = City.Text;
          string state = StateList.SelectedItem.Text;
          string zip = ZipCode.Text;

          if (address.Length > 0 && city.Length > 0 && zip.Length > 0) {
              sb.Append ("&Address=");
              sb.Append (address);
              sb.Append ("&City=");
              sb.Append (city);
              sb.Append ("&State=");
              sb.Append (state);
              sb.Append ("&ZipCode=");
              sb.Append (zip);
          }

          string number = CreditCardNumber.Text;

          if (number.Length > 0) {
              sb.Append ("&CreditCardNumber=");
              sb.Append (number);
          }

          Response.Redirect (sb.ToString ());
      }
  }
</script>