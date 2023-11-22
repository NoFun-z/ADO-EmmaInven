using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FinalProject1210.EmmasDataSetTableAdapters;
using FinalProject1210;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Data;

namespace FinalProject1210_WebForm
{
    public partial class Inventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Login.aspx");
            }
            //Hiding specific fields
            ddlProduct.Visible = false;
            gvInvenOrder.Visible = false;
            lblNoCust.Text = "";
            txtNoCust.Visible = false;
            lblNoOrders.Text = "";
            txtNoOrders.Visible = false;
            lblInvenResult.Text = "";
        }

        private static EmmasDataSet dsEmmaStore;

        static Inventory()
        {
            // Initialize the dataset
            dsEmmaStore = new EmmasDataSet();

            // Initialize the table adapters
            TotalCustomerTableAdapter daTotalCust = new TotalCustomerTableAdapter();
            TotalOrdersTableAdapter daTotalOrders = new TotalOrdersTableAdapter();
            try
            {
                daTotalCust.Fill(dsEmmaStore.TotalCustomer);
                daTotalOrders.Fill(dsEmmaStore.TotalOrders);
            }
            catch { }
        }

        //Get total filters
        protected string GetTotalCriteria()
        {
            int id = Convert.ToInt32(Session["productID"]);
            string criteria = "";

            //Grab filter options
            // Gets order by Customer ID
            criteria = "productID = " + id + "";
            return criteria;
        }

        //Find total customer
        protected void FindTotalCustomer()
        {
            string criteria = GetTotalCriteria();

            DataRow[] rows = dsEmmaStore.TotalCustomer.Select(criteria);
            //Bind data to textbox
            if (rows.Length > 0)
            {
                txtNoCust.Text = rows[0].ItemArray[0].ToString();
            }
            else
            {
                txtNoCust.Text = "0";
            }
        }

        //Get total filters
        protected string GetTotalOrdersCriteria()
        {
            int id = Convert.ToInt32(Session["productID"]);
            string criteria = "";

            //Grab filter options
            // Gets order by Customer ID
            criteria = "productID = " + id + "";
            return criteria;
        }

        //Find total orders
        protected void FindTotalOrders()
        {
            string criteria = GetTotalOrdersCriteria();

            DataRow[] rows = dsEmmaStore.TotalOrders.Select(criteria);
            //Bind data to textbox
            if (rows.Length > 0)
            {
                txtNoOrders.Text = rows[0].ItemArray[0].ToString();
            }
            else
            {
                txtNoOrders.Text = "0";
            }
        }

        //product filter
        protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.gvInvenSignle.PageIndex = this.ddlProduct.SelectedIndex;
            ddlProduct.Visible = true;
        }

        //Show full records on click
        protected void btnShowInven_Click(object sender, EventArgs e)
        {
            this.gvInvenFull.Visible = true;
            this.gvInvenSignle.Visible = false;
            this.dvUpdateInven.Visible = true;
            this.ddlProduct.Visible = false;
        }

        //Show specific record on click
        protected void btnFilterInven_Click(object sender, EventArgs e)
        {
            this.gvInvenFull.Visible = false;
            this.gvInvenSignle.Visible = true;
            this.dvUpdateInven.Visible = false;
            this.ddlProduct.Visible = true;
        }

        //Full records click event
        protected void gvInvenFull_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.gvInvenFull.Visible = true;
            this.gvInvenSignle.Visible = false;
            gvInvenOrder.Visible = true;
            ddlProduct.Visible = false;
            Session["invenID"] = Convert.ToInt32(gvInvenFull.SelectedRow.Cells[0].Text);
            DropDownList ddlproduct = (DropDownList)gvInvenFull.SelectedRow.Cells[5].FindControl("DropDownList2");
            Session["productID"] = Convert.ToInt32(ddlproduct.SelectedValue);
            FindTotalCustomer();
            FindTotalOrders();
            lblNoCust.Text = "#Customers bought this product";
            txtNoCust.Visible = true;
            lblNoOrders.Text = "#Orders this product has";
            txtNoOrders.Visible = true;
            lblInvenResult.Visible = true;
            dvUpdateInven.Visible = true;
        }

        //Single record click event
        protected void gvInvenSignle_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.gvInvenSignle.Visible = true;
            this.gvInvenFull.Visible = false;
            gvInvenOrder.Visible = true;
            ddlProduct.Visible = true;
            Session["invenID"] = Convert.ToInt32(gvInvenSignle.SelectedRow.Cells[0].Text);
            DropDownList ddlproduct2 = (DropDownList)gvInvenSignle.SelectedRow.Cells[5].FindControl("DropDownList4");
            Session["productID"] = Convert.ToInt32(ddlproduct2.SelectedValue);
            FindTotalCustomer();
            FindTotalOrders();
            lblNoCust.Text = "#Customers bought this product";
            txtNoCust.Visible = true;
            lblNoOrders.Text = "#Orders this product has";
            txtNoOrders.Visible = true;
        }

        protected void dvUpdateInven_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                lblInvenResult.Text = "Unable to delete this record";
            }
            else
            {
                lblInvenResult.Text = "Successfully deleted this record";
            }
        }

        protected void gvInvenOrder_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvInvenSignle_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                lblInvenResult.Text = "Unable to delete this record";
            }
            else
            {
                lblInvenResult.Text = "Successfully deleted this record";
            }
        }
    }
}