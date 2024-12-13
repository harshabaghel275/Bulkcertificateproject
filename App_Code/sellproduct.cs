using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for sellproduct
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
    [System.Web.Script.Services.ScriptService]
public class sellproduct : System.Web.Services.WebService {

    public sellproduct()
    {        
        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    //--------------------ProductSearch-----------------------------------
    [WebMethod]
    public string[] Search(string prefixText, int count)
    {
        //if (Session["paid"] == "and Paid='Debit'")
        //{
            ClsConnection Cnn = new ClsConnection();
            count = 10;
            string[] str;
            string SearchWord = "";
            char[] C = { ' ' };
            str = prefixText.Split(C, StringSplitOptions.RemoveEmptyEntries);
            int i;
            for (i = 0; i < str.Length; i++)
            {
                SearchWord = SearchWord + str[i];
                if (i == str.Length - 1) break;
                SearchWord = SearchWord + " near ";
            }
            SearchWord = SearchWord.Replace(".", " ");
            SearchWord = SearchWord.Replace(",", " ");
            SearchWord = SearchWord.Replace(")", " ");
            SearchWord = SearchWord.Replace("(", " ");
            string sql = "Select top 10 'keywords'= Coursename from Coursemaster where   ActiveStatus=1 and Coursename like '" + SearchWord + "%' order by keywords";
            DataTable dt = Cnn.FillTable(sql, "dt");
            string[] items = new string[dt.Rows.Count];
            i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                items.SetValue(dr["keywords"].ToString(), i);
                i++;
            }
            return items;
        //}
      
    }

