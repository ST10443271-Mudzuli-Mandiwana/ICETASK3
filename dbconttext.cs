
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;

namespace CLDV6211_ICETASK2
{


    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options) { }

        public DbSet<User> Users { get; set; }
        public DbSet<Post> Posts { get; set; }
    }
}

