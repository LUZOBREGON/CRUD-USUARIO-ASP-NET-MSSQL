using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.EnterpriseServices;
using System.EnterpriseServices.CompensatingResourceManager;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using Prueba1.entidades;
using Prueba1.manejadorDatos;
using static Prueba1.entidades.enums;



namespace Prueba1
{
    public  partial class User : Page
    {

        public Manejador1 mn = new Manejador1();
        public String TempData = "";
   
        protected void Page_Load(object sender, EventArgs e)
        {
            
            CargaTabla();


        }
        protected void BtnRead_Click(object sender, EventArgs e)
        {
            Console.Write("ingreso al btn BtnRead_Click");
            Button BtnConsultar = (Button)sender;
            GridViewRow selectedrow = (GridViewRow)BtnConsultar.NamingContainer;
            hdnId.Value = selectedrow.Cells[1].Text;
            txtNombre.Text = selectedrow.Cells[2].Text;
            txtContrasenia.Text = "";
            txtCorreo.Text = selectedrow.Cells[4].Text;
            txtUsuario.Text = selectedrow.Cells[5].Text;
            dropUsuario.SelectedIndex = int.Parse(selectedrow.Cells[6].Text);
            btnGuardar.Text = "ACTUALIZAR";
            btnGuardar.Visible = true;
            btnGuardar.Enabled = true;
            tipoEvent.Value = "A";
            txtNombre.Focus();
        
        }
        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            if (hdnId.Value == "") { hdnId.Value = "0"; }
            var user = new Usuario
            {
                id_ = int.Parse(hdnId.Value),
                nombre_ = txtNombre.Text,
                usuario_ = txtUsuario.Text,
                contrasenia_ = txtContrasenia.Text,
                correo_ = txtCorreo.Text,
                rol_ = dropUsuario.SelectedIndex
                
            };
            mn.GA_Usuario(tipoEvent.Value, user);/*envia evento guardar o actualizar*/
            CargaTabla();
            limpiarCampos();
            tipoEvent.Value = "G";
            btnGuardar.Text = "GUARDAR";
        }
             
        
        protected void GridUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvusuarios.PageIndex = e.NewPageIndex;
            CargaTabla();
        }

        void CargaTabla()
        {
            try
            {
            DataTable dt = mn.ListarUsuarios();
            gvusuarios.DataSource = dt;
            gvusuarios.DataBind();
            
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex + "')</script>");
            }
}
        void limpiarCampos()
        {
           
            txtNombre.Text = "";
            txtContrasenia.Text = "";
            txtCorreo.Text = "";
            txtUsuario.Text = "";
            dropUsuario.SelectedIndex = 0;
            txtNombre.Focus();
        }
        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            limpiarCampos();
            tipoEvent.Value = "G";
            btnGuardar.Visible = true;
        }
          
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            /*CAPTURAMOS EL VALOR DE ID DEL REGISTRO Y EL NOMBRE DEL USUARIO, Y MOSTRAMOS EL MODAL CON LA INTERROGANTE*/
            Console.Write("ingreso al btn delete");
            Button BtnDelete = (Button)sender;
           GridViewRow selectedrow = (GridViewRow)BtnDelete.NamingContainer;
            hdnId.Value = selectedrow.Cells[1].Text;
            /*ELKIMINAR DEL CRUD*/
            var user = new Usuario { id_ = int.Parse(selectedrow.Cells[1].Text), nombre_ = selectedrow.Cells[2].Text };
            mn.EliminarUsuario(user);
            CargaTabla();

        }

  
        protected void gvusuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow fila = gvusuarios.SelectedRow;
            hdnId.Value = fila.Cells[0].Text;
            txtNombre.Text = fila.Cells[1].Text;
            txtCorreo.Text = fila.Cells[2].Text;
            txtUsuario.Text = fila.Cells[3].Text;
            dropUsuario.SelectedIndex = int.Parse(fila.Cells[4].Text);
            btnGuardar.Enabled = false;
            lblMensaje.Text = "Mensaje: Usuario seleccionado.";
             }
       

    }


}