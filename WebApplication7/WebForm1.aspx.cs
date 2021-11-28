using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication7
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

        protected void FormView1_PageIndexChanging1(object sender, FormViewPageEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void FormView1_PageIndexChanging2(object sender, FormViewPageEventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click2(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String connectionString = @"Data Source  =(localdb)\MSSQLLocalDB; Initial Catalog = Baza_Danych_wypożyczalnia; Integrated Security = true";
            SqlConnection connection = new SqlConnection(connectionString);
            String commandString = @"delete from rezerwacje where idrezerwacji = @parametr";
            SqlCommand command = new SqlCommand(commandString);
            connection.Open();
            command.Parameters.AddWithValue("@parametr", TextBox3.Text);
            command.Connection = connection;
            var zz = command.ExecuteScalar();
            connection.Close();
            TextBox3.Text = "";
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }
    }
}