using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using foke.Models;

namespace foke.Context
{
    public class ApplicationContext : DbContext
    {
        public DbSet<Album> Albumi { get; set; }
        public DbSet<Lokal> Lokali { get; set; }
        public DbSet<Komentar> Komentari { get; set; }
        public DbSet<Event> Eventi { get; set; }
        public DbSet<Slika> Slike { get; set; }

        public ApplicationContext() { }

        public static ApplicationContext Create()
        {
            return new ApplicationContext();
        }
    }
}