extends Spatial


export(int) var length := 10
export(int) var height := 10
export(int) var width := 10

export(float) var distance_between_points := 1.0
export(float) var point_max_size := 0.1 

var matrix

func _ready():

	matrix = []

	for x in range(length):

		matrix.append([])

		for y in range(height):
			
			matrix[x].append([])

			for _z in range(width):
			
				matrix[x][y].append(1.0)

func _input(_event):
	
	if Input.is_key_pressed(KEY_ENTER):

		for c in get_children():

			remove_child(c)
			c.queue_free()
			

		for x in range(length):

			for y in range(height):

				for z in range(width):

					var c := MeshInstance.new()
					add_child(c)
					
					c.set_translation(Vector3(x, y, z))
					c.set_scale(Vector3(0.1, 0.1, 0.1))
					c.set_mesh(CubeMesh.new())
					c.get_mesh().set_size(Vector3(1, 1, 1))
					
					#matrix[x][y][z]
