using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using BackPruebaTecnica.DB.Models;

namespace BackPruebaTecnica.DB.Contexts
{
    public partial class UserContext : DbContext
    {
        public UserContext()
        {
        }

        public UserContext(DbContextOptions<UserContext> options)
            : base(options)
        {
        }

        public virtual DbSet<actividades> actividades { get; set; }
        public virtual DbSet<usuarios> usuarios { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Data Source=DESKTOP-TU1U18C\\SQLEXPRESS;Initial Catalog=EncodeTestDB;Integrated Security=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<actividades>(entity =>
            {
                entity.HasKey(e => e.Id_Actividad)
                    .HasName("PK__activida__7CA7552416D4F670");

                entity.Property(e => e.Actividad).IsUnicode(false);

                entity.Property(e => e.Create_date)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.Id_usuarioNavigation)
                    .WithMany(p => p.actividades)
                    .HasForeignKey(d => d.Id_usuario)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__actividad__Id_us__2C3393D0");
            });

            modelBuilder.Entity<usuarios>(entity =>
            {
                entity.HasKey(e => e.Id_Usuario)
                    .HasName("PK__usuarios__63C76BE27C4F6538");

                entity.Property(e => e.Apellido)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.Email)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.Fecha_Nacimiento).HasColumnType("date");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.Pais)
                    .IsRequired()
                    .HasMaxLength(3)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
