using System;
using System.Collections.Generic;

namespace BackPruebaTecnica.DB.Models
{
    public partial class usuarios
    {
        public usuarios()
        {
            actividades = new HashSet<actividades>();
        }

        public int Id_Usuario { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Email { get; set; }
        public DateTime Fecha_Nacimiento { get; set; }
        public long? Telefono { get; set; }
        public string Pais { get; set; }
        public bool Contacto { get; set; }

        public virtual ICollection<actividades> actividades { get; set; }
    }
}
