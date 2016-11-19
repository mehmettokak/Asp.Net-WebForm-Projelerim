<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="MyContactPage.Contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-theme.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery.form-validator.min.js"></script>
     <script src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <title></title>
    <script type="text/javascript">
        var informationWindow = new google.maps.InfoWindow();
        var marker;
        var map;
        //  $(document).ready---dokuman hazır oldugunda yanı scriptlerim calıstıgında belirlenen işlemi yap
        $(document).ready(function () {
            //hata mesajıjını ıstdıgımız gıbı şekıllendırelım.
            var msg = { requiredFields:"Bu alanın doldurulması zorunludur.",badEmail:"Geçerli bir Email adresi giriniz."};//required ve email  olanlar bu mesajı doner
            $.validate({ language: msg });
           

            var myLoca = new google.maps.LatLng(40.987472, 28.724143);//adresimizin koordinatını verdık.

            var mapOpt = { center: myLoca, zoom: 16 };//kordinatlarımız ortada ve 16 zoom degerınde gozuksun
            //marker bir işaretci belirmemız gerekır.
            marker = new google.maps.Marker({
                position: myLoca,
                icon: 'http://icons.iconarchive.com/icons/icons-land/vista-map-markers/48/Map-Marker-Push-Pin-1-Chartreuse-icon.png',
                title: 'Adresimiz'
            });

            informationWindow.setContent('Adresimiz <b>tam olarak</b> burada');//harita uzerınde nesneye tıklandıgında gorunmesını ıstedıgımız mesajdır.logo içerik vb gibi seylerde eklenebışır.

            map = new google.maps.Map(document.getElementById('map'), mapOpt);//id si map olan tag a haritamızı atıyoruz.

            marker.setMap(map);

            google.maps.event.addListener(marker, 'click', markerClick);//surekli markerın clıck olayını takıp et clık olursa aşagıdakı metodu calıstır. metodu calıstır.
        });
        function markerClick() {
            informationWindow.open(map, marker);
        }
    </script>
       <style type="text/css">
        .map {
            min-height: 300px;
            min-width: 300px;
        }
    </style>


</head>
<body>
   <div class="container">
       <div class="page-header">
           <div class="clearfix">
  <div class="col-md-12">
               <h1>Bize Ulaşın</h1>
           </div>
           </div>
         

       </div>
       <div class="clearfix">
           <div class="container">
               <div class="row">
                   <div class="col-md-6">
                       <form runat="server">
                           <fieldset>
                               <legend class="text-center header"></legend>
                               <div class="form-group">
                                   <asp:TextBox runat="server" CssClass="form-control" ID="txtFirstName" placeholder="Adınız ?" data-validation="required"></asp:TextBox>
                               </div>
                                <div class="form-group">
                                   <asp:TextBox runat="server" CssClass="form-control" ID="txtLastName" placeholder="Soyadınız ?" data-validation="required"></asp:TextBox>
                               </div>
                                <div class="form-group">
                                   <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" placeholder="Mail Adresiniz ?" data-validation="email"></asp:TextBox>
                               </div>
                                <div class="form-group">
                                   <asp:TextBox runat="server" CssClass="form-control" ID="txtMessage" placeholder="Mesajınız ?" data-validation="required"></asp:TextBox>
                               </div>
                                <div class="form-group">
                                    <div class="text-center">
                                   <asp:Button runat="server" CssClass="btn btn-primary btn-lg" ID="btnSend" text="Gönder" TextMode="MultiLine" data-validation="required" OnClick="btnSend_Click"></asp:Button>
                            </div>
                                </div>
                           </fieldset>
                       </form>
                   </div>
                        <div class="col-md-6">
                        <div>
                            <div class="panel panel-default">
                                <h4>
                                    <div class="text-center">Adresimiz</div>
                                </h4>
                                <div class="panel-body text-center">
                                    <div>
                                        Gümüşpala Mah.
                                        <br />
                                       İstanbul Avcılar
                                        05311 7221655
                                    </div>
                                    <div class="map" id="map"></div>
                                    <!-- 40.987472, 28.724143 -->
                                </div>
                            </div>
                        </div>
                    </div>
                   <div>
                    </div>
               </div>

           </div>
       </div>
  </div>
</body>
</html>
