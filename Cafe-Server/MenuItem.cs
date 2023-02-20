using System;
using System.Collections.Generic;

namespace Cafe_Server;

public partial class MenuItem
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Weight { get; set; } = null!;

    public string Ingredients { get; set; } = null!;

    public string Caloric { get; set; } = null!;

    public double Price { get; set; }

    public bool? Available { get; set; }

    public int CategoryId { get; set; }

    public virtual Category Category { get; set; } = null!;
}
