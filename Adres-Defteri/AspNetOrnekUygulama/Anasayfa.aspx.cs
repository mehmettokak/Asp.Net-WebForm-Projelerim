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
    public partial class Anasayfa : System.Web.UI.Page
    {
        DataHelper _db = new DataHelper();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)//postback işlemi yoksa listemi çeksin,orn butana tıklarsak postback verı gondermektedır.buy anda bu lıstemelenın calısmaması gerekır.Sayfa yenılenecegı ıcın sureklı verıtabanına gitmesı mantıklı degıl
            {
                var listModel = _db.GetListAddress();
                GridViewDataProcess(listModel);//listemizi gridviewe gömecez.
            }
           
        }

        private void GridViewDataProcess(List<Address> model)
        {
            gvAddress.DataSource = model;
            gvAddress.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var model = new Address();
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
            if (ddGender.SelectedValue!="Seçiniz")
            {
                model.Gender =Convert.ToBoolean(ddGender.SelectedValue);
            }
          var count=  _db.Add(model);
            if (count>0)
            {
                ClearAddressForm();
                lblErr.Text = "Kayıt Ekleme Başarılı";
            }
            else
            {
                lblErr.Text = "Kayıt Ekleme Başarısız";
            }
        }

        private void ClearAddressForm()
        {
            txtFirstName.Text = string.Empty; 
           txtLastName.Text = string.Empty;
           txtNickName.Text = string.Empty;
            calBirt.SelectedDate = DateTime.Now ;
            txtEMail.Text = string.Empty;
           txtHomeNumb.Text = string.Empty;
            txtMobileNumb.Text = string.Empty;
           txtFax.Text = string.Empty;
            txtNote.Text = string.Empty;
           txtAddress.Text = string.Empty;
            ddGender.SelectedIndex = 0;
        }
    }
}