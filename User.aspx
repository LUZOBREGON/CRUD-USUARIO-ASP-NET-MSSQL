<%@ Page Title="Gestion de usuarios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="User.aspx.cs" Inherits="Prueba1.User" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
           
     <div class="container_barra">
           <div class="nav-links">
             <a href="../productos/FrmGestionEditor.aspx" class="btn-link">Gestión productos</a>
             <a href="../usuarios/FrmLogin.aspx" class="btn-link">Cerrar sesión</a>
         </div>
     </div>
     <hr />

     <div class="container_layout">
         <div class="container_formulario">
             <h2 class="titulo-formulario">Registro y modificación de usurios</h2>
             <div class="form-row">
             <div class="form-group col-md-6">
                  <label for="ctl00$MainContent$txtNombre"  >Nombres del Usuario</label>
             <asp:TextBox runat="server" name="txtNombre" ID="txtNombre" CssClass="form-control"  placeholder="Nombre"/>
                 </div>
             <asp:HiddenField runat="server" ID="hdnId" />
               <asp:HiddenField runat="server" ID="tipoEvent" Value="G" />
             <div class="form-group col-md-6">
     <label  for="ctl00$MainContent$dropUsuario"> Usuario</label>
             <asp:TextBox runat="server" name="txtUsuario" ID="txtUsuario" CssClass="form-control" placeholder="Usuario"/>
                 </div>

                 </div>
             <div class="form-row">
                     <div class="form-group col-md-6">
<label for="ctl00$MainContent$txtContrasenia"> Contraseña</label>
             <asp:TextBox runat="server" type="pasword" name="txtContrasenia" ID="txtContrasenia" CssClass="form-control" placeholder="Contraseña" />
                 </div>
                     <div class="form-group col-md-6">
<label for="ctl00$MainContent$txtCorreo"> Correo Electronico</label>
             <asp:TextBox runat="server" name="txtCorreo" ID="txtCorreo" CssClass="form-control"  placeholder="Correo" />
                 </div>
                 </div>
             <div class="form-row">
                     <div class="form-group col-md-6">
<label for="dropUsuario"> Rol de Usuario</label>
             <asp:DropDownList runat="server" CssClass="form-control"  name="dropUsuario" ID="dropUsuario" >
                 <asp:ListItem Text="Rol de usuario" />
                 <asp:ListItem Text="Administrador" />
                 <asp:ListItem Text="Editor" />
                 <asp:ListItem Text="Lector" />
             </asp:DropDownList>
                
               
             <section class="container_botones">
                 <asp:Button Text="Guardar" runat="server" ID="btnGuardar" OnClick="BtnGuardar_Click" CssClass="btn btn-info form-control-sm"/>
          
             
             </section>
                          </div>
                   </div>

             <asp:Label Text="Resultado: " runat="server" ID="lblMensaje" CssClass="lbl-mensaje" />
         </div>
        
</div>

<br />

       
       
         <div class="container row">
    <div class="table small">
        <asp:GridView runat="server" ID="gvusuarios" DataKeyNames="id" class="table table-borderless table-hover" OnSelectedIndexChanged="gvusuarios_SelectedIndexChanged">
            <Columns>
                <asp:TemplateField HeaderText="Opciones del administrador">
                    <ItemTemplate>
                        <asp:Button runat="server" Text="Editar" CssClass="btn form-control-sm btn-warning" ID="BtnRead" OnClick="BtnRead_Click" Visible="true" />
                         <button type="button" class="btn btn-warning" onclick="editar()" >  <i class="fa-solid fa-pencil"></i></button>
                         <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop">  <i class="fa-solid fa-trash"></i></button>
                        <asp:Button runat="server" Text="Eliminar" CssClass="btn form-control-sm btn-danger" ID="BtnDelete" OnClick="BtnDelete_Click"  Visible="true" />
                        </ItemTemplate>
                    
                </asp:TemplateField>
           
            </Columns>

        </asp:GridView>
    </div>
</div>
                          <!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<h5 class="modal-title" id="staticBackdropLabel">Mensaje de Alerta</h5>
<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">
¿Esta seguro que desea eliminar registro?
</div>
<div class="modal-footer">
<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
    <button type="button" class="btn btn-danger" onclick="eliminar()" data-bs-dismiss="modal">Eliminar</button>
</div>
</div>
</div>
</div>

</main>

</asp:Content>
