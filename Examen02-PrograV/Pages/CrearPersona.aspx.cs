using Examen02_PrograV.Data;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace Examen02_PrograV.Pages
{
    public partial class CrearPersona : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                LoadDataProvincias();
                LoadValidationFechaNacimiento();
            }

        }


        protected void btnCreate_Click(object sender, EventArgs e)
        {
            lblMsgError.Visible = false;
            int idProvincia = int.Parse(ddlProvincia.SelectedValue);
            string nombreCompleto = txtNombreCompleto.Text;
            string telefono = txtTelefono.Text;
            DateTime fechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);
            string salarioStr = txtSalario.Text ;
            decimal salario;
            CultureInfo currentCulture = CultureInfo.CurrentCulture;
            CultureInfo.CurrentCulture = CultureInfo.InvariantCulture;
            decimal.TryParse(txtSalario.Text, out  salario);

            if (salario < 1 || salario > 99999999.99m)
            {

                lblMsgError.Visible = true;
                lblMsgError.Text = "Salario no es válido";
                return;
            }

           SaveDatePersona(idProvincia,nombreCompleto,telefono,fechaNacimiento,salario);
            Response.Redirect("/Pages/Mensaje?a=C");
        }

        /*
            3.4.4.
            [2pts] La “fecha nacimiento” de la persona es requerida. Solo se deben de aceptar fechas cuyo año 
            sea menor o igual al año 2003. Este dato debe de tener una longitud máxima de 10 caracteres. 
         */
        private void LoadValidationFechaNacimiento()
        { 
            DateTime fechaCreacionValue = DateTime.ParseExact("31/12/2003", "d/M/yyyy", CultureInfo.InvariantCulture);
            string maxDate = fechaCreacionValue.ToString("yyyy-MM-dd");
            txtFechaNacimiento.Attributes.Add("max", maxDate);
        }


        private void LoadDataProvincias()
        {
            ddlProvincia.Items.Clear();
            using (var context = new DbExamen02())
            {
                List<spConsultarTodasLasProvincias_Result> listProvincias = context.spConsultarTodasLasProvincias().ToList();

                listProvincias.ForEach((item) =>
                {
                    ddlProvincia.Items.Add(new ListItem(item.nombre, item.idProvincia.ToString()));
                });
            }

        }


        private void SaveDatePersona(
            int _provincia,
            string _nombreCompleto,
            string _telefono,
            DateTime _fechaNacimiento,
            decimal _salario
            )
        {
            using (var context = new DbExamen02())
            {
                context.spCrearPersona(_provincia, _nombreCompleto, _telefono,_fechaNacimiento,_salario);
            }

        }
      
    }
}