import tkinter
import math


'''to:list[int] = ['a','b','c','d','e','f','g','h','i','j','k','l']
    tl:list[int] = [0,1,2,5,8,9]
    dt = [to[i] for i in tl ]'''
class Angle:
    def __init__(self,r:float):
        self.r:float = r
        self.c:float = math.cos(r)
        self.s:float = math.sin(r)
    def change(self,r:float):
        self.r: float = r
        self.c: float = math.cos(r)
        self.s: float = math.sin(r)

    def delta(self,dr:float = math.pi/180.0):
        self.r += dr
        self.c: float = math.cos(self.r)
        self.s: float = math.sin(self.r)

class Angles:
    def __init__(self,xyz:tuple[float,float,float]):
        self.xy:Angle = Angle(xyz[0])
        self.xz: Angle = Angle(xyz[1])
        self.yz: Angle = Angle(xyz[2])
class Vertice:
    def __init__(self,xyz:tuple[float,float,float]):
        self.x = xyz[0]
        self.y = xyz[1]
        self.z = xyz[2]
        self.xyz:list[float] = list(xyz)

    def change_xy(self,c:float,s:float):
        self.x,self.y = self.x * c + self.y * s , self.y * c - self.x * s

    def change_xz(self, c: float, s: float):
        self.x, self.z = self.x * c + self.z * s, self.z * c - self.x * s

    def change_yz(self, c: float, s: float):
        self.y, self.z = self.y * c + self.z * s, self.z * c - self.y * s
    def update_xyz(self):
        self.xyz[0] = self.x
        self.xyz[1] = self.y
        self.xyz[2] = self.z

    def reset_xyz(self):
        self.x = self.xyz[0]
        self.y = self.xyz[1]
        self.z = self.xyz[2]

    def delta_xyz(self,d:tuple[float,float,float]):
        self.xyz[0] += d[0]
        self.xyz[1] += d[1]
        self.xyz[2] += d[2]



class Face:
    def __init__(self,v:list[int]):
        self.vertice:list[int] = v
        self.cor:list[float] = [0.4,0.4,0.4]

    def cor_to_str(self)->str:
       return '#{:02x}{:02x}{:02x}'.format((int(self.cor[0]*255)),(int(self.cor[1]*255)),(int(self.cor[2]*255)))
    def Add_Vertice(self,v:int):
        self.vertice.append(v)

    def Get_cor_tuple(self) -> tuple[float,float,float]:
        return self.cor[0],self.cor[1],self.cor[2]
    def Change_cor(self,c:tuple[float,float,float]):
        self.cor[0] = c[0]
        self.cor[1] = c[1]
        self.cor[2] = c[2]
class Objeto:
    def __init__(self,nome:str):
        self.nome:str = nome
        self.pos:Vertice = Vertice((0.0, 0.0, 0.0))
        self.vertices:list[Vertice] = list()
        self.faces:list[Face] = list()
        self.angs: Angles = Angles((0.0, 0.0, 0.0))
    def Add_Vertice(self,xyz:tuple[float,float,float]):
        self.vertices.append(Vertice(xyz))

    def Add_Face(self,f:list[int]):
        self.faces.append(Face(f))



    def Delta_AXY(self,dr:float):
        self.angs.xy.delta(dr)

    def Delta_AXZ(self, dr: float):
        self.angs.xz.delta(dr)

    def Delta_AYZ(self, dr: float):
        self.angs.yz.delta(dr)

    def Change_AXY(self,r:float):
        self.angs.xy.change(r)

    def Change_AXZ(self,r:float):
        self.angs.xz.change(r)

    def Change_AYZ(self,r:float):
        self.angs.yz.change(r)



    def Rotate_VXY(self):
        for v in self.vertices:
            v.change_xy(self.angs.xy.c,self.angs.xy.s)
    def Rotate_VXZ(self):
        for v in self.vertices:
            v.change_xz(self.angs.xz.c,self.angs.xz.s)
    def Rotate_VYZ(self):
        for v in self.vertices:
            v.change_yz(self.angs.yz.c,self.angs.yz.s)
    def Rotate(self,ordem:tuple[str,str,str]):
        for o in ordem:
            if o == "xz":
                self.Rotate_VXZ()
            elif o == "xy":
                self.Rotate_VXY()
            elif o =="yz":
                self.Rotate_VYZ()

    def Delta_F_XY(self,fs:list[int], dx: float = 0, dy: float = 0):
        for f in fs:
            for v in self.faces[f].vertice:
                self.vertices[v].delta_xyz((dx,dy,0.0))
    def Delta_F_XZ(self, fs:list[int], dx: float = 0, dz: float = 0):
        for f in fs:
            for v in self.faces[f].vertice:
                self.vertices[v].delta_xyz((dx, 0.0, dz))
    def Delta_F_YZ(self, fs:list[int], dy: float = 0, dz: float = 0):
        for f in fs:
            for v in self.faces[f].vertice:
                self.vertices[v].delta_xyz((0.0,dy, dz))

    def Rotate_FS_XY(self,fs:list[int],a:Angle):
        for f in fs:
            for v in self.faces[f].vertice:
                self.vertices[v].change_xy(a.c,a.s)
            #self.vertices[v].update_xyz()
    def Rotate_FS_XZ(self,fs:list[int],a:Angle):
        for f in fs:
            for v in self.faces[f].vertice:
                self.vertices[v].change_xz(a.c,a.s)
            #self.vertices[v].update_xyz()
    def Rotate_FS_YZ(self,fs:list[int],a:Angle):
        for f in fs:
            for v in self.faces[f].vertice:
                self.vertices[v].change_yz(a.c,a.s)
    def Rotate_F_XY(self,f:int,a:Angle):
        for v in self.faces[f].vertice:
            self.vertices[v].change_xy(a.c,a.s)
            #self.vertices[v].update_xyz()
    def Rotate_F_XZ(self,f:int,a:Angle):
        for v in self.faces[f].vertice:
            self.vertices[v].change_xz(a.c,a.s)
            #self.vertices[v].update_xyz()
    def Rotate_F_YZ(self,f:int,a:Angle):

        for v in self.faces[f].vertice:
            self.vertices[v].change_yz(a.c,a.s)
            #self.vertices[v].update_xyz()
    def Rotate_F(self,fs:list[int],ordem:tuple[str,str,str],a:tuple[float,float,float]):
        aux:Angles = Angles(a)
        for f in fs:
            for o in ordem:
                if o == "xz":
                    self.Rotate_F_XZ(f,aux.xz)
                elif o == "xy":
                    self.Rotate_F_XY(f,aux.xy)
                elif o == "yz":
                    self.Rotate_F_YZ(f,aux.yz)
            for v in self.faces[f].vertice:
                self.vertices[v].update_xyz()
'''class Entidade:
    def __init__(self):
        self.pos:Vertice = Vertice((0.0, 0.0, 0.0))
        self.angs: Angles = Angles((0.0, 0.0, 0.0))
        self.objs:list[Objeto]= list()'''

class Janela:
    def __init__(self,width:int,height:int,res:int,nome:str,px:int = 0 , py:int = 0):
        self.width:int = width
        self.height:int = height
        self.res:int = res
        self.pad_x:int = px
        self.pad_y:int = py
        self.surface:tkinter.Tk|tkinter.Canvas = None
        self.nome = nome
        self.objs:list[Objeto] = list()
        self.exis:str = "xz"
    def Set_Surface(self,surface):
        self.surface = surface
    def Change_Exis(self,exi:str):
        self.exis = exi
    def Start_Screen(self):
        self.surface.geometry(str(self.width)+'x'+str(self.height))
    def Add_Objeto(self,obj):
        self.objs.append(obj)

    def Draw_Objetos(self):

        for o in self.objs:
            for f in o.faces:
                w = []
                h = []
                p= []
                if self.exis == "xy":
                    p = [[self.width / 2 + self.res * (o.vertices[i].x+o.pos.x) ,self.height / 2 - self.res *( o.vertices[i].y+o.pos.y)] for
                         i in f.vertice]
                    #w = list(self.width/2 + self.res * o.vertices[i].x,o.vertices[i].y for i in f.vertice)
                    #h = list(self.height/2 +self.res * o.vertices[i].y for i in f.vertice)
                elif self.exis == "xz":
                    p = [[self.width / 2 + self.res * (o.vertices[i].x+o.pos.x), self.height / 2 - self.res * (o.vertices[i].z+o.pos.z)] for
                         i in f.vertice]
                    #w = list(self.width/2 + self.res * o.vertices[i].x for i in f.vertice)
                    #h = list(self.height/2 + self.res * o.vertices[i].z for i in f.vertice)
                else:
                    p = [[self.width / 2 + self.res * (o.vertices[i].y+o.pos.y), self.height / 2 - self.res * (o.vertices[i].z + o.pos.z)] for
                         i in f.vertice]
                    #w = list(self.width/2 + self.res * o.vertices[i].y for i in f.vertice)
                    #h = list(self.height/2 + self.res *o.vertices[i].z for i in f.vertice)
                #print(h)
                #print(w)
                self.surface.create_polygon(p,fill=f.cor_to_str())
                #for v in range(1,len(f.vertice)-1):
                    #self.surface.create_polygon()
                    # o.vertices[0], o.vertives[v] , o.vertices[v+1]
        return

    def Draw_Vertices(self):
        for o in self.objs:
            for v in o.vertices:
                p =[]
                if self.exis == "xy":
                    p = [self.width / 2 + self.res * (v.x+o.pos.x) ,self.height / 2 - self.res *(v.y+o.pos.y)]
                elif self.exis == "xz":
                    p = [self.width / 2 + self.res * (v.x + o.pos.x), self.height / 2 - self.res * (v.z + o.pos.z)]
                else:
                    p = [self.width / 2 + self.res * (v.y+o.pos.y) ,self.height / 2 - self.res *(v.z+o.pos.z)]
                x = (p[0]-5), (p[0]+5)
                y = (p[1]-5), (p[1]+5)
                self.surface.create_oval(x[0],y[0],x[1],y[1],fill="red")

    def Update(self):
        self.surface.update()

if __name__ == "__main__":
    principal:Janela = Janela(1000,960,50,"3d Model Maker",0,0)

    principal.Set_Surface(tkinter.Tk())
    #principal.surface.attributes('-fullscreen', True)
    principal.Start_Screen()
    canvaxy: Janela = Janela(300,300,32,"xy",0,0)
    canvaxz: Janela = Janela(300, 300, 32, "xz", 0, 0)
    canvayz: Janela = Janela(300, 300, 32, "yz", 0, 0)
    canvaxy.Set_Surface(tkinter.Canvas(principal.surface,width=canvaxy.width,height=canvaxy.height,bg="violet"))
    canvaxz.Set_Surface(tkinter.Canvas(principal.surface, width=canvaxz.width, height=canvaxz.height, bg="yellow"))
    canvayz.Set_Surface(tkinter.Canvas(principal.surface, width=canvaxz.width, height=canvaxz.height, bg="cyan"))
    obj:Objeto = Objeto("Teste")
    obj.Add_Vertice((0.0,0.0,0.0))
    obj.Add_Vertice((1.0, 1.5, 0.0))
    obj.Add_Vertice((2.0, 0.0, 1.0))
    #obj.Add_Vertice((2.5, -2.0, 1.0))
    obj.Add_Face([0,1,2])
    canvaxy.Add_Objeto(obj)
    obj2: Objeto = Objeto("Teste")
    obj2.Add_Vertice((0.0, 0.0, 0.0))
    obj2.Add_Vertice((1.0, 1.5, 0.0))
    obj2.Add_Vertice((2.0, 0.0, 1.0))
    #obj2.Add_Vertice((2.5, -2.0, 1.0))
    obj2.Add_Face([0, 1, 2])
    canvaxz.Add_Objeto(obj2)
    obj3: Objeto = Objeto("Teste")
    obj3.Add_Vertice((0.0, 1.0, 0.0))
    obj3.Add_Vertice((1.0, 1.5, 0.0))
    obj3.Add_Vertice((2.0, 1.0, 1.0))
    #obj3.Add_Vertice((2.5, -2.0, 1.0))
    obj3.Add_Face([0, 1, 2])
    canvayz.Add_Objeto(obj3)
    canvaxy.surface.pack( anchor='w',padx=canvaxy.pad_x, pady=canvaxy.pad_y)
    canvaxz.surface.pack(anchor='w',padx=canvaxz.pad_x, pady=canvaxz.pad_y)
    canvayz.surface.pack(anchor='w',padx= canvayz.pad_x,pady=canvayz.pad_y)
    canvaxy.Change_Exis("xy")
    canvaxz.Change_Exis("xz")
    canvayz.Change_Exis("yz")
    canvaxy.Draw_Objetos()
    canvaxz.Draw_Objetos()
    canvayz.Draw_Objetos()
    canvaxy.Draw_Vertices()
    canvaxz.Draw_Vertices()
    canvayz.Draw_Vertices()

    #Vertice((0.0,0.0,0.0))
    #Vertice((1.0,1.0,1.0))
    #Vertice((2.0,0.0,3.0))









    principal.surface.mainloop()


