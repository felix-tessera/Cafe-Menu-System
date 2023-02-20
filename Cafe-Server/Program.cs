using Cafe_Server;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// �������� ������ ����������� �� ����� ������������
string connection = builder.Configuration.GetConnectionString("DefaultConnection");

// ��������� �������� ApplicationContext � �������� ������� � ����������
builder.Services.AddDbContext<MasterContext>(options => options.UseSqlServer(connection));

var app = builder.Build();

app.MapGet("/", () => "Hello World");


app.MapGet("/api/getallmenu", (MasterContext db) => db.Categories.ToList());
app.MapPost("/api/addcategory", () => );



app.Run();