    //--------------------BrandSearch-----------------------------------
    [WebMethod]
    public string[] ToClientSearch(string prefixText, int count)
    {
        ClsConnection Cnn = new ClsConnection();
        count = 10;
        string[] str;
        string SearchWord = "";
        char[] C = { ' ' };
        str = prefixText.Split(C, StringSplitOptions.RemoveEmptyEntries);
        int i;
        for (i = 0; i < str.Length; i++)
        {
            SearchWord = SearchWord + str[i];
            if (i == str.Length - 1) break;
            SearchWord = SearchWord + " near ";
        }
        SearchWord = SearchWord.Replace(".", " ");
        SearchWord = SearchWord.Replace(",", " ");
        SearchWord = SearchWord.Replace(")", " ");
        SearchWord = SearchWord.Replace("(", " ");
        string sql = "Select top 10 'keywords'= ConsignorTo from LuggageBooking where Active=1 and ConsignorTo like '" + SearchWord + "%'  union Select top 10 'keywords'= ConsignorTo from Luggagebooking  where Active=1 and ConsignorTo like '" + SearchWord + "%' order by keywords";
            DataTable dt = Cnn.FillTable(sql, "dt");
            string[] items = new string[dt.Rows.Count];
            i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                items.SetValue(dr["keywords"].ToString(), i);
                i++;
            }
            return items;
    }
    //--------------------BrandSearch-----------------------------------
    //[WebMethod]
   //public string[] ClientSearch(string prefixText, int count,string oSessionBranchId).......Jubey Sir
    //public string[] ClientSearch(string prefixText, int count,string UserBranch)...........Namrata
    //public string[] ClientSearch(string prefixText, int count, string oSessionBranchId)
    //{
    //    ClsConnection Cnn = new ClsConnection();
    //    //count = 10;
    //    string str;
    //    string SearchWord = "";
    //    char[] C = { ' ' };
    //    //str = prefixText.Split(C, StringSplitOptions.RemoveEmptyEntries);
    //    str = prefixText.Substring(0, prefixText.Length-1);
    //    string str1 = oSessionBranchId;
    //    int i;
    //    //for (i = 0; i < str.Length; i++)
    //    //{
    //    //    SearchWord = SearchWord + str[i];
    //    //    if (i == str.Length - 1) break;
    //    //    SearchWord = SearchWord;
    //    //}
    //    //SearchWord = SearchWord.Replace(".", " ");
    //    //SearchWord = SearchWord.Replace(",", " ");
    //    //SearchWord = SearchWord.Replace(")", " ");
    //    //SearchWord = SearchWord.Replace("(", " ");
    //    SearchWord = str;

    //   // string sql = "Select top 10 'keywords'= Name from ClientInformation  where Active=1 and Name like '" + SearchWord + "%' order by keywords";
    //    //string sql = "Select top 10 'keywords'= Name from ClientInformation  where Active=1 and Name like '" + SearchWord + "%' 
    //    //and UserBranch='" + Session["Branchid"] + "' order by keywords";

    //    //-----------------Jubey Sir---------------------//

    //    string sql = "select top 10 'keywords'= name from clientinformation  where active=1 and name like '" + SearchWord + "%' and userbranch='" + str1 + "' order by keywords";
        

    //    //-----------------Namrata---------------------//

    //    //string sql = "select top 10 'keywords'= name from clientinformation  where active=1 and name like '" + SearchWord + "%' 
    //    //and userbranch='" + UserBranch + "' order by keywords";

    //    DataTable dt = Cnn.FillTable(sql, "dt");
    //    string[] items = new string[dt.Rows.Count];
    //    i = 0;
    //    foreach (DataRow dr in dt.Rows)
    //    {
    //        items.SetValue(dr["keywords"].ToString(), i);
    //        i++;
    //    }
    //    return items;
    //}


    //public string[] ClientSearch(string prefixText, int count, string oSessionBranchId)
    [WebMethod(EnableSession = true)]
    public string[] ClientSearch(string prefixText, int count)
    {
        ClsConnection Cnn = new ClsConnection();
        count = 10;
        string [] str;
        string SearchWord = "";
        char[] C = { ' ' };
        str = prefixText.Split(C, StringSplitOptions.RemoveEmptyEntries);
        //str = prefixText.Substring(0, prefixText.Length - 1);
       //string str1 = oSessionBranchId;
        //string str1 = "1";
        int i;
        for (i = 0; i < str.Length; i++)
        {
            SearchWord = SearchWord + str[i];
            if (i == str.Length - 1) break;
            SearchWord = SearchWord + " near ";
        }
        SearchWord = SearchWord.Replace(".", " ");
        SearchWord = SearchWord.Replace(",", " ");
        SearchWord = SearchWord.Replace(")", " ");
        SearchWord = SearchWord.Replace("(", " ");
        //SearchWord = str;

       // string sql = "Select top 10 'keywords'= Name from ClientInformation  where Active=1 and Name like '" + SearchWord + "%' order by keywords";
        //string sql = "Select top 10 'keywords'= Name from ClientInformation  where Active=1 and Name like '" + SearchWord + "%' 
        //and UserBranch='" + Session["Branchid"] + "' order by keywords";

        //-----------------Jubey Sir---------------------//

        //string sql = "select top 10 'keywords'= name from clientinformation  where active=1 and name like '" + SearchWord + "%' and userbranch='" + str1 + "' order by keywords";

        string sql = "Select top 10 'keywords'= Name from ClientInformation  where Active=1 and UserBranch='" + Session["Branchid"] + "' and Name like '" + SearchWord + "%'  order by keywords";


        //-----------------Namrata---------------------//

        //string sql = "select top 10 'keywords'= name from clientinformation  where active=1 and name like '" + SearchWord + "%' 
        //and userbranch='" + UserBranch + "' order by keywords";

        DataTable dt = Cnn.FillTable(sql, "dt");
        string[] items = new string[dt.Rows.Count];
        i = 0;
        foreach (DataRow dr in dt.Rows)
        {
            items.SetValue(dr["keywords"].ToString(), i);
            i++;
        }
        return items;
    }

     [WebMethod]
    public string[] BankSearch(string prefixText, int count)
    {
        ClsConnection Cnn = new ClsConnection();
        count = 10;
        string[] str;
        string SearchWord = "";
        char[] C = { ' ' };
        str = prefixText.Split(C, StringSplitOptions.RemoveEmptyEntries);
        int i;
        for (i = 0; i < str.Length; i++)
        {
            SearchWord = SearchWord + str[i];
            if (i == str.Length - 1) break;
            SearchWord = SearchWord + " near ";
        }
        SearchWord = SearchWord.Replace(".", " ");
        SearchWord = SearchWord.Replace(",", " ");
        SearchWord = SearchWord.Replace(")", " ");
        SearchWord = SearchWord.Replace("(", " ");
        string sql = "Select top 10 'keywords'= Accountname from BankAccount where Active=1 and SubCateid in (9) and Accountname like '" + SearchWord + "%'  order by keywords";
        DataTable dt = Cnn.FillTable(sql, "dt");
        string[] items = new string[dt.Rows.Count];
        i = 0;
        foreach (DataRow dr in dt.Rows)
        {
            items.SetValue(dr["keywords"].ToString(), i);
            i++;
        }
        return items;
    }

      [WebMethod]
     public string[] LedgerSearch(string prefixText, int count)
     {
         ClsConnection Cnn = new ClsConnection();
         count = 10;
         string[] str;
         string SearchWord = "";
         char[] C = { ' ' };
         str = prefixText.Split(C, StringSplitOptions.RemoveEmptyEntries);
         int i;
         for (i = 0; i < str.Length; i++)
         {
             SearchWord = SearchWord + str[i];
             if (i == str.Length - 1) break;
             SearchWord = SearchWord + " near ";
         }
         SearchWord = SearchWord.Replace(".", " ");
         SearchWord = SearchWord.Replace(",", " ");
         SearchWord = SearchWord.Replace(")", " ");
         SearchWord = SearchWord.Replace("(", " ");
         string sql = "Select top 10 'keywords'= Name from ClientInformation where Active=1  and Name like '" + SearchWord + "%' union Select top 10 'keywords'= Accountname from BankAccount  where Active=1 and Accountname like '" + SearchWord + "%' order by keywords";
         DataTable dt = Cnn.FillTable(sql, "dt");
         string[] items = new string[dt.Rows.Count];
         i = 0;
         foreach (DataRow dr in dt.Rows)
         {
             items.SetValue(dr["keywords"].ToString(), i);
             i++;
         }
         return items;
     }

      [WebMethod]
      public string[] BusSearch(string prefixText, int count)
      {
          ClsConnection Cnn = new ClsConnection();
          count = 10;
          string[] str;
          string SearchWord = "";
          char[] C = { ' ' };
          str = prefixText.Split(C, StringSplitOptions.RemoveEmptyEntries);
          int i;
          for (i = 0; i < str.Length; i++)
          {
              SearchWord = SearchWord + str[i];
              if (i == str.Length - 1) break;
              SearchWord = SearchWord + " near ";
          }
          SearchWord = SearchWord.Replace(".", " ");
          SearchWord = SearchWord.Replace(",", " ");
          SearchWord = SearchWord.Replace(")", " ");
          SearchWord = SearchWord.Replace("(", " ");
          string sql = "Select all 'keywords'= BusNo from BusInformation where Active=1 and BusNo like '" + SearchWord + "%' order by keywords";
          DataTable dt = Cnn.FillTable(sql, "dt");
          string[] items = new string[dt.Rows.Count];
          i = 0;
          foreach (DataRow dr in dt.Rows)
          {
              items.SetValue(dr["keywords"].ToString(), i);
              i++;
          }
          return items;
      }

      [WebMethod]
      public string[] luggage_search(string prefixText, int count)
      {
          ClsConnection Cnn = new ClsConnection();
          count = 10;
          string[] str;
          string SearchWord = "";
          char[] C = { ' ' };
          str = prefixText.Split(C, StringSplitOptions.RemoveEmptyEntries);
          int i;
          for (i = 0; i < str.Length; i++)
          {
              SearchWord = SearchWord + str[i];
              if (i == str.Length - 1) break;
              SearchWord = SearchWord + " near ";
          }
          SearchWord = SearchWord.Replace(".", " ");
          SearchWord = SearchWord.Replace(",", " ");
          SearchWord = SearchWord.Replace(")", " ");
          SearchWord = SearchWord.Replace("(", " ");
          string sql = "Select top 10 'keywords'= BookingId from LuggageBooking where Active=1 and BookingId like '%" + SearchWord + "%' order by keywords";
          DataTable dt = Cnn.FillTable(sql, "dt");
          string[] items = new string[dt.Rows.Count];
          i = 0;
          foreach (DataRow dr in dt.Rows)
          {
              items.SetValue(dr["keywords"].ToString(), i);
              i++;
          }
          return items;
      }

      [WebMethod]
      public string[] chaln_search(string prefixText, int count)
      {
          ClsConnection Cnn = new ClsConnection();
          count = 10;
          string[] str;
          string SearchWord = "";
          char[] C = { ' ' };
          str = prefixText.Split(C, StringSplitOptions.RemoveEmptyEntries);
          int i;
          for (i = 0; i < str.Length; i++)
          {
              SearchWord = SearchWord + str[i];
              if (i == str.Length - 1) break;
              SearchWord = SearchWord + " near ";
          }
          SearchWord = SearchWord.Replace(".", " ");
          SearchWord = SearchWord.Replace(",", " ");
          SearchWord = SearchWord.Replace(")", " ");
          SearchWord = SearchWord.Replace("(", " ");
          string sql = "Select top 10 'keywords'= ChallanId from  V#DispatchReport where Active=1 and ChallanId like '%" + SearchWord + "%' order by keywords";
          DataTable dt = Cnn.FillTable(sql, "dt");
          string[] items = new string[dt.Rows.Count];
          i = 0;
          foreach (DataRow dr in dt.Rows)
          {
              items.SetValue(dr["keywords"].ToString(), i);
              i++;
          }
          return items;
      }
   }