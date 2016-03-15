using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace foke.Models
{
    public class Lokal
    {
        public int Id { get; set; }
        public ICollection<Album> Albumi { get; set; }
        public int AlbumId { get; set; }
    }
}