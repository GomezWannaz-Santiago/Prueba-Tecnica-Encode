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
    public class HistoryController : ControllerBase
    {
        private readonly UserContext DbContext = new UserContext();

        private readonly ILogger<HistoryController> _logger;

        public HistoryController(ILogger<HistoryController> logger)
        {
            _logger = logger;
        }
        [EnableCors]
        [HttpGet]
        public IEnumerable<HistorialActividad> Get()
        {
            var result = DbContext.actividades.OrderByDescending(x=> x.Create_date).Select(x => new HistorialActividad()
            {
                Nombre = (x.Id_usuarioNavigation.Nombre ?? "" )+ " " + (x.Id_usuarioNavigation.Apellido ?? ""),
                FechaCreacion = x.Create_date,
                Observacion = x.Actividad
            }).ToList();
            return result;
        }

    }
}
