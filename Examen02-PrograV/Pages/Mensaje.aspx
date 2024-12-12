<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Mensaje.aspx.cs" Inherits="Examen02_PrograV.Pages.Mensaje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h1>Proceso Finalizado</h1>
    <div>
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        
    </div>
    <asp:Button class="cancel" ID="btnReturn" runat="server"  Text="Regresar" OnClick="btnReturn_Click" />
</asp:Content>
