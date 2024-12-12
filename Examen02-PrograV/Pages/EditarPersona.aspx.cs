using Examen02_PrograV.Data;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen02_PrograV.Pages
{
    public partial class EditarPersona : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string idPersonaQS = Request.QueryString["id"];
            if (idPersonaQS == null)
            {
                btnDelete.Visible = false;
                btnSave.Visible = false;
                filedsSection.Visible = false;
                lblMsgError.Visible = true;
                lblMsgError.Text = "No se encontraron datos!";
                return;
            };

            int idPersona = Int16.Parse(idPersonaQS);

            if (!IsPostBack)
            {
                LoadDataPersona(idPersona);
                LoadDataProvincias();
                LoadValidationFechaNacimiento();
            }
        }


        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string idPersonaQS = Request.QueryString["id"];
            if (idPersonaQS == null)
            {
                btnDelete.Visible = false;
                btnSave.Visible = false;
                filedsSection.Visible = false;
                lblMsgError.Visible = true;
                lblMsgError.Text = "No se encontraron datos!";
                return;
            };

            int idPersona = Int16.Parse(idPersonaQS);

            DeleteDataPersona(idPersona);
            Response.Redirect("/Pages/Mensaje?a=U");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string idPersonaQS = Request.QueryString["id"];
            if (idPersonaQS == null)
            {
                btnDelete.Visible = false;
                btnSave.Visible = false;
                filedsSection.Visible = false;
                lblMsgError.Visible = true;
                lblMsgError.Text = "No se encontraron datos!";
                return;
            };

            int idPersona = Int16.Parse(idPersonaQS);

            lblMsgError.Visible = false;
            int idProvincia = int.Parse(ddlProvincia.SelectedValue);
            string nombreCompleto = txtNombreCompleto.Text;
            string telefono = txtTelefono.Text;
            DateTime fechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);
            string salarioStr = txtSalario.Text;
            CultureInfo currentCulture = CultureInfo.CurrentCulture;
            CultureInfo.CurrentCulture = CultureInfo.InvariantCulture;
            decimal salario;
            decimal.TryParse(txtSalario.Text, out salario);

            if (salario < 1 || salario > 99999999.99m)
            {

                lblMsgError.Visible = true;
                lblMsgError.Text = "Salario no es válido";
                return;
            }

            SaveDatePersona(idPersona, idProvincia, nombreCompleto, telefono, fechaNacimiento, salario);
            Response.Redirect("/Pages/Mensaje?a=U");
        }

        
        private void DeleteDataPersona(int _idPersona)
        {
            using (var context = new DbExamen02())
            {
                context.spEliminarPersona(_idPersona);
            }
        }

        private void LoadValidationFechaNacimiento()
        {
            DateTime fechaCreacionValue = DateTime.ParseExact("31/12/2003", "d/M/yyyy", CultureInfo.InvariantCulture);
            string maxDate = fechaCreacionValue.ToString("yyyy-MM-dd");
            txtFechaNacimiento.Attributes.Add("max", maxDate);
        }



        private void SaveDatePersona(
            int _idPersona,
            int _provincia,
            string _nombreCompleto,
            string _telefono,
            DateTime _fechaNacimiento,
            decimal _salario
            )
        {
            using (var context = new DbExamen02())
            {
                context.spEditarPersona(_idPersona, _provincia, _nombreCompleto, _telefono, _fechaNacimiento, _salario);
            }

        }

        private void LoadDataPersona (int _idPersona)
        {
            using (var context = new DbExamen02())
            {
                spConsultarPersonaPorId_Result dataPersona = context.spConsultarPersonaPorId(_idPersona).FirstOrDefault();

                ddlProvincia.SelectedValue = dataPersona.idProvincia.ToString();
                txtNombreCompleto.Text = dataPersona.nombreCompleto;
                txtTelefono.Text = dataPersona.telefono;
                txtFechaNacimiento.Text = dataPersona.fechaNacimiento.ToString();
                txtSalario.Text = dataPersona.salario.ToString().Replace(",", ".");

                try
                {
                    DateTime fechaCreacionValue = DateTime.ParseExact(dataPersona.fechaNacimiento.ToString(), "d/M/yyyy HH:mm:ss", CultureInfo.InvariantCulture);
                    txtFechaNacimiento.Text = fechaCreacionValue.ToString("yyyy-MM-dd");
                }
                catch { }

            }
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

       
    }
}