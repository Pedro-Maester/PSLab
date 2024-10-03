

def point_in_triangle(pt, v1, v2, v3):
    # Calcula as coordenadas dos baricentros
    denom = (v2[1] - v3[1]) * (v1[0] - v3[0]) + (v3[0] - v2[0]) * (v1[1] - v3[1])
    barycentric1 = ((v2[1] - v3[1]) * (pt[0] - v3[0]) + (v3[0] - v2[0]) * (pt[1] - v3[1])) / denom
    barycentric2 = ((v3[1] - v1[1]) * (pt[0] - v3[0]) + (v1[0] - v3[0]) * (pt[1] - v3[1])) / denom
    barycentric3 = 1.0 - barycentric1 - barycentric2
    #alpha 1
    #beta 2
    #gama 3
    # Verifica se os coeficientes baricêntricos estão entre 0 e 1
    
    print("Baricentros soma:",barycentric1+barycentric2+barycentric3)
    print("B1",barycentric1)
    print("B2",barycentric2)
    print("B3",barycentric3)
    return 0.0 <= barycentric1 <= 1.0 and 0.0 <= barycentric2 <= 1.0 and 0.0 <= barycentric3 <= 1.0

def render_triangle(matrix , width, height, alpha, beta, gamma):
    
    for y in range(height):
        for x in range(width):
            if point_in_triangle((x - width/2, y - height/2), alpha, beta, gamma):
                matrix[y][x] = '*'
                print("x:",x-width/2, "y:",y-height/2)

    return matrix

# Defina os pontos do triângulo (podem ser negativos)
alpha = (-10, -30)
beta = (-15, 15)
gamma = (19, 30)

# Tamanho da matriz
width = 40
height = 40
matrix = [['-' for _ in range(width)] for _ in range(height)]
# Renderiza o triângulo na matriz
matrix = render_triangle(matrix,width, height, alpha, beta, gamma)
#alpha = (10, -13)
#beta = (5, 14)
#gamma = (8, 4)
#matrix = render_triangle(matrix,width, height, alpha, beta, gamma)
# Imprime a matriz
for row in matrix:
    print(' '.join(row))