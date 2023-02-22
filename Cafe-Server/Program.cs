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

app.MapGet("/api/menuitems", (MasterContext db) => db.MenuItems.ToList());

app.MapPost("/api/menuitems", async (MenuItem menuItem, MasterContext db) =>
{
    // ��������� ������������ � ������
    await db.MenuItems.AddAsync(menuItem);
    await db.SaveChangesAsync();
    return menuItem;
});

app.MapDelete("/api/menuitems/{id:int}", async (int id, MasterContext db) =>
{
    MenuItem? menuItem = await db.MenuItems.FirstOrDefaultAsync(m => m.Id == id);

    // ���� �� ������, ���������� ��������� ��� � ��������� �� ������
    if (menuItem == null) return Results.NotFound(new { message = "������� ���� �� �������" });

    // ���� ������, ������� ���
    db.MenuItems.Remove(menuItem);

    await db.SaveChangesAsync();

    return Results.Json(menuItem);
});

app.MapPut("/api/menuitems", async (MenuItem menuItemData, MasterContext db) => {

    // ��������  �� id
    var menuItem = await db.MenuItems.FirstOrDefaultAsync(u => u.Id == menuItemData.Id);

    // ���� �� ������, ���������� ��������� ��� � ��������� �� ������
    if (menuItem == null) return Results.NotFound(new { message = "��������� �� �������" });

    // ����  ������, �������� ��� ������ � ���������� ������� �������
    menuItem.Name = menuItemData.Name;
    menuItem.Weight = menuItemData.Weight;
    menuItem.Ingredients = menuItemData.Ingredients;
    menuItem.Caloric = menuItemData.Caloric;
    menuItem.Price = menuItemData.Price;
    menuItem.Available = menuItemData.Available;
    menuItem.CategoryId = menuItemData.CategoryId;

    await db.SaveChangesAsync();
    return Results.Json(menuItem);

});

app.Run();
