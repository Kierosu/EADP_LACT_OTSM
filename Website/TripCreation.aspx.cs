using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TripCreation : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        validateStartDate();
        validateGPAmin();
        validateSlots();
        validatePlaneFee();
        validateInsuFee();
        validateAccoFee();
        
        

        if (lblGPAmin.Text == "")
        {
            if (lblSlots.Text == "")
            {
                if (lblPlaneErr.Text == "")
                {
                    if (lblInsuErr.Text == "")
                    {
                        if (lblAccoErr.Text == "")
                        {
                            string tripName = tbTripname.Text;
                            string tripType = ddlTripType.SelectedValue;
                            string tripCountry = ddlCountry.SelectedValue;
                            string tripLocation = tbLocation.Text;
                            string DipDIT = "";
                            string DipDBI = "";
                            string DipDCS = "";
                            string DipDSF = "";
                            string DipDFI = "";
                            string DipDBA = "";

                            foreach (ListItem diplomas in chkDiploma.Items)
                            {
                                if (diplomas.Selected == true)
                                {
                                    if(diplomas.Value == "DIT")
                                    {
                                        DipDIT = "DIT";
                                    }
                                    if (diplomas.Value == "DBI")
                                    {
                                        DipDBI = "DBI";
                                    }
                                    if (diplomas.Value == "DCS")
                                    {
                                        DipDCS = "DCS";
                                    }
                                    if (diplomas.Value == "DSF")
                                    {
                                        DipDSF = "DSF";
                                    }
                                    if (diplomas.Value == "DFI")
                                    {
                                        DipDFI = "DFI";
                                    }
                                    if (diplomas.Value == "DIT")
                                    {
                                        DipDBA = "DBA";
                                    }
                                }
                            }

                            string year1 = "";
                            string year2 = "";
                            string year3 = "";

                            foreach (ListItem years in chkYear.Items)
                            {
                                if (years.Selected == true)
                                {
                                    if (years.Value == "1")
                                    {
                                        year1 = "1";
                                    }
                                    if (years.Value == "2")
                                    {
                                        year2 = "2";
                                    }
                                    if (years.Value == "3")
                                    {
                                        year3 = "3";
                                    }
                                }
                            }

                            string minGPA = tbGPAmin.Text;
                            string slots = tbSlots.Text;
                            string startDay = ddlStartday.SelectedValue;
                            string startMth = ddlStartmth.SelectedValue;
                            string startYear = ddlStartyear.SelectedValue;
                            string startDate = startDay + "/" + startMth + "/" + startYear;



                    }
                }
            }
        }

        }
    }
    private bool validateStartDate()
    {
        lblDateErr.Text = String.Empty;
        string startDay = ddlStartday.SelectedValue;
        string startMth = ddlStartmth.SelectedValue;
        string startYear = ddlStartyear.SelectedValue;
        string startDate = startDay + "/" + startMth + "/" + startYear;
        if (1 + 1 == 2)
        {
            lblDateErr.Text += startDate;
        }
        if (String.IsNullOrEmpty(lblDateErr.Text))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    private bool validateGPAmin()
    {
        double dataValues2 = 0;
        lblGPAmin.Text = String.Empty;
        if (!double.TryParse(tbGPAmin.Text.ToString(), out dataValues2))
        {
            lblGPAmin.Text += "* Please enter numbers only ";
        }
        if (String.IsNullOrEmpty(lblGPAmin.Text))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    private bool validateSlots()
    {
        double dataValues2 = 0;
        lblSlots.Text = String.Empty;
        if (!double.TryParse(tbSlots.Text.ToString(), out dataValues2))
        {
            lblSlots.Text += "* Please enter numbers only ";
        }
        if (String.IsNullOrEmpty(lblSlots.Text))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    private bool validatePlaneFee()
    {
        double dataValues2 = 0;
        lblPlaneErr.Text = String.Empty;
        if (!double.TryParse(tbPlanefee.Text.ToString(), out dataValues2))
        {
            lblPlaneErr.Text += "* Please enter numbers only ";
        }
        if (String.IsNullOrEmpty(lblPlaneErr.Text))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    private bool validateInsuFee()
    {
        double dataValues2 = 0;
        lblInsuErr.Text = String.Empty;
        if (!double.TryParse(tbInsufee.Text.ToString(), out dataValues2))
        {
            lblInsuErr.Text += "* Please enter numbers only ";
        }
        if (String.IsNullOrEmpty(lblInsuErr.Text))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    private bool validateAccoFee()
    {
        double dataValues2 = 0;
        lblAccoErr.Text = String.Empty;
        if (!double.TryParse(tbAccofee.Text.ToString(), out dataValues2))
        {
            lblAccoErr.Text += "* Please enter numbers only ";
        }
        if (String.IsNullOrEmpty(lblAccoErr.Text))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

}