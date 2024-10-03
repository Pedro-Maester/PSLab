import pygame

class Janela:
    def __init__(self,width:int,height:int,res:int,x:int = 0 , y:int = 0):
        self.width:int = width
        self.height:int = height
        self.res:int = res
        self.x:int = x
        self.y:int = y
        self.surface:pygame.Surface | pygame.SurfaceType = None
    def Get_W_H(self)->tuple[int,int]:
        return self.width,self.height
    def Surface_Init(self,surface:pygame.Surface|pygame.SurfaceType):
        self.surface = surface

    def Surface_Fill(self,cor):
        self.surface.fill(cor)
if __name__=="__main__":
    pygame.init()
    principal:Janela = Janela(500,500,200)
    principal.Surface_Init(pygame.display.set_mode(principal.Get_W_H()))
    pygame.display.set_caption("Py 3D Model Maker")
    run = True
    principal.surface.fill((255, 200, 50))
    pygame.draw.rect(principal.surface,(100,100,100),(100,100,100,100))
    while run:


        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                run = False
        pygame.display.flip()

    pygame.quit()

