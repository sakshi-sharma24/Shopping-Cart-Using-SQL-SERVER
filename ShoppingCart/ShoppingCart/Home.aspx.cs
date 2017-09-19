using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

namespace ShoppingCart
{
    public partial class Home : System.Web.UI.Page
    {
        Dictionary<string, float> cartItem;
        Dictionary<string, int> itemIds;
        Dictionary<string, int> itemQty;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Item_Added(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Add")
            {
                int rowIndex = Int32.Parse((string)e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];
                var itemId = row.Cells[0].Text;
                var pName = row.Cells[1].Text;
                var cost = row.Cells[2].Text;
                if (Session["cartItem"] == null)
                {
                    cartItem = new Dictionary<string, float>();
                    Session["cartItem"] = cartItem;
                    itemIds = new Dictionary<string, int>();
                    Session["cartItemId"] = itemIds;
                    itemQty = new Dictionary<string, int>();
                    Session["itemQty"] = itemQty;
                }
                else
                {
                    cartItem = (Dictionary<string, float>)Session["cartItem"];
                    itemIds = (Dictionary<string, int>)Session["cartItemId"];
                    itemQty = (Dictionary<string, int>)Session["itemQty"];
                }
                cartItem[pName] = int.Parse(cost);
                itemIds[pName] = Convert.ToInt32(itemId);
                if (itemQty.ContainsKey(pName))
                    itemQty[pName]++;
                else itemQty[pName] = 1;
            }
        }
        protected void MovetoCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }
    }
}


