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

namespace FinalProject1210_WebForm
{
    public partial class Customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Login.aspx");
            }

            txtFirstFilter.Enabled = true;
            txtLastFilter.Enabled = true;
            ddlCityFilter.Enabled = true;
            txtcustID.Visible = false;

            //Hiding specific forms on page load
            this.btnUpdateCust.Attributes.Add("style", "display: none");
            this.btnEditCust.Attributes.Add("style", "display: inline");
            this.btnInsert.Attributes.Add("style", "display: inline");
            this.btnDelete.Attributes.Add("style", "display: none");
            this.btnRemove.Attributes.Add("style", "display: inline");
            this.CancelUpdate.Attributes.Add("style", "display: none");
            this.CancelDelete.Attributes.Add("style", "display: none");

            UpdateForm.Visible = false;

            this.txtFirst.Attributes.Add("enabled", "true");
            this.txtLast.Attributes.Add("enabled", "true");
            this.txtPhone.Attributes.Add("enabled", "true");
            this.txtAddress.Attributes.Add("enabled", "true");
            this.txtCity.Attributes.Add("enabled", "true");
            this.txtPostal.Attributes.Add("enabled", "true");
            this.txtEmail.Attributes.Add("enabled", "true");

            this.btnDirectOrder.Attributes.Add("style", "display: none");
            this.gvEmp.Attributes.Add("style", "display: none");

            //Retrieve selected customer from order page

            if (Session["SelectedCust"] == null || Session["SelectedCust"].ToString() == "")
            {
                lblcustID.Text = "";
                txtcustID.Text = "";
                txtcustID.Visible = false;
                txtFirstFilter.Enabled = true;
                txtLastFilter.Enabled = true;
                ddlCityFilter.Enabled = true;
            }
            else
            {
                lblcustID.Text = "Selected Customer: ";
                txtcustID.Text = Session["SelectedCust"].ToString();
                txtcustID.Visible = true;
                txtFirstFilter.Enabled = false;
                txtLastFilter.Enabled = false;
                ddlCityFilter.Enabled = false;
            }

            //Display customer gridview
            FindCustomer();
        }

        //protected override void Render(HtmlTextWriter writer)
        //{
        //    //Register controls for event validation
        //    foreach (Control c in this.Controls)
        //    {
        //        this.Page.ClientScript.RegisterForEventValidation(
        //                c.UniqueID.ToString()
        //        );
        //    }
        //    base.Render(writer);
        //    Page.ClientScript.RegisterForEventValidation(this.UniqueID);
        //}

        // Declare a reference to the dataset
        private static EmmasDataSet dsEmmaStore;

        static Customer()
        {
            // Initialize the dataset
            dsEmmaStore = new EmmasDataSet();

            // Initialize the table adapters
            customerTableAdapter daCustomer = new customerTableAdapter();
            CustModifiedTableAdapter daCustModified = new CustModifiedTableAdapter();
            CustomerOrderTableAdapter daCustOrder = new CustomerOrderTableAdapter();
            //employeeTableAdapter daEmployee = new employeeTableAdapter();
            try
            {
                daCustomer.Fill(dsEmmaStore.customer);
                daCustModified.Fill(dsEmmaStore.CustModified);
                daCustOrder.Fill(dsEmmaStore.CustomerOrder);
                //daEmployee.Fill(dsEmmaStore.employee);
            }
            catch { }
        }

        //Get Customers filters
        protected string GetCustCriteria()
        {
            string criteria = "";

            //Grab filter options
            // Gets order by City
            criteria = (this.ddlCityFilter.SelectedValue != "" && this.ddlCityFilter.SelectedValue != "All") ? "custCity = '" + this.ddlCityFilter.SelectedValue + "'" : "";

            // Filter by ID
            criteria += (Session["SelectedCust"] != null && criteria.Length > 0) ? " AND id = '" + Session["SelectedCust"].ToString() + "'"
                : (Session["SelectedCust"] != null) ? " id = '" + Session["SelectedCust"].ToString() + "'" : "";

            // Filter by first name
            criteria += (this.txtFirstFilter.Text.Length > 0 && criteria.Length > 0) ? " AND custFirst LIKE '" + this.txtFirstFilter.Text + "'"
                : (this.txtFirstFilter.Text.Length > 0) ? " custFirst LIKE '%" + this.txtFirstFilter.Text + "%'" : "";

            // Filter by last name
            criteria += (this.txtLastFilter.Text.Length > 0 && criteria.Length > 0) ? " AND custLast LIKE '" + this.txtLastFilter.Text + "'"
                : (this.txtLastFilter.Text.Length > 0) ? " custLast LIKE '%" + this.txtLastFilter.Text + "%'" : "";
            return criteria;
        }

        //Get Orders filters
        protected string GetOrderCriteria()
        {
            int id = Convert.ToInt32(Session["custID"]);
            string criteria = "";

            //Grab filter options
            // Gets order by Customer ID
            criteria = "custID = " + id + "";
            return criteria;
        }

        //Get Customer
        protected void FindCustomer()
        {
            string criteria = GetCustCriteria();

            DataRow[] rows = (criteria.Length > 0) ? dsEmmaStore.CustModified.Select(criteria) : dsEmmaStore.CustModified.Select();
            //Bind data to gridview
            GvCust.DataSource = null;
            GvCust.DataSource = rows;
            GvCust.DataBind();
        }

        //Get Order
        protected void FindOrder()
        {
            string criteria = GetOrderCriteria();
            this.btnDirectOrder.Attributes.Add("style", "display: none");
            this.gvEmp.Attributes.Add("style", "display: none");         

            DataRow[] rows = dsEmmaStore.CustomerOrder.Select(criteria);
            //Bind data to gridview
            GvCustOrder.DataSource = null;
            GvCustOrder.DataSource = rows;
            GvCustOrder.DataBind();
            if (rows.Length > 0)
            {
                this.btnDirectOrder.Attributes.Add("style", "display: inline");
                this.gvEmp.Attributes.Add("style", "display: none");
            }
        }

        //Customer gridview select event
        protected void btnCustSelect_Click(object sender, EventArgs e)
        {
            this.txtFirst.Enabled = true;
            this.txtLast.Enabled = true;
            this.txtCity.Enabled = true;
            this.txtAddress.Enabled = true;
            this.txtPhone.Enabled = true;
            this.txtPostal.Enabled = true;
            this.txtEmail.Enabled = true;

            int id = Convert.ToInt32((sender as Button).CommandArgument);
            Session["custID"] = (int)id;
            //Declare a ghost customer table
            DataRow customer = dsEmmaStore.customer.FindByid(id);
            if (customer != null)
            {
                this.txtFirst.Text = customer.ItemArray[1].ToString();
                this.txtLast.Text = customer.ItemArray[2].ToString();
                this.txtPhone.Text = customer.ItemArray[3].ToString();
                this.txtAddress.Text = customer.ItemArray[4].ToString();
                this.txtCity.Text = customer.ItemArray[5].ToString();
                this.txtPostal.Text = customer.ItemArray[6].ToString();
                this.txtEmail.Text = customer.ItemArray[7].ToString();
            }
            FindOrder();
            UpdateForm.Visible = true;
            Label7.Text = "Modify Customer";
            custResult.Text = "Ready to be modified";
        }

        //Clear all customer filters
        protected void Clear_Filter()
        {
            txtFirstFilter.Enabled = true;
            txtLastFilter.Enabled = true;
            ddlCityFilter.Enabled = true;

            this.txtFirstFilter.Text = "";
            this.txtLastFilter.Text = "";
            this.ddlCityFilter.SelectedIndex = -1;
        }

        //Clear update form
        protected void Clear_Update()
        {
            this.txtFirst.Text = "";
            this.txtLast.Text = "";
            this.txtPhone.Text = "";
            this.txtAddress.Text = "";
            this.txtCity.Text = "";
            this.txtPostal.Text = "";
            this.txtEmail.Text = "";
        }

        //Customer edit event
        protected void btnEditCust_Click(object sender, EventArgs e)
        {
            this.btnUpdateCust.Attributes.Add("style", "display: inline");
            this.btnEditCust.Attributes.Add("style", "display: none");
            this.btnInsert.Attributes.Add("style", "display: none");
            this.btnDelete.Attributes.Add("style", "display: none");
            this.btnRemove.Attributes.Add("style", "display: inline");
            this.CancelUpdate.Attributes.Add("style", "display: inline");
            this.CancelDelete.Attributes.Add("style", "display: none");

            UpdateForm.Visible = true;
            this.txtFirst.Enabled = true;
            this.txtLast.Enabled = true;
            this.txtCity.Enabled = true;
            this.txtAddress.Enabled = true;
            this.txtPhone.Enabled = true;
            this.txtPostal.Enabled = true;
            this.txtEmail.Enabled = true;

            Label7.Text = "Modify Customer";
            custResult.Text = "Ready to be modified";
        }

        //Customer update event
        protected void btnUpdateCust_Click(object sender, EventArgs e)
        {
            this.UpdateForm.Visible = true;
            this.btnUpdateCust.Attributes.Add("style", "display: none");
            this.btnEditCust.Attributes.Add("style", "display: inline");
            this.btnInsert.Attributes.Add("style", "display: inline");
            this.btnDelete.Attributes.Add("style", "display: none");
            this.btnRemove.Attributes.Add("style", "display: inline");
            this.CancelUpdate.Attributes.Add("style", "display: none");
            this.CancelDelete.Attributes.Add("style", "display: none");

            this.txtFirst.Enabled = true;
            this.txtLast.Enabled = true;
            this.txtCity.Enabled = true;
            this.txtAddress.Enabled = true;
            this.txtPhone.Enabled = true;
            this.txtPostal.Enabled = true;
            this.txtEmail.Enabled = true;

            int id = Convert.ToInt32(Session["custID"]);
            //Declare a ghost customer table
            DataRow customer = dsEmmaStore.customer.FindByid(id);

            if (customer != null)
            {
                customer[1] = this.txtFirst.Text;
                customer[2] = this.txtLast.Text;
                customer[3] = this.txtPhone.Text;
                customer[4] = this.txtAddress.Text;
                customer[5] = this.txtCity.Text;
                customer[6] = this.txtPostal.Text;
                customer[7] = this.txtEmail.Text;
            }

            try
            {
                if (txtFirst.Text != "" && txtLast.Text != "" && txtPhone.Text != "" && txtAddress.Text != ""
                    && txtCity.Text != "" && txtPostal.Text != "" && txtEmail.Text != "")
                {
                    customerTableAdapter dacustomer = new customerTableAdapter();
                    dacustomer.Update(customer);
                    dsEmmaStore.AcceptChanges();
                    custResult.Text = "Updated Successfully";
                    Clear_Filter();
                    Clear_Update();
                    FindCustomer();
                }
                else
                {
                    custResult.Text = "Update Failed, please select a customer";
                }
            }
            catch
            {
                custResult.Text = "Update Failed";
                Clear_Update();
            }
        }

        //Customer insert event
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            UpdateForm.Visible = true;
            string status = "";
            if (txtFirst.Text != "" && txtLast.Text != "" && txtPhone.Text != "" && txtAddress.Text != ""
                    && txtCity.Text != "" && txtPostal.Text != "" && txtEmail.Text != "")
            {
                DataRow[] custs = dsEmmaStore.customer.Select();
                foreach (DataRow cust in custs)
                {
                    if (txtFirst.Text + " " + txtLast.Text != cust.ItemArray[1].ToString() + " " +
                        cust.ItemArray[2].ToString() && txtPostal.Text != cust.ItemArray[6].ToString())
                    {
                        status = "noice";
                    }
                    else
                    {
                        status = "";
                        break;
                    }
                }
                if (status == "")
                {
                    custResult.Text = "Failed, this customer is already in the database";
                }
                else if (status == "noice")
                {
                    DataRow cst = dsEmmaStore.customer.NewRow();
                    cst[1] = txtFirst.Text;
                    cst[2] = txtLast.Text;
                    cst[3] = txtPhone.Text;
                    cst[4] = txtAddress.Text;
                    cst[5] = txtCity.Text;
                    cst[6] = txtPostal.Text;
                    cst[7] = txtEmail.Text;
                    customerTableAdapter dacustomers = new customerTableAdapter();
                    dacustomers.Insert(txtFirst.Text, txtLast.Text, txtPhone.Text
                        , txtAddress.Text, txtCity.Text, txtPostal.Text, txtEmail.Text);
                    dsEmmaStore.AcceptChanges();
                    custResult.Text = "Inserted successfully";
                    Clear_Filter();
                    FindCustomer();
                }
            }
            else
            {
                custResult.Text = "Insert failed, please fill all information";
            }
        }

        //Customer delete event
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            this.CancelUpdate.Attributes.Add("style", "display: none");
            this.CancelDelete.Attributes.Add("style", "display: none");

            UpdateForm.Visible = true;
            int id = Convert.ToInt32(Session["custID"]);
            DataRow cust = dsEmmaStore.customer.FindByid(id);
            try
            {
                if (cust != null)
                {
                    custResult.Text = "Deleted " + cust.ItemArray[1].ToString() + " " + cust.ItemArray[2].ToString() + " from the database";
                    customerTableAdapter dacustomers = new customerTableAdapter();
                    dacustomers.Delete(id);
                    Clear_Filter();
                    dsEmmaStore.AcceptChanges();

                    this.txtFirst.Enabled = true;
                    this.txtLast.Enabled = true;
                    this.txtCity.Enabled = true;
                    this.txtAddress.Enabled = true;
                    this.txtPhone.Enabled = true;
                    this.txtPostal.Enabled = true;
                    this.txtEmail.Enabled = true;
                    FindCustomer();
                }
                else
                {
                    custResult.Text = "Customer is not exsisted";
                }
            }
            catch(Exception)
            {
                custResult.Text = "Cannot delete this customer";
                this.txtFirst.Enabled = true;
                this.txtLast.Enabled = true;
                this.txtCity.Enabled = true;
                this.txtAddress.Enabled = true;
                this.txtPhone.Enabled = true;
                this.txtPostal.Enabled = true;
                this.txtEmail.Enabled = true;
                Label7.Text = "Modify Customer";
            }
        }

        //Search customer options
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            FindCustomer();
        }

        //Clear customer filters
        protected void btnClearSearch_Click(object sender, EventArgs e)
        {
            txtFirstFilter.Enabled = true;
            txtLastFilter.Enabled = true;
            ddlCityFilter.Enabled = true;

            txtFirstFilter.Text = "";
            txtLastFilter.Text = "";
            ddlCityFilter.SelectedIndex = -1;

            Session["SelectedCust"] = null;
            lblcustID.Text = "";
            txtcustID.Text = "";
            txtcustID.Visible = false;

            FindCustomer();
        }

        //Order gridview select event
        protected void btnOrderSelect_Click(object sender, EventArgs e)
        {
            UpdateForm.Visible = true;
            this.btnDirectOrder.Attributes.Add("style", "display: inline");
            this.gvEmp.Attributes.Add("style", "display: inline");

            int empid = Convert.ToInt32((sender as Button).CommandArgument);
            Session["empID"] = (int)empid;
            //Declare a ghost customer table
            //FindEmployee();
        }

        //Switch to delete mode for customer
        protected void btnRemove_Click(object sender, EventArgs e)
        {
            UpdateForm.Visible = true;
            Label7.Text = "Delete Customer";
            custResult.Text = "Ready to be deleted";
            this.txtFirst.Enabled = false;
            this.txtLast.Enabled = false;
            this.txtCity.Enabled = false;
            this.txtAddress.Enabled = false;
            this.txtPhone.Enabled = false;
            this.txtPostal.Enabled = false;
            this.txtEmail.Enabled = false;

            this.btnUpdateCust.Attributes.Add("style", "display: none");
            this.btnEditCust.Attributes.Add("style", "display: inline");
            this.btnInsert.Attributes.Add("style", "display: none");
            this.btnRemove.Attributes.Add("style", "display: none");
            this.btnDelete.Attributes.Add("style", "display: inline");
            this.CancelUpdate.Attributes.Add("style", "display: none");
            this.CancelDelete.Attributes.Add("style", "display: inline");
        }

        //Go to Order page with no filter options
        protected void btnDirectOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Orders.aspx");
        }

        //Go to Order page with selected filter options
        protected void btnSelectedOrder_Click(object sender, EventArgs e)
        {

        }

        protected void CancelUpdate_Click(object sender, EventArgs e)
        {
            this.UpdateForm.Visible = true;
            this.btnUpdateCust.Attributes.Add("style", "display: none");
            this.btnEditCust.Attributes.Add("style", "display: inline");
            this.btnInsert.Attributes.Add("style", "display: inline");
            this.btnDelete.Attributes.Add("style", "display: none");
            this.btnRemove.Attributes.Add("style", "display: inline");
            this.CancelUpdate.Attributes.Add("style", "display: none");

            this.txtFirst.Enabled = true;
            this.txtLast.Enabled = true;
            this.txtCity.Enabled = true;
            this.txtAddress.Enabled = true;
            this.txtPhone.Enabled = true;
            this.txtPostal.Enabled = true;
            this.txtEmail.Enabled = true;
        }

        protected void CancelDelete_Click(object sender, EventArgs e)
        {
            this.UpdateForm.Visible = true;
            this.btnUpdateCust.Attributes.Add("style", "display: none");
            this.btnEditCust.Attributes.Add("style", "display: inline");
            this.btnInsert.Attributes.Add("style", "display: inline");
            this.btnDelete.Attributes.Add("style", "display: none");
            this.btnRemove.Attributes.Add("style", "display: inline");
            this.CancelDelete.Attributes.Add("style", "display: none");

            this.txtFirst.Enabled = true;
            this.txtLast.Enabled = true;
            this.txtCity.Enabled = true;
            this.txtAddress.Enabled = true;
            this.txtPhone.Enabled = true;
            this.txtPostal.Enabled = true;
            this.txtEmail.Enabled = true;
            Label7.Text = "Modify Customer";
        }
    }
}