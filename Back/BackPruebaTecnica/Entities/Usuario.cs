using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackPruebaTecnica.Entities
{
    public class Usuario
    {
        public string Nombre { get; set; }

        public string Apellido { get; set; }

        public string Email { get; set; }

        public DateTime FechaNacimiento { get; set; }

        public long? Telefono { get; set; }

        public string Pais { get; set; }

        public bool DeseaContacto { get; set; }







    }
}
