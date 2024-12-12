using Examen02_PrograV.Data;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen02_PrograV.Pages
{
    public partial class ListaPersonas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                /* 2.2
                    [Subtotal 14pts] Esta página web debe tener un elemento GridView, y debe utilizarlo para presentar 
                    el resultado que devuelve el procedimiento almacenado llamado “dbo.spConsultarTodasLasPersonas”. 
                    Únicamente debe mostrar los siguientes campos: 
                 */
                LoadDataPersonas();
            }
        }

        private void LoadDataPersonas()
        {

            using (var context = new DbExamen02())
            {
                gv_Personas.DataSource = context.spConsultarTodasLasPersonas();
                gv_Personas.DataBind();
            }
        }


        protected void gv_Personas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) return;

            Label fechaNacimientoLbl = (Label)e.Row.FindControl("fechaNacimientoLbl");
            Label generacionPersonaLbl = (Label)e.Row.FindControl("generacionPersonaLbl");
            Label edadPersonaLbl = (Label)e.Row.FindControl("edadPersonaLbl"); 


            string fechaNacimientoBindValue = DataBinder.Eval(e.Row.DataItem, "fechaNacimiento").ToString();
            string salarioBindValue = DataBinder.Eval(e.Row.DataItem, "salario").ToString();


            int edadPersonaValue = 0;
            string salarioPersonaValue = "SALARIO PERSONA";
            string formatedFechaNacimientoValue = "";
            string generacionPersonaValue = "Generación Invalida";

            

            if (
                salarioBindValue != null)
            {
                salarioPersonaValue = "SALARIO NO DISPONIBLE";
            }
             else
            {
                salarioPersonaValue = string.Format(new CultureInfo("en-US"), "{0:C0}", Int32.Parse(salarioBindValue)).Replace(",", " ");

            }

            DateTime fechaNacimientoDateTimeValue = DateTime.ParseExact(fechaNacimientoBindValue, "d/M/yyyy HH:mm:ss", CultureInfo.InvariantCulture);
            try
            {
                formatedFechaNacimientoValue = fechaNacimientoDateTimeValue.ToString("dd/MM/yyyy");
            }
            catch { }

            try
            {
                DateTime nowDate = DateTime.Now;
                edadPersonaValue = nowDate.Year - fechaNacimientoDateTimeValue.Year;

            }
            catch { }

            int yearFechaNacimiento = fechaNacimientoDateTimeValue.Year;
            if (yearFechaNacimiento >=1930 && yearFechaNacimiento <= 1948)
            {
                generacionPersonaValue = "Generación silenciosa";
            } else if (yearFechaNacimiento >= 1949 && yearFechaNacimiento <= 1968)
            {
                generacionPersonaValue = "Generación Baby Boomers";
            } else if (yearFechaNacimiento >= 1969 && yearFechaNacimiento <= 1980)
            {
                generacionPersonaValue = "Generación X";
            } else if (yearFechaNacimiento >= 1981 && yearFechaNacimiento <= 1993)
            {
                generacionPersonaValue = "Generación Y";
            }
            else if (yearFechaNacimiento >= 1994 && yearFechaNacimiento <= 2010)
            {
                generacionPersonaValue = "Generación Z";
            }
            else
            {
                generacionPersonaValue = "N/D";
            }

            generacionPersonaLbl.Text = generacionPersonaValue;
            edadPersonaLbl.Text = edadPersonaValue.ToString();
            fechaNacimientoLbl.Text = formatedFechaNacimientoValue; 
        }
    }
}