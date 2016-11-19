using AspNetOrnekUygulama.DbProcess;
using AspNetOrnekUygulama.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspNetOrnekUygulama
{
    public partial class Detay : System.Web.UI.Page
    {
        DataHelper _db = new DataHelper();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int id;
                if (int.TryParse(Request["id"],out id)) //int.TryParse =>int cevirir.Request["id"]=>dısardandan querystrınten gelen id yakalar.out id=>yakaladıgı id yi dısardaki id ye esitler
                {
                    GetModelForId(id);
                }
            }
        }

        private void GetModelForId(int id)
        {
            var model = _db.GetById(id);
            txtFirstName.Text = model.FirstName;
            txtLastName.Text = model.LastName;
            txtNickName.Text = model.NickName;
            calBirt.SelectedDate = model.BirtDay;
            ddGender.SelectedValue = model.Gender.ToString();
            txtMobileNumb.Text = model.MobileNumb;
            txtHomeNumb.Text = model.HomeNumb;
            txtEMail.Text = model.EMail;
            txtFax.Text = model.Fax;
            txtAddress.Text = model.UserAddress;
            txtNote.Text = model.Note;


        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int id;
            if (!int.TryParse(Request["id"], out id)) //id yakalama işlemi basarısız ise
            {
                return; //bos don
            }
            var model = new Address();
            model.Id = id;
            model.FirstName = txtFirstName.Text;
            model.LastName = txtLastName.Text;
            model.NickName = txtNickName.Text;
            model.BirtDay = calBirt.SelectedDate;
            model.EMail = txtEMail.Text;
            model.HomeNumb = txtHomeNumb.Text;
            model.MobileNumb = txtMobileNumb.Text;
            model.Fax = txtFax.Text;
            model.Note = txtNote.Text;
            model.UserAddress = txtAddress.Text;
            if (ddGender.SelectedValue != "Seçiniz")
            {
                model.Gender = Convert.ToBoolean(ddGender.SelectedValue);
            }
            var count = _db.UpdateAddress(model);
            if (count > 0)
            {
               
                lblErr.Text = "Kayıt Ekleme Başarılı";
            }
            else
            {
                lblErr.Text = "Kayıt Ekleme Başarısız";
            }
           
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int id ;
            if (int.TryParse(Request.QueryString["id"],out id))
            {
                if (_db.DeleteAddress(id) > 0)
                {//İşlem basarılı ıse Anasayfa yonlendırılecek.Normalde responsiveRedirect ile yapılıyor.biz fancybox kullandıgımız ıcın faklı bır kullanım olacak.javascriptle yonlendrecez.
                    ClientScript.RegisterStartupScript(GetType(), "Load", "<script type='text/javascript'>window.parent.location.href='/Anasayfa.aspx'</script>");
                }
            }
           
            
        }
    }
}