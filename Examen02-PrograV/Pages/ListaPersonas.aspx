<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaPersonas.aspx.cs" Inherits="Examen02_PrograV.Pages.ListaPersonas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <main>
        <section>
            <header>
                <h3>Lista de personas</h3>
                    <a class="nav-link" runat="server" href="~/Pages/CrearPersona">
                        <button type="button">
                             Crear persona
                        </button>
                    </a>
                
            </header>
            <asp:GridView 
                ID="gv_Personas" 
                runat="server"
                AutoGenerateColumns="false"
                OnRowDataBound="gv_Personas_RowDataBound"
                CssClass="table table-bordered table-hover text-left"

                >
                <Columns>
                    <%-- 
                        2.2.1
                        [1pts] Debe de mostrar el id de la persona como primera columna (de izquierda a derecha) y el 
                        encabezado de dicha columna debe de mostrar el texto “ID”. Este dato lo provee el procedimiento 
                        almacenado que le entrega los datos de la base de datos. La alineación de los textos de todas las filas 
                        de esta columna debe de ser al centro. 
                        --%>
                    <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="idPersona" HeaderText="ID"/>

                    <%-- 
                        2.2.2
                        [1pts] Debe de mostrar el nombre de la provincia como segunda columna (de izquierda a derecha) y 
                        el encabezado de dicha columna debe de mostrar el texto “Provincia”. Este dato lo provee el 
                        procedimiento almacenado que le entrega los datos de la base de datos. La alineación de los textos 
                        de todas las filas de esta columna debe de ser a la izquierda. 
                    --%>
                    <asp:BoundField ItemStyle-HorizontalAlign="Left" DataField="nombreProvincia" HeaderText="Provincia"/>

                    <%--
                        2.2.3. 
                        [1pts] Debe de mostrar el nombre completo de la persona como tercera columna (de izquierda a 
                        derecha) y el encabezado de dicha columna debe de mostrar el texto “Nombre completo”. Este dato 
                        lo provee el procedimiento almacenado que le entrega los datos de la base de datos. La alineación 
                        de los textos de todas las filas de esta columna debe de ser a la izquierda. 
                        --%>
                    <asp:BoundField ItemStyle-HorizontalAlign="Left" DataField="nombreCompleto" HeaderText="Nombre completo"/>


                    <%-- 
                        2.2.4. 
                        [1pts] Debe de mostrar el número de teléfono como cuarta columna (de izquierda a derecha) y el 
                        encabezado de dicha columna debe de mostrar el texto “Teléfono”. Este dato lo provee el 
                        procedimiento almacenado que le entrega los datos de la base de datos. La alineación de los textos 
                        de todas las filas de esta columna debe de ser al centro.
                        
                       --%>
                    <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="telefono" HeaderText="Teléfono"/> 


                    <%-- 
                        2.2.5. 
                        [1pts] Debe de mostrar la fecha de nacimiento como quinta columna (de izquierda a derecha) y el 
                        encabezado de dicha columna debe de mostrar el texto “Fecha nacimiento”. Este dato lo provee el 
                        procedimiento almacenado que le entrega los datos de la base de datos. Además, este dato se debe 
                        de mostrar en formato: día/mes/año. La alineación de los textos de todas las filas de esta columna 
                        debe de ser al centro.
                        --%>
                    <asp:TemplateField HeaderText="Fecha nacimiento" ItemStyle-HorizontalAlign="Center">
                         <ItemTemplate>
                             <asp:Label ID="fechaNacimientoLbl" runat="server" Text=""></asp:Label>
                         </ItemTemplate>
                    </asp:TemplateField>


                    <%-- 
                        2.2.6. 
                        [1pts] Debe de mostrar el monto del salario de la persona como sexta columna (de izquierda a 
                        derecha) y el encabezado de dicha columna debe de mostrar el texto “Salario”. Este dato lo provee 
                        el procedimiento almacenado que le entrega los datos de la base de datos. Además, este dato se 
                        debe de mostrar en formato numérico, con separador de miles y 2 decimales. La alineación de los 
                        textos de todas las filas de esta columna debe de ser a la derecha. 
                        --%>
                    <asp:BoundField ItemStyle-HorizontalAlign="Right" DataField="salario" HeaderText="Salario" DataFormatString="{0:N2}"/>
                    


                    <%-- 
                        2.2.7
                        [3pts] Debe de mostrar la edad de la persona como séptima columna (de izquierda a derecha) y el 
                        encabezado de dicha columna debe de mostrar el texto “Edad”. La alineación de los textos de todas 
                        las filas de esta columna debe de ser al centro. Este dato no provee el procedimiento almacenado, 
                        pero lo puede obtener realizando la siguiente operación aritmética: 
                        Edad = (año actual) – (año de la fecha de nacimiento de la persona)
                        --%>

                    <asp:TemplateField HeaderText="Edad" ItemStyle-HorizontalAlign="Center">
                         <ItemTemplate>
                             <asp:Label ID="edadPersonaLbl" runat="server" Text=""></asp:Label>
                         </ItemTemplate>
                    </asp:TemplateField>

                    <%-- 
                        2.2.8. 
                        [3pts] Debe de mostrar la generación a la que pertenece la persona como octava columna (de 
                        izquierda a derecha) y el encabezado de dicha columna debe de mostrar el texto “Generación”. La 
                        alineación de los textos de todas las filas de esta columna debe de ser al centro. Este dato no provee 
                        el procedimiento almacenado, pero lo puede obtener al evaluar el año de la fecha de nacimiento de 
                        la persona, y según al rango que pertenece dicho año, así deberá de mostrar el nombre de la 
                        generación a la que pertenece la persona. Los rangos de los años generacionales y los nombres de 
                        las generaciones los encuentra en siguiente tabla:
                        
                        --%>
                    <asp:TemplateField HeaderText="Generación" ItemStyle-HorizontalAlign="Center">
                         <ItemTemplate>
                             <asp:Label ID="generacionPersonaLbl" runat="server" Text=""></asp:Label>
                         </ItemTemplate>
                    </asp:TemplateField>

                    <%-- 
                        2.2.9.
                        [2pts] Debe de mostrar una opción con el texto “Editar” que le permita redireccionar al usuario a la 
                        página web “EditarPersona.aspx” en la novena columna (de izquierda a derecha). Además, debe de 
                        enviar a dicha página web por medio de querystrings el id de la persona que desea editar. 
                        --%>
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <a href="EditarPersona.aspx?id=<%# Eval("idPersona") %>">
                            Editar
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>

        </section>
    </main>
</asp:Content>
