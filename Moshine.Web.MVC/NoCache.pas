﻿namespace Moshine.Web.MVC;

interface

uses
  System,
  System.Collections.Generic,
  System.Text, System.Web, System.Web.Mvc;

type

  NoCache = public class(ActionFilterAttribute)
  private
  protected
  public
    method OnResultExecuting(filterContext:ResultExecutingContext); override;
  end;

implementation

method NoCache.OnResultExecuting(filterContext:ResultExecutingContext);
begin
  filterContext.HttpContext.Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
  filterContext.HttpContext.Response.Cache.SetValidUntilExpires(false);
  filterContext.HttpContext.Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
  filterContext.HttpContext.Response.Cache.SetCacheability(HttpCacheability.NoCache);
  filterContext.HttpContext.Response.Cache.SetNoStore();

  inherited OnResultExecuting(filterContext);

end;

end.
