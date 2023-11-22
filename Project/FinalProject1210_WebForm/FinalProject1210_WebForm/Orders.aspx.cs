using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FinalProject1210.EmmasDataSetTableAdapters;
using FinalProject1210;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Data.SqlClient;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;
using System.Web.DynamicData;
using System.Xml.Linq;

namespace FinalProject1210_WebForm
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Login.aspx");
            }

            //Hide fields on page load
            custForm.Visible = false;
            lblStatus.Text = "";
            lblEmp.Visible = false;
            lblOrderInsert.Visible = false;
            lblOrderPrice.Visible = false;
            GvInvenOrder.Visible = false;
        }

        private static EmmasDataSet dsEmmaStore;

        static Orders()
        {
            // Initialize the dataset
            dsEmmaStore = new EmmasDataSet();

            // Initialize the table adapters
            customerTableAdapter daCustomer = new customerTableAdapter();
            try
            {
                daCustomer.Fill(dsEmmaStore.customer);
            }
            catch { }
        }

        //Order Gridview select Event
        protected void GvOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.GvInvenOrder.PageIndex = this.GvOrder.SelectedIndex;
            GvInvenOrder.Visible = true;
            custForm.Visible = true;
            DvEmployee.Visible = true;
            lblEmp.Visible = true;
            lblStatus.Visible = true;
            lblOrderInsert.Visible = true;
            lblOrderPrice.Visible = true;
            DvReceiptInsert.Visible = true;
            DropDownList ddlist1 = (DropDownList)GvOrder.SelectedRow.Cells[6].FindControl("DropDownList3");
            Session["GridEmp"] = ddlist1.SelectedValue;
            Session["GridOrder"] = Convert.ToInt32(GvOrder.SelectedRow.Cells[0].Text);

            //Get related customer
            DropDownList ddlist2 = (DropDownList)GvOrder.SelectedRow.Cells[5].FindControl("DropDownList2");
            int custID = Convert.ToInt32(ddlist2.SelectedValue);
            DataRow custRow = dsEmmaStore.customer.FindByid(custID);
            txtCustomer.Text = custRow.ItemArray[1].ToString() + " " + custRow.ItemArray[2].ToString();
            txtCustID.Text = custRow.ItemArray[0].ToString();
        }

        //Confirm delete and handle order delete validations
        protected void DvReceiptInsert_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                lblStatus.Text = "Unable to delete this record";
            }
            else
            {
                lblStatus.Text = "Successfully deleted this order";
            }
        }

        protected void GvInvenOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void DvReceiptInsert_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {
            custForm.Visible = true;
            lblStatus.Visible = true;
        }

        protected void btnToSelectedCust_Click(object sender, EventArgs e)
        {
            Session["SelectedCust"] = (string)txtCustID.Text;

            if(Session["SelectedCust"] != null)
            {
                Response.Redirect("~/Customer.aspx");
            }
        }

        protected void DvEmployee_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {
            DvEmployee.Visible = true;
        }
    }
}