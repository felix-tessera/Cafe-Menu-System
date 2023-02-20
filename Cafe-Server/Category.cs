using System;
using System.Collections.Generic;

namespace Cafe_Server;

public partial class Category
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<MenuItem> MenuItems { get; } = new List<MenuItem>();
}
