using Cafe_Server;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// �������� ������ ����������� �� ����� ������������
string connection = builder.Configuration.GetConnectionString("DefaultConnection");

// ��������� �������� ApplicationContext � �������� ������� � ����������
builder.Services.AddDbContext<MasterContext>(options => options.UseSqlServer(connection));

var app = builder.Build();

app.MapGet("/", () => "Hello World");


app.MapGet("/api/categories", (MasterContext db) => db.Categories.ToList());

app.MapPost("/api/categories", async (Category category, MasterContext db) =>
{
    // ��������� ������������ � ������
    await db.Categories.AddAsync(category);
    await db.SaveChangesAsync();
    return category;
});

app.MapDelete("/api/categories/{id:int}", async (int id, MasterContext db) =>
{   
    Category? category = await db.Categories.FirstOrDefaultAsync(c => c.Id == id);

    // ���� �� ������, ���������� ��������� ��� � ��������� �� ������
    if (category == null) return Results.NotFound(new { message = "��������� �� �������" });

    // ���� ������, ������� ���
    db.Categories.Remove(category);

    await db.SaveChangesAsync();

    return Results.Json(category);
});

app.MapPut("/api/categories", async (Category categoryData, MasterContext db) => {

    // ��������  �� id
    var category = await db.Categories.FirstOrDefaultAsync(u => u.Id == categoryData.Id);

    // ���� �� ������, ���������� ��������� ��� � ��������� �� ������
    if (category == null) return Results.NotFound(new { message = "��������� �� �������" });
        
    // ����  ������, �������� ��� ������ � ���������� ������� �������
    category.Name = categoryData.Name;
    await db.SaveChangesAsync();
    return Results.Json(category);

}); 

app.Run();
