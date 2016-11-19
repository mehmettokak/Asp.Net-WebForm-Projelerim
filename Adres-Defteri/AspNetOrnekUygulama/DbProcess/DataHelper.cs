using AspNetOrnekUygulama.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AspNetOrnekUygulama.DbProcess
{
    public class DataHelper
    {
        private SqlConnection GetConnection()
        {
            var connectionString = ConfigurationManager.ConnectionStrings["Address_SQL"].ConnectionString;
            var con = new SqlConnection(connectionString);
            return con;
        }
        public int Add(Address model)
        {
            var komut = new SqlCommand();
            var conn= GetConnection();
            komut.Connection= conn;//veri tabanına baglantı yolu
            //hangi texti çalıstıracagını yazıyoruz 
            komut.CommandText = @"INSERT INTO [TOKAK_SQL].[dbo].[Kisiler]
                                   ([ad]
                                   ,[soyAd]
                                   ,[takmaAd]
                                   ,[dogumTarihi]
                                   ,[cinsiyet]
                                   ,[telefon1]
                                   ,[telefon2]
                                   ,[fax]
                                   ,[ePosta]
                                   ,[adres]
                                   ,[not])
                             VALUES
                                   (@ad
                                   , @soyAd
                                   , @takmaAd
                                   , @dogumTarihi
                                   , @cinsiyet
                                   , @telefon1
                                   , @telefon2
                                   , @fax
                                   , @ePosta
                                   , @adres
                                   , @not)";
            //usteki @ olan parametreleri modelden gelenı dolduracaz.
            komut.Parameters.Add(new SqlParameter("@ad",model.FirstName));
            komut.Parameters.Add(new SqlParameter("@soyAd", model.LastName));
            komut.Parameters.Add(new SqlParameter("@takmaAd", model.NickName));
            komut.Parameters.Add(new SqlParameter("@dogumTarihi", model.BirtDay));
            komut.Parameters.Add(new SqlParameter("@cinsiyet", model.Gender));
            komut.Parameters.Add(new SqlParameter("@telefon1", model.MobileNumb));
            komut.Parameters.Add(new SqlParameter("@telefon2", model.HomeNumb));
            komut.Parameters.Add(new SqlParameter("@ePosta", model.EMail));
            komut.Parameters.Add(new SqlParameter("@adres", model.UserAddress));
            komut.Parameters.Add(new SqlParameter("@fax", model.Fax));
            komut.Parameters.Add(new SqlParameter("@not", model.Note));
            conn.Open();
            int count = 0;
            try
            {
               count = komut.ExecuteNonQuery();//Kayıt işlemi gerçekleştir dedik.
            }
            catch (Exception)
            {

                
            }
         
            conn.Close();
            conn.Dispose();//garbarage collector ram uzerindeki veri tabanı ıslem kayıtlarını temızler.ramı rahat tutmus oluyoruz.
            return count;
        }
 
        public List<Address> GetListAddress()
        {
            var listModel = new List<Address>();
            var conn = GetConnection();
            var command = new SqlCommand("select * from Kisiler",conn);//conn baglantı yoluyla db ye git kişiler tablomu bul getir.
            conn.Open();
            var list = command.ExecuteReader();//toblomun içine girip dataları okudum.lşste halinde hazır.
            while (list.Read())//listemin icindekilerine gir teker teker oku.Read tru false doner.tru ıse jkayıt var false ıse kayıt yok
            {
                listModel.Add(new Address() {

                    Id = Convert.ToInt32(list["id"]),
                    FirstName = list["ad"].ToString(),
                    LastName = list["soyAd"].ToString(),
                    NickName = list["takmaAd"].ToString(),
                    BirtDay = Convert.ToDateTime(list["dogumTarihi"]),
                    Gender = Convert.ToBoolean( list["cinsiyet"]),
                    MobileNumb = list["telefon1"].ToString(),
                    Fax = list["fax"].ToString(),
                    UserAddress = list["adres"].ToString(),
                    EMail = list["ePosta"].ToString(),
                    Note = list["not"].ToString(),
                    HomeNumb = list["telefon2"].ToString()
                });
            }
            conn.Close();
            conn.Dispose();
            return listModel;
        }

        public Address GetById(int id)
        {//GetListAddress benzer yapıda
            var model = new Address();
            var conn = GetConnection();
            var command = new SqlCommand("select * from Kisiler where id=@Id", conn);//conn baglantı yoluyla db ye git kişiler tablomu bul getir.
            command.Parameters.Add(new SqlParameter("@Id",id));
            conn.Open();
            var list = command.ExecuteReader();//toblomun içine girip dataları okudum.lşste halinde hazır.
            while (list.Read())//listemin icindekilerine gir teker teker oku.Read tru false doner.tru ıse jkayıt var false ıse kayıt yok
            {
              model=new Address()
                {

                    Id = Convert.ToInt32(list["id"]),
                    FirstName = list["ad"].ToString(),
                    LastName = list["soyAd"].ToString(),
                    NickName = list["takmaAd"].ToString(),
                    BirtDay = Convert.ToDateTime(list["dogumTarihi"]),
                    Gender = Convert.ToBoolean(list["cinsiyet"]),
                    MobileNumb = list["telefon1"].ToString(),
                    Fax = list["fax"].ToString(),
                    UserAddress = list["adres"].ToString(),
                    EMail = list["ePosta"].ToString(),
                    Note = list["not"].ToString(),
                    HomeNumb = list["telefon2"].ToString()
                };
            }
            conn.Close();
            conn.Dispose();
            return model;
        }
        public int UpdateAddress(Address model)
        {//AddAdress benzer yapı var
            if (model.Id<=0)
            {
                return 0;//id istediğim gibi değilse geldıgın gıbı gerı don.
            }
            var komut = new SqlCommand();
            var conn = GetConnection();
            komut.Connection = conn;//veri tabanına baglantı yolu
            //hangi texti çalıstıracagını yazıyoruz 
            komut.CommandText = @"UPDATE [dbo].[Kisiler]
                                       SET [ad] = @ad
                                          ,[soyAd] = @soyAd
                                          ,[takmaAd] = @takmaAd
                                          ,[dogumTarihi] = @dogumTarihi
                                          ,[cinsiyet] = @cinsiyet
                                          ,[telefon1] = @telefon1
                                          ,[telefon2] = @telefon2
                                          ,[fax] = @fax
                                          ,[ePosta] = @ePosta
                                          ,[adres] = @adres
                                          ,[not] = @not
                                     WHERE id = @Id";
            //usteki @ olan parametreleri modelden gelenı dolduracaz.
            komut.Parameters.Add(new SqlParameter("@Id", model.Id));
            komut.Parameters.Add(new SqlParameter("@ad", model.FirstName));
            komut.Parameters.Add(new SqlParameter("@soyAd", model.LastName));
            komut.Parameters.Add(new SqlParameter("@takmaAd", model.NickName));
            komut.Parameters.Add(new SqlParameter("@dogumTarihi", model.BirtDay));
            komut.Parameters.Add(new SqlParameter("@cinsiyet", model.Gender));
            komut.Parameters.Add(new SqlParameter("@telefon1", model.MobileNumb));
            komut.Parameters.Add(new SqlParameter("@telefon2", model.HomeNumb));
            komut.Parameters.Add(new SqlParameter("@ePosta", model.EMail));
            komut.Parameters.Add(new SqlParameter("@adres", model.UserAddress));
            komut.Parameters.Add(new SqlParameter("@fax", model.Fax));
            komut.Parameters.Add(new SqlParameter("@not", model.Note));
            conn.Open();
            int count = 0;
            try
            {
                count = komut.ExecuteNonQuery();//Kayıt işlemi gerçekleştir dedik.
            }
            catch (Exception)
            {


            }

            conn.Close();
            conn.Dispose();//garbarage collector ram uzerindeki veri tabanı ıslem kayıtlarını temızler.ramı rahat tutmus oluyoruz.
            return count;
        }
       public int DeleteAddress(int id)
        {
            var komut = new SqlCommand();
            var conn = GetConnection();
            komut.Connection = conn;//veri tabanına baglantı yolu
            //hangi texti çalıstıracagını yazıyoruz 
            komut.CommandText = @"DELETE FROM [dbo].[Kisiler] WHERE id = @Id";
            //usteki @ olan parametreleri modelden gelenı dolduracaz.
            komut.Parameters.Add(new SqlParameter("@Id",id));
            conn.Open();
            int count = 0;
            try
            {
                count = komut.ExecuteNonQuery();// işlemi gerçekleştir dedik.
            }
            catch (Exception)
            { }

            conn.Close();
            conn.Dispose();//garbarage collector ram uzerindeki veri tabanı ıslem kayıtlarını temızler.ramı rahat tutmus oluyoruz.
            return count;
        }
    }
}