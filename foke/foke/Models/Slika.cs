using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace foke.Models
{
    public class Slika
    {
        public int Id { get; set; } 
        public String PutanjaSlike { get; set; }
        public ICollection<Komentar> Komentari { get; set; }
        public int KomentarId { get; set; }
    }
}