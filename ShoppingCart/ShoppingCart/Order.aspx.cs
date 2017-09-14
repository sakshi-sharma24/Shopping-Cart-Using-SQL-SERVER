using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace ShoppingCart
{
    public partial class Order : System.Web.UI.Page
    {
        Dictionary<string, float> cartItem;
        Dictionary<string, int> itemQty;
        Dictionary<string, int> itemIds;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cartItem"] != null)
            {
                cartItem = (Dictionary<string, float>)Session["cartItem"];
                itemIds = (Dictionary<string, int>)Session["cartItemId"];
                itemQty = (Dictionary<string, int>)Session["itemQty"];
                float purchase = (float)Session["purchase"];
                string orderId;
                string connectionString = WebConfigurationManager.ConnectionStrings["ShoppingCartConnectionString"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "Insert into OrderList OUTPUT inserted.OrderId values(@DateTime,@TotalAmount)";
                    cmd.Parameters.AddWithValue("DateTime", DateTime.UtcNow.AddHours(5.5));
                    cmd.Parameters.AddWithValue("TotalAmount", purchase.ToString());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable returnedData = new DataTable();
                    da.Fill(returnedData);
                    orderId = (returnedData.Rows[0][0]).ToString();
                }
                foreach (KeyValuePair<string, int> pair in itemIds)
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        SqlCommand cmd = new SqlCommand();
                        cmd.Connection = connection;
                        cmd.CommandText = "Insert into OrderDetails values(@OrderId,@ProductId,@Quantity,@Price)";
                        cmd.Parameters.AddWithValue("OrderId", Convert.ToInt32(orderId));
                        cmd.Parameters.AddWithValue("ProductId", pair.Value);
                        cmd.Parameters.AddWithValue("Price", cartItem[pair.Key].ToString());
                        cmd.Parameters.AddWithValue("Quantity", itemQty[pair.Key]);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable returnedData = new DataTable();
                        da.Fill(returnedData);
                    }
                }
            }
            else Response.Redirect("Home.aspx");
        }  
    }
}