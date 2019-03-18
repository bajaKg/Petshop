using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Link
/// </summary>
public class Link
{
    public Link()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static string BuildAbsolute(string relativeUri)
    {
        Uri uri = HttpContext.Current.Request.Url;
        string app = HttpContext.Current.Request.ApplicationPath;
        if (!app.EndsWith("/")) app += "/";
        relativeUri = relativeUri.TrimStart('/');
        return HttpUtility.UrlPathEncode(String.Format("http://{0}:{1}{2}{3}", uri.Host, uri.Port, app, relativeUri));
    }

    public static string ToProduct(string productId)
    {
        return BuildAbsolute(String.Format("Proizvod.aspx?ProductID={0}", productId));
    }
}
