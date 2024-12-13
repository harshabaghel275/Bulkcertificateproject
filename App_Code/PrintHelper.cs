using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Text;
using System.Web.SessionState;
using System.Drawing.Printing;

public class PrintHelper
{
    public PrintHelper()
    {
    }

    public static void PrintWebControl(Control ctrl)
    {
        PrintWebControl(ctrl, string.Empty);
    }

    public static void PrintWebControl(Control ctrl, string Script)
    {
        StringWriter stringWrite = new StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new System.Web.UI.HtmlTextWriter(stringWrite);
        if (ctrl is WebControl)
        {
            Unit w = new Unit(100, UnitType.Percentage);((WebControl)ctrl).Width = w;                        
        }
        Page pg = new Page();
        //PrintDocument pd = new PrintDocument();
        //pd.DefaultPageSettings.Margins.Left = 30;
        //pd.DefaultPageSettings.Margins.Top = 10;
        //pd.DefaultPageSettings.Margins.Right = 10;
        //pd.DefaultPageSettings.Margins.Bottom = 10;
        //pd.OriginAtMargins = true;
        pg.EnableEventValidation = false;
        if (Script != string.Empty)
        {
            pg.ClientScript.RegisterStartupScript(pg.GetType(), "PrintJavaScript", Script);
        }
        HtmlForm frm = new HtmlForm();
        pg.Controls.Add(frm);
        frm.Attributes.Add("runat", "server");
        frm.Controls.Add(ctrl);
        pg.DesignerInitialize();
        pg.RenderControl(htmlWrite);
        string strHTML = stringWrite.ToString();
        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.Write(strHTML);
        HttpContext.Current.Response.Write("<script>window.print();</script>");
        //string style = "<style type=text/css>td { padding: 4px; border: solid 1px #c1c1c1; color: #474545; font-family:Arial; font-size:12px }th { padding:0; color: #3e4d9e; background: #e0d7f4 ; font-family:Arial; text-align:left;text-indent:10px; font-size:14px ;border-top: solid 1px #a99cec; border-left:none;border-right:none; border-bottom:none }{ width: 100%;background-color: #fff; margin: -5px 0 10px 0; border-top: solid 1px #a99cec; border-left:solid 1px #a99cec;border-right:solid 1px #a99cec;font-family:Arial; font-size:15px; </style>";
        //HttpContext.Current.Response.Write(style);
        HttpContext.Current.Response.End();
    }
}
