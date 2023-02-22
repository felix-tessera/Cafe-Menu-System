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

app.Run();
