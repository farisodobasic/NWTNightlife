using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace foke.Models
{
    public class Event
    {
        public ICollection<Album> Albumi { get; set; }
        public ICollection<Komentar> Komentari { get; set; }
        public int AlbumId { get; set; }
        public int KomentarId { get; set; }
    }
}