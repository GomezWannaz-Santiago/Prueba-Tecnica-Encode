using BackPruebaTecnica.DB.Contexts;
using BackPruebaTecnica.DB.Models;
using BackPruebaTecnica.Entities;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace BackPruebaTecnica.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UserController : ControllerBase
    {
        private readonly UserContext DbContext = new UserContext();

        private readonly ILogger<UserController> _logger;

        public UserController(ILogger<UserController> logger)
        {
            _logger = logger;
        }
        [EnableCors]
        [HttpGet]
        public IEnumerable<Usuario> Get()
        {
            var result = DbContext.usuarios.Select(x => new Usuario
            {
                Nombre = x.Nombre,
                Apellido = x.Apellido,
                Email = x.Email,
                Pais = x.Pais,
                FechaNacimiento = x.Fecha_Nacimiento,
                Telefono = x.Telefono,
                DeseaContacto = x.Contacto,
            }).ToList();
            return result ;
        }

        [EnableCors]
        [HttpPost]
        public IActionResult Post(Usuario usuario)
        {
            try
            {
                if (usuario == null)
                    return BadRequest();
                if (string.IsNullOrEmpty(usuario.Nombre))
                    throw new Exception("El nombre es requerido.");
                if (string.IsNullOrEmpty(usuario.Apellido))
                    throw new Exception("El apellido es requerido");
                if (string.IsNullOrEmpty(usuario.Email) || !Regex.Match(usuario.Email,"^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$").Success)
                    throw new Exception("El Email es requerido");
                if (usuario.FechaNacimiento > DateTime.Now)
                    throw new Exception("La fecha de nacimiento es mayor a la fecha actual");
                if (string.IsNullOrEmpty(usuario.Pais))
                    throw new Exception("El código de país es requerido");
                if(usuario.Pais.Length != 3)
                    throw new Exception("El código de país es de 3 dígitos");

                usuarios usuarioDB = new usuarios();

                usuarioDB.Nombre = usuario.Nombre;
                usuarioDB.Apellido = usuario.Apellido;
                usuarioDB.Pais = usuario.Pais.ToUpper();
                usuarioDB.Telefono = usuario.Telefono;
                usuarioDB.Contacto = usuario.DeseaContacto;
                usuarioDB.Email = usuario.Email;
                usuarioDB.Fecha_Nacimiento = usuario.FechaNacimiento;


                DbContext.usuarios.Add(usuarioDB);
                DbContext.SaveChanges();

                return Ok();
            }

            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }


            
        }


    }
}
