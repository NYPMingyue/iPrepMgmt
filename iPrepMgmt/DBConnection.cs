using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBConnection
/// </summary>

    public class DBConnection
    {
        public SqlConnection GetConnection()
        {
            SqlConnection dbCon;
            string connString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

            dbCon = new SqlConnection(connString);

            return dbCon;
        }
    }

