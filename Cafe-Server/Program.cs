using Cafe_Server;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// получаем строку подключени€ из файла конфигурации
string connection = builder.Configuration.GetConnectionString("DefaultConnection");

// добавл€ем контекст ApplicationContext в качестве сервиса в приложение
builder.Services.AddDbContext<MasterContext>(options => options.UseSqlServer(connection));

var app = builder.Build();

app.MapGet("/", () => "Hello World");

app.MapGet("/api/categories", (MasterContext db) => db.Categories.ToList());

app.MapPost("/api/categories", async (Category category, MasterContext db) =>
{
    // добавл€ем пользовател€ в массив
    await db.Categories.AddAsync(category);
    await db.SaveChangesAsync();
    return category;
});

app.MapDelete("/api/categories/{id:int}", async (int id, MasterContext db) =>
{   
    Category? category = await db.Categories.FirstOrDefaultAsync(c => c.Id == id);

    // если не найден, отправл€ем статусный код и сообщение об ошибке
    if (category == null) return Results.NotFound(new { message = " атегори€ не найдена" });

    // если найден, удал€ем его
    db.Categories.Remove(category);

    await db.SaveChangesAsync();

    return Results.Json(category);
});

app.MapPut("/api/categories", async (Category categoryData, MasterContext db) => {

    // получаем  по id
    var category = await db.Categories.FirstOrDefaultAsync(u => u.Id == categoryData.Id);

    // если не найден, отправл€ем статусный код и сообщение об ошибке
    if (category == null) return Results.NotFound(new { message = " атегори€ не найдена" });
        
    // если  найден, измен€ем его данные и отправл€ем обратно клиенту
    category.Name = categoryData.Name;
    await db.SaveChangesAsync();
    return Results.Json(category);

});

app.MapGet("/api/menuitems", (MasterContext db) => db.MenuItems.ToList());

app.MapPost("/api/menuitems", async (MenuItem menuItem, MasterContext db) =>
{
    // добавл€ем пользовател€ в массив
    await db.MenuItems.AddAsync(menuItem);
    await db.SaveChangesAsync();
    return menuItem;
});

app.MapDelete("/api/menuitems/{id:int}", async (int id, MasterContext db) =>
{
    MenuItem? menuItem = await db.MenuItems.FirstOrDefaultAsync(m => m.Id == id);

    // если не найден, отправл€ем статусный код и сообщение об ошибке
    if (menuItem == null) return Results.NotFound(new { message = "ѕозици€ меню не найдена" });

    // если найден, удал€ем его
    db.MenuItems.Remove(menuItem);

    await db.SaveChangesAsync();

    return Results.Json(menuItem);
});

app.MapPut("/api/menuitems", async (MenuItem menuItemData, MasterContext db) => {

    // получаем  по id
    var menuItem = await db.MenuItems.FirstOrDefaultAsync(u => u.Id == menuItemData.Id);

    // если не найден, отправл€ем статусный код и сообщение об ошибке
    if (menuItem == null) return Results.NotFound(new { message = " атегори€ не найдена" });

    // если  найден, измен€ем его данные и отправл€ем обратно клиенту
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
