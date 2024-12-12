using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen02_PrograV.Pages
{
    public partial class Mensaje : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string indAction = Request.QueryString["a"];

            switch (indAction.ToLower())
            {
                case "c":
                    {
                        lblMessage.Text = "Se ha completado correctamente el registro de un nuevo producto en la base de datos";
                        break;
                    };
                case "u":
                    {
                        lblMessage.Text = "Ha editado correctamente los datos de una persona en la base de datos";
                        break;
                    };
                case "d":
                    {
                        lblMessage.Text = "Ha borrado correctamente la información de la persona en la base de datos";
                        break;
                    };
                default:
                    {
                        lblMessage.Text = "No se ha completado ninguna acción";
                        break;
                    };
            }
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Pages/ListaPersonas");
        }
    }
}