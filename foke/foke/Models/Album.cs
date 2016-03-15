using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace foke.Models
{
    public class Album
    {
        public int Id { get; set;}
        public ICollection<Slika> Slike { get; set; }
    }
}