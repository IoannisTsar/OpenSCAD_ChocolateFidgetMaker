// Customizable STL grid generator
// Set the path to your STL and the exact size of the STL's bounding box.
// The grid will place copies with no gaps between them.

stl_path_1 = "housing.stl";
stl_path_2 = "spring.stl";
stl_path_3 = "keycap.stl";

// Bounding box size of the STL (in mm). Measure in your slicer or CAD tool.
stl_size = [30, 30, 18];

// Number of copies in X (columns) and Y (rows).
columns = 3;
rows = 2;

// Optional rotation for the imported STL (degrees).
stl_rotation = [90, 180, 90];

// Extra spacing between the second and third grids (in mm).
grid_gap_after_second = 5;

module stl_grid(path, size, cols, rows, rotation = [0, 0, 0]) {
  for (x = [0 : cols - 1])
    for (y = [0 : rows - 1])
      translate([x * size[0], y * size[1], 0])
        rotate(rotation)
          import(path);
}

grid_size = [columns * stl_size[0], rows * stl_size[1]];

translate([0, 0, 18])
  stl_grid(stl_path_1, stl_size, columns, rows, stl_rotation);

translate([grid_size[0], 0, 3.5])
  stl_grid(stl_path_2, stl_size, columns, rows, stl_rotation);

translate([grid_size[0] * 2 + grid_gap_after_second, 0, 9])
  stl_grid(stl_path_3, stl_size, columns, rows, stl_rotation);
