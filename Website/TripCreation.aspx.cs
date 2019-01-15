using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TripCreation : System.Web.UI.Page
{
    string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
    string teacherInCharge = "";
    string teacherInChargeNo = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        teacherInCharge = Session["ssFullName"].ToString();
        teacherInChargeNo = Session["ssUsername"].ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
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
                            string startDateR = startDay + "/" + startMth + "/" + startYear;
                            DateTime startDate = Convert.ToDateTime(startDateR);
                            string endDay = ddlEndday.SelectedValue;
                            string endMth = ddlEndmth.SelectedValue;
                            string endYear = ddlEndyear.SelectedValue;
                            string endDateR = endDay + "/" + endMth + "/" + endYear;
                            DateTime endDate = Convert.ToDateTime(endDateR);
                            string planeFee = tbPlanefee.Text;
                            string insuFee = tbInsufee.Text;
                            string accoFee = tbAccofee.Text;
                            string tripDetails = tbDetails.Text;
                            if (2 + 2 == 4)
                            {
                                StringBuilder sqlStr = new StringBuilder();
                                // Execute NonQuery return an integer value
                                SqlCommand sqlCmd = new SqlCommand();
                                // Step1 : Create SQL insert command to add record to TDMaster using     

                                //         parameterised query in values clause
                                //
                                sqlStr.AppendLine("INSERT INTO TripInformation (TripName,TripType,TripCountry,TripLocation, ");
                                sqlStr.AppendLine("DiplmaDIT,DiplmaDBI,DiplmaDCS,DiplmaDSF,DiplmaDFI,DiplmaDBA,");
                                sqlStr.AppendLine("YearOne,YearTwo,YearThree,TripMinGPA,TripSlots,TripSlotsOri,TripStartDate,");
                                sqlStr.AppendLine("TripEndDate,TripTeacherInCharge,TripTeacherInChargeNo,TripPlaneFee,TripInsuFee,TripAccoFee,TripDetails)");
                                sqlStr.AppendLine("VALUES (@paraTripName,@paraTripType,@paraTripCountry,@paraTripLocation,@paraDiplmaDIT,");
                                sqlStr.AppendLine("@paraDiplmaDBI,@paraDiplmaDCS,@paraDiplmaDSF,@paraDiplmaDFI,@paraDiplmaDBA,");
                                sqlStr.AppendLine("@paraYearOne,@paraYearTwo,@paraYearThree,@paraTripMinGPA,@paraTripSlots,@paraTripSlotsOri,@paraTripStartDate,");
                                sqlStr.AppendLine("@paraTripEndDate,@paraTripTeacherInCharge,@paraTripTeacherInChargeNo,@paraTripPlaneFee,@paraTripInsuFee,@paraTripAccoFee,@paraTripDetails)");


                                // Step 2 :Instantiate SqlConnection instance and SqlCommand instance

                                SqlConnection myConn = new SqlConnection(DBConnect);

                                sqlCmd = new SqlCommand(sqlStr.ToString(), myConn);

                                // Step 3 : Add each parameterised query variable with value
                                //          complete to add all parameterised queries
                                sqlCmd.Parameters.AddWithValue("@paraTripName", tripName);
                                sqlCmd.Parameters.AddWithValue("@paraTripType", tripType);
                                sqlCmd.Parameters.AddWithValue("@paraTripCountry", tripCountry);
                                sqlCmd.Parameters.AddWithValue("@paraTripLocation", tripLocation);
                                sqlCmd.Parameters.AddWithValue("@paraDiplmaDIT", DipDIT);
                                sqlCmd.Parameters.AddWithValue("@paraDiplmaDBI", DipDBI);
                                sqlCmd.Parameters.AddWithValue("@paraDiplmaDCS", DipDCS);
                                sqlCmd.Parameters.AddWithValue("@paraDiplmaDSF", DipDSF);
                                sqlCmd.Parameters.AddWithValue("@paraDiplmaDFI", DipDFI);
                                sqlCmd.Parameters.AddWithValue("@paraDiplmaDBA", DipDBA);
                                sqlCmd.Parameters.AddWithValue("@paraYearOne", year1);
                                sqlCmd.Parameters.AddWithValue("@paraYearTwo", year2);
                                sqlCmd.Parameters.AddWithValue("@paraYearThree", year3);
                                sqlCmd.Parameters.AddWithValue("@paraTripMinGPA", minGPA);
                                sqlCmd.Parameters.AddWithValue("@paraTripSlots", slots);
                                sqlCmd.Parameters.AddWithValue("@paraTripSlotsOri", slots);
                                sqlCmd.Parameters.AddWithValue("@paraTripStartDate", startDate);
                                sqlCmd.Parameters.AddWithValue("@paraTripEndDate", endDate);
                                sqlCmd.Parameters.AddWithValue("@paraTripTeacherInCharge", teacherInCharge);
                                sqlCmd.Parameters.AddWithValue("@paraTripTeacherInChargeNo", teacherInChargeNo);
                                sqlCmd.Parameters.AddWithValue("@paraTripPlaneFee", planeFee);
                                sqlCmd.Parameters.AddWithValue("@paraTripInsuFee", insuFee);
                                sqlCmd.Parameters.AddWithValue("@paraTripAccoFee", accoFee);
                                sqlCmd.Parameters.AddWithValue("@paraTripDetails", tripDetails);

                                // Step 4 Open connection the execute NonQuery of sql command   

                                myConn.Open();
                                sqlCmd.ExecuteNonQuery();

                                // Step 5 :Close connection
                                myConn.Close();
                            }
                            if (2 + 2 == 4)
                            {
                                StringBuilder sqlStr = new StringBuilder();
                                // Execute NonQuery return an integer value
                                SqlCommand sqlCmd = new SqlCommand();
                                // Step1 : Create SQL insert command to add record to TDMaster using     

                                //         parameterised query in values clause
                                //
                                sqlStr.AppendLine("INSERT INTO TripStudents (TripName, TripSlots) ");
                                sqlStr.AppendLine("VALUES (@paraTripName, @paraTripSlots)");
                                // Step 2 :Instantiate SqlConnection instance and SqlCommand instance

                                SqlConnection myConn = new SqlConnection(DBConnect);

                                sqlCmd = new SqlCommand(sqlStr.ToString(), myConn);

                                // Step 3 : Add each parameterised query variable with value
                                //          complete to add all parameterised queries
                                sqlCmd.Parameters.AddWithValue("@paraTripName", tripName);
                                sqlCmd.Parameters.AddWithValue("@paraTripSlots", slots);

                                // Step 4 Open connection the execute NonQuery of sql command   

                                myConn.Open();
                                sqlCmd.ExecuteNonQuery();

                                // Step 5 :Close connection
                                myConn.Close();
                            }

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