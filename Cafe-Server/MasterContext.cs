using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Cafe_Server;

public partial class MasterContext : DbContext
{
    public MasterContext()
    {
    }

    public MasterContext(DbContextOptions<MasterContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Category> Categories { get; set; }

    public virtual DbSet<MenuItem> MenuItems { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=DESKTOP-0U71F0B\\SQLEXPRESS;Database=master;Trusted_Connection=True;TrustServerCertificate=Yes");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Category>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Category__3214EC071E742D8B");

            entity.ToTable("Category");

            entity.HasIndex(e => e.Name, "UQ__Category__737584F6B462C93E").IsUnique();

            entity.Property(e => e.Name).HasMaxLength(50);
        });

        modelBuilder.Entity<MenuItem>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__MenuItem__3214EC0777A8431A");

            entity.ToTable("MenuItem");

            entity.HasIndex(e => e.Available, "UQ__MenuItem__109BCAA872410A75").IsUnique();

            entity.HasIndex(e => e.Price, "UQ__MenuItem__6089BD09D8AA76C3").IsUnique();

            entity.HasIndex(e => e.Name, "UQ__MenuItem__737584F6DE712521").IsUnique();

            entity.Property(e => e.Caloric).HasMaxLength(4);
            entity.Property(e => e.Ingredients).HasMaxLength(150);
            entity.Property(e => e.Name).HasMaxLength(50);
            entity.Property(e => e.Weight).HasMaxLength(4);

            entity.HasOne(d => d.Category).WithMany(p => p.MenuItems)
                .HasForeignKey(d => d.CategoryId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__MenuItem__Catego__1E05700A");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
