using System;
using System.Collections.Generic;

namespace BackPruebaTecnica.DB.Models
{
    public partial class actividades
    {
        public int Id_Actividad { get; set; }
        public DateTime Create_date { get; set; }
        public int Id_usuario { get; set; }
        public string Actividad { get; set; }

        public virtual usuarios Id_usuarioNavigation { get; set; }
    }
}
