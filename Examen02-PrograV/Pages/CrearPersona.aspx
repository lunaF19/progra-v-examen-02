<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CrearPersona.aspx.cs" Inherits="Examen02_PrograV.Pages.CrearPersona" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <main>
        <section>
             <header>
                 <h3>Crear persona</h3>
             </header>
            <br />

            <asp:Label ID="lblMsgError" runat="server" ForeColor="Red" Text="" Visible="false"></asp:Label><br />
            <br />
            <%-- 
                3.4.1. 
                [1pts] La “provincia” es requerida.  
                --%>
            <asp:Label ID="lblProvincia" runat="server" Text="Provincia"></asp:Label><br />
            <asp:DropDownList ID="ddlProvincia" runat="server" required ></asp:DropDownList><br /><br />

            <%-- 
                3.4.2. 
                [1pts] El “nombre completo” de la persona es requerido, y debe de tener una longitud máxima de 
                150 caracteres.  
                --%>
            <asp:Label ID="lblNombreCompleto" runat="server" Text="Nombre Completo"></asp:Label><br />
            <asp:TextBox ID="txtNombreCompleto" runat="server" maxlength="150" required></asp:TextBox><br /><br />


            <%-- 
                3.4.3. 
                [1pts] El “teléfono” de la persona es requerido. Este dato debe de cumplir con el formato ####-####. 
                Dicho formato corresponde a 4 dígitos seguidos de un guion en el medio, y luego 4 dígitos más. La 
                longitud máxima de este dato es de 9 caracteres. 
                --%>
            <asp:Label ID="telefono" runat="server" Text="Teléfono"></asp:Label><br />
            <asp:TextBox ID="txtTelefono" runat="server" maxlength="9" pattern="[0-9]{4}-[0-9]{4}" required></asp:TextBox><br /><br />


            <%-- 
                3.4.4. 
                [2pts] La “fecha nacimiento” de la persona es requerida. Solo se deben de aceptar fechas cuyo año 
                sea menor o igual al año 2003. Este dato debe de tener una longitud máxima de 10 caracteres.
                --%>
            <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha nacimineto"></asp:Label><br />
            <asp:TextBox ID="txtFechaNacimiento" runat="server" type="date" required></asp:TextBox><br /><br />


            <%-- 
                3.4.5. 
                [1pts] El “salario” de la persona es requerido. Este valor debe de estar entre los rangos de 1 y 
                99.999.999,99. Debe de permitir que se digiten montos con 2 decimales.
                --%>
            <asp:Label ID="lblSalario" runat="server" Text="Salario"></asp:Label><br />
            <asp:TextBox ID="txtSalario" runat="server" type="text" required pattern="^\d{1,8}(\.\d{1,2})?$"></asp:TextBox><br /><br />
             

            <asp:Button ID="btnCreate" runat="server" Text="Guardar" OnClick="btnCreate_Click" />
            <a href="/Pages/ListaPersonas.aspx">
                <button type="button">Cancelar</button>
            </a>

        </section>
    </main>

</asp:Content>
