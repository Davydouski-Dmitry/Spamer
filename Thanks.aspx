<%@ Page Language="C#" %>

<html>
  <body>
      <form id="form1" runat="server">
    ���� ������� ��������� ���������� � ���:<br><br>
    <ul>
      <%
        Response.Write ("<li>���: " + Request["Name"]);
        Response.Write ("<li>����� E-mail: " + Request["EMail"]);

        if (Request["Address"] != null) {
            StringBuilder sb =
                new StringBuilder ("<li>�������� �����: ", 64);
            sb.Append (Request["Address"]);
            sb.Append (", ");
            sb.Append (Request["City"]);
            sb.Append (", ");
            sb.Append (Request["State"]);
            sb.Append (" ");
            sb.Append (Request["ZipCode"]);
            Response.Write (sb.ToString ());
        }

        if (Request["CreditCardNumber"] != null)
            Response.Write ("<li>����� ���������� �����: " +
                Request["CreditCardNumber"]);
      %>
    </ul>
   �������! ���� ������ �������. �������� ���� ��������� ���������!
      </form>
  </body>
</html>