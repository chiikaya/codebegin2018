using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ForeignStudentManager
{
    public static class DialogMessage
    {
      static public  string CreateMessage(string s)
        {
            string temp = string.Format("<script language='Javascript'>alert('{0}');</script>", s);

            return temp;
        }
    }
}