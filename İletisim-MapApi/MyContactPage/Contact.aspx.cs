using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyContactPage
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            var mail = new MailMessage();
            mail.To.Add("xyz@gmail.com");//gönderim yapılacak mail adresi yazıyoruz.
            mail.From = new MailAddress("tokakmehmet@gmail.com","Mehmet TOKAK",Encoding.UTF8);//hangi mailden gonderım yapılacaksa o mail adress yazılır,mail baslıgı belırledık,karakter setimizide belirledik.
            mail.Subject = string.Format("{0},{1} kullanıcısından bir mail aldınız.",txtFirstName.Text,txtLastName.Text);
            mail.SubjectEncoding = Encoding.UTF8;
            mail.Body = txtMessage.Text;
            mail.BodyEncoding = Encoding.UTF8;
            mail.IsBodyHtml = true;
            var client = new SmtpClient("smtp.gmail.com",587);
            client.Credentials = new NetworkCredential("tokakmehmet@gmail.com","Şifre yazılacak");
            client.Port = 587;
            client.EnableSsl = true;
            try
            {
                client.Send(mail);
                ClientScript.RegisterStartupScript(Page.GetType(),"SendMailControl","<script>alert('Mail Göderimi Başarılı.');</script>");
                //scriptle sayfada alerti calıstırıp mail gonderme durumunu kullanıcıya gosterıyoruz.
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}