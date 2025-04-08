#include "TreeCC.cuh"



    RGBA::RGBA() {
        this->r = 128;
        this->g = 128;
        this->b = 128;
        this->a = 255;
    };
    RGBA::RGBA(COR r, COR g, COR b, COR a) {
        this->r = r;
        this->g = g;
        this->b = b;
        this->a = a;
    };
    RGBA::RGBA(COR r, COR g, COR b) {
        this->r = r;
        this->g = g;
        this->b = b;
        this->a = 255;
    }
    RGBA& RGBA::operator=(const RGBA& other) {
        this->r = other.r;
        this->g = other.g;
        this->b = other.b;
        this->a = other.a;
        return *this;
    }
    RGBA& RGBA::operator+(const RGBA& other) {
        return RGBA(this->r + other.r,this->g + other.g,this->b + other.b,this->a + other.a);
    }
    RGBA& RGBA::operator*(const FLT m) {
        return RGBA( this->r * m,this->g * m,this->b * m ,this->a * m );
    }
    RGBA& RGBA::operator*=(const FLT to_mult) {
        this->r *= to_mult;
        this->g *= to_mult;
        this->b *= to_mult;
        this->a *= to_mult;
        return *this;
    }
    RGBAFLT::RGBAFLT() {

    }
    RGBAFLT::RGBAFLT(FLT v) {
        this->r = v;
        this->g = v;
        this->b = v;
        this->a = v;
    }
    RGBAFLT::RGBAFLT(FLT r,FLT g , FLT b , FLT a) {
        this->r = r;
        this->g = g;
        this->b = b;
        this->a = a;
    }

    RGBAFLT& RGBAFLT::operator=(const RGBAFLT& other) {
        this->r = other.r;
        this->g = other.g;
        this->b = other.b;
        this->a = other.a;
        return *this;
    }
    RGBAFLT& RGBAFLT::operator+(const RGBAFLT& other) {
        return RGBAFLT( this->r + other.r,this->g + other.g,this->b + other.b,this->a + other.a );
    }
    RGBAFLT& RGBAFLT::operator*(const FLT m) {
        return RGBAFLT(this->r * m,this->g * m,this->b * m ,this->a * m );
    }
    RGBAFLT& RGBAFLT::operator*(const RGBAFLT& m) {
        return RGBAFLT(this->r * m.r,this->g * m.g ,this->b* m.b ,this->a* m.a );
    }
    RGBAFLT& RGBAFLT::operator/(const FLT d) {
        if(d!=0)return RGBAFLT(this->r / d,this->g / d,this->b / d ,this->a / d );
        return *this;
    }
    RGBAFLT& RGBAFLT::operator*=(const FLT to_mult) {
        this->r *= to_mult;
        this->g *= to_mult;
        this->b *= to_mult;
        this->a *= to_mult;
        return *this;
    }
    RGBAFLT& RGBAFLT::operator/=(const FLT to_div) {
        this->r /= to_div;
        this->g /= to_div;
        this->b /= to_div;
        this->a /= to_div;
        return *this;
    }
    RGBAFLT& RGBAFLT::operator+=(const FLT to_add) {
        this->r += to_add;
        this->g += to_add;
        this->b += to_add;
        this->a += to_add;
        return *this;
    }
    RGBAFLT& RGBAFLT::operator+=(const RGBAFLT& to_add) {
        this->r += to_add.r;
        this->g += to_add.g;
        this->b += to_add.b;
        this->a += to_add.a;
        return *this;
    }


XYZ::XYZ() {

}
XYZ::XYZ(FLT x, FLT y, FLT z) {
    this->x = x;
    this->y = y;
    this->z = z;
}

XYZ& XYZ::operator +=(const XYZ& rhs) {
    this->x += rhs.x;
    this->y += rhs.y;
    this->z += rhs.z;
    return *this;
}
XYZ& XYZ::operator -=(const XYZ& rhs) {
    this->x -= rhs.x;
    this->y -= rhs.y;
    this->z -= rhs.z;
    return *this;
}



XYZ& XYZ::operator /=(const FLT& div) {
    if (div != 0) {
        this->x /= div;
        this->y /= div;
        this->z /= div;
    }
    return *this;
}

XYZ& XYZ::operator *=(const FLT& mult) {
    this->x *= mult;
    this->y *= mult;
    this->z *= mult;
    return *this;
}

XYZ& XYZ::operator =(const XYZ& rhs) {
    this->x = rhs.x;
    this->y = rhs.y;
    this->z = rhs.z;
    return *this;

}



XYZ& XYZ::operator +(const XYZ& rhs) {

    return XYZ(this->x + rhs.x,this->y + rhs.y,this->z + rhs.z);
}
XYZ& XYZ::operator -(const XYZ& rhs) {

    return XYZ(this->x - rhs.x,this->y - rhs.y,this->z - rhs.z );
}
XYZ& XYZ::operator /(const FLT& div) {
    if (div != 0)return XYZ(this->x / div,this->y / div,this->z / div );
    return XYZ(0,0,0 );
}

Angle::Angle(Spinner* spinner, short ptr) {
    this->r = 0.0;
    this->c = 1.0;
    this->s = 0.0;
    cudaMemcpy(&this->c_ptr, &spinner->c[ptr % 3], sizeof(TRG), cudaMemcpyDeviceToHost);
    cudaMemcpy(&this->s_ptr, &spinner->s[ptr % 3], sizeof(TRG), cudaMemcpyDeviceToHost);
    this->next = nullptr;

}
void Angle::set_next(Angle* next) {
    this->next = next;
    return;
}
void Angle::set_r(TRG r, UPXL p ) {
    this->r = r;
    this->c = COS(r);
    this->s = SIN(r);
    return;
}
void Angle::delta_r(TRG dr, UPXL p ) {
    this->r += dr;
    this->c = COS(this->r);
    this->s = SIN(this->r);
    return;
}
void Angle::update_spins() {
    cudaMemcpy(this->c_ptr, &this->c, sizeof(TRG), cudaMemcpyHostToDevice);
    cudaMemcpy(this->s_ptr, &this->s, sizeof(TRG), cudaMemcpyHostToDevice);
}
Plano& Plano::operator=(const Plano& other) {
    this->a = other.a;
    this->b = other.b;
    this->c = other.c;
    this->d = other.d;
    this->n = other.n;
    this->l = other.l;
    return *this;
}

Plano& Plano::operator*=(const FLT& mult) {
    this->a *= mult;
    this->b *= mult;
    this->c *= mult;
    this->d *= mult;
    this->n *= mult;
    return *this;
}

Particula::Particula() {

}

Particula& Particula::operator=(const Particula& p) {
    this->d = p.d;
    this->n_sub_prenchidas = p.n_sub_prenchidas;
    this->pos = p.pos;
    this->sub_particula = p.sub_particula;
    this->material = p.material;
    this->tri_ptr = p.tri_ptr;
    this->cor = p.cor;
    //this->luminosidade = p.luminosidade;
    return *this;
}

Pixel::Pixel() {

}
World::World() {

}

Creation::Creation(UPXL n_p,UPXL w, UPXL h,UPXL n_t,Triangulo* tri){
    this->area = w * h;
    this->h = h;
    this->w = w;
    this->n_pixel_render = n_p;
    //cudaMalloc((void**)& this->world, sizeof(World));
    Frame frame;
    frame.w = w;
    frame.h = h;
    frame.a = w * h;
    cudaMalloc((void**)&frame.buffer,4*w*h* sizeof(COR));
    Cam c;
    cudaMalloc((void**)&c.frame, sizeof(Frame));
    cudaMemcpy(c.frame, &frame, sizeof(Frame), cudaMemcpyHostToDevice);
    //cudaMemcpy(&c.frame->w, &frame.w, sizeof(UPXL), cudaMemcpyHostToDevice);
    
    c.focus = 2.0;
    c.res = 50;
    c.dis = 100;
    //c.frame = df;
    //Cam* dc;
    World world;
    cudaMalloc((void**)&world.cam, sizeof(Cam));
    cudaMemcpy(world.cam, &c, sizeof(Cam), cudaMemcpyHostToDevice);
    Light luz;
    luz.cor = RGBAFLT(1.0, 0.5, 0.0, 1.0);
    luz.energia = 3.0;
    luz.lenght = 1.0;
    XYZ lp = XYZ(3, 2, 1);

    cudaMalloc((void**) & luz.pos, sizeof(XYZ));
    cudaMemcpy(luz.pos, &lp, sizeof(XYZ), cudaMemcpyHostToDevice);
    
    world.background = RGBAFLT(1.0, 1.0, 0.5, 0.4);
    world.sombra = RGBAFLT(0.0,0.0,0.0,1);
    world.n_cams = 1;
    world.n_lights = 1;
    world.n_tri = n_t;
    world.t_triangulos = tri;
    //world.cam = dc;
    world.n_reflections = 0;
    world.n_pixels = n_p;
    cudaMalloc((void**)&world.lights, sizeof(Light));
    cudaMemcpy(world.lights, &luz, sizeof(Light), cudaMemcpyHostToDevice);
    //world.lights = nullptr;

    Pixel px; //= new Pixel[n_p];
   // for (UPXL i = 0; i < n_p; i += 1) {
        Particula* p = new Particula[n_t];
        for (UPXL j = 0; j < n_t; j += 1) {
            p[j].sub_particula = nullptr;
            p[j].tri_ptr = &tri[j];
            cudaMalloc((void**)&p[j].shadows, n_t * sizeof(Material*));
        }
        cudaMalloc((void**) &px.particulas, n_t * sizeof(Particula));
        cudaMemcpy(px.particulas, p, n_t * sizeof(Particula), cudaMemcpyHostToDevice);
    //}
        delete[]p;
    cudaMalloc((void**)&world.pixels, sizeof(Pixel));
    cudaMemcpy(world.pixels, &px, sizeof(Pixel), cudaMemcpyHostToDevice);
    cudaMalloc((void**) &this->world, sizeof(World));
    cudaMemcpy(this->world, &world, sizeof(World), cudaMemcpyHostToDevice);

}
namespace uteis {
    void set_spinner_next(Spinner* origem, Spinner* next) {
        cudaMemcpy(&origem->next, next, sizeof(Spinner*), cudaMemcpyDeviceToDevice);
    }
};

namespace devc {
    __device__ size_t Get_id() {
        size_t block_id = blockIdx.x + blockIdx.y * gridDim.x + blockIdx.z * gridDim.x * gridDim.y;
        size_t block_offset = block_id * blockDim.x * blockDim.y * blockDim.z;
        return block_offset + threadIdx.x + threadIdx.y * blockDim.x + threadIdx.z * blockDim.x * blockDim.y;
    }
    __device__ size_t Get_N_Thereads(size_t count) {
        return ((count < N_THREADS) && (count != 0)) ? count : N_THREADS;
    }
    __device__ FLT vetor_lenght(XYZ* v) {
        return SQRT(POW(v->x, 2) + POW(v->y, 2) + POW(v->z, 2));
    }
    __device__ FLT Vetor_lenght(XYZ* o, XYZ* f) {
        return SQRT(POW(f->x - o->x, 2) + POW(f->y - o->y, 2) + POW(f->z - o->z, 2));
    }
    __device__ bool entre_0_1(TRG n) {
        return ((n >= 0) && (n <= 1.0));
    }
    __device__ Material* get_material(Triangulo* tri, TRG a, TRG b, TRG c) {
        UPXL i = (tri->tex->height - 1) * (tri->w_h.h[0] * a + tri->w_h.h[1] * b + tri->w_h.h[2] * c) * tri->tex->width + (tri->tex->width - 1) * ((tri->w_h.w[0] * a + tri->w_h.w[1] * b + tri->w_h.w[2] * c));
        return &tri->tex->materials[i];
    }
    __global__ void calcular_vetor(Triangulo* tri_array, size_t count) {
        size_t id = Get_id();
        if (id < count) {
            Triangulo* tri = &tri_array[id];
            tri->vetor[0] = (*tri->ponto[1] - *tri->ponto[0]);
            tri->vetor[1] = (*tri->ponto[2] - *tri->ponto[1]);
            tri->vetor[2] = (*tri->ponto[0] - *tri->ponto[2]);
        }
        return;
    }
};

namespace first {
    FLT vetor_lenght(XYZ* v) {
        return SQRT(POW(v->x, 2) + POW(v->y, 2) + POW(v->z, 2));
    }
    void equacao_plano_host(Triangulo* tri) {

            tri->plano.a = (tri->ponto[1]->y - tri->ponto[0]->y) * (tri->ponto[2]->z - tri->ponto[0]->z) - (tri->ponto[2]->y - tri->ponto[0]->y) * (tri->ponto[1]->z - tri->ponto[0]->z);
            tri->plano.b = (tri->ponto[1]->z - tri->ponto[0]->z) * (tri->ponto[2]->x - tri->ponto[0]->x) - (tri->ponto[2]->z - tri->ponto[0]->z) * (tri->ponto[1]->x - tri->ponto[0]->x);
            tri->plano.c = (tri->ponto[1]->x - tri->ponto[0]->x) * (tri->ponto[2]->y - tri->ponto[0]->y) - (tri->ponto[2]->x - tri->ponto[0]->x) * (tri->ponto[1]->y - tri->ponto[0]->y);
            tri->plano.d = -(tri->plano.a * tri->ponto[0]->x + tri->plano.b * tri->ponto[0]->y + tri->plano.c * tri->ponto[0]->z);
            tri->plano.n = XYZ(tri->plano.a, tri->plano.b, tri->plano.c);
            tri->plano.l = first::vetor_lenght(&tri->plano.n);
            tri->plano.n /= tri->plano.l;
            printf("%f\n", tri->plano.b);
            printf("%f\n", tri->plano.l);
        
        return;
    }

    __global__ void equacao_plano(Triangulo* tri_array, size_t count) {
        size_t id = devc::Get_id();
        if (id < count) {
            Triangulo* tri = &tri_array[id];
            tri->plano.a = (tri->ponto[1]->y - tri->ponto[0]->y) * (tri->ponto[2]->z - tri->ponto[0]->z) - (tri->ponto[2]->y - tri->ponto[0]->y) * (tri->ponto[1]->z - tri->ponto[0]->z);
            tri->plano.b = (tri->ponto[1]->z - tri->ponto[0]->z) * (tri->ponto[2]->x - tri->ponto[0]->x) - (tri->ponto[2]->z - tri->ponto[0]->z) * (tri->ponto[1]->x - tri->ponto[0]->x);
            tri->plano.c = (tri->ponto[1]->x - tri->ponto[0]->x) * (tri->ponto[2]->y - tri->ponto[0]->y) - (tri->ponto[2]->x - tri->ponto[0]->x) * (tri->ponto[1]->y - tri->ponto[0]->y);
            tri->plano.d = -(tri->plano.a * tri->ponto[0]->x + tri->plano.b * tri->ponto[0]->y + tri->plano.c * tri->ponto[0]->z);
            tri->plano.n = XYZ(tri->plano.a, tri->plano.b, tri->plano.c);
            tri->plano.l = devc::vetor_lenght(&tri->plano.n);
            tri->plano.n /= tri->plano.l;
        }
        return;
    }

};

namespace spin {
    __device__ XYZ Spin(XYZ* src, Spinner* spinner) {
        return XYZ(src->x * spinner->c[0] * spinner->c[1] + src->y * spinner->s[1] + src->z * spinner->s[0], src->y * spinner->c[1] * spinner->c[2] - src->x * spinner->s[1] + src->z * spinner->s[2], src->z * spinner->c[0] * spinner->c[2] - src->x * spinner->s[1] - src->y * spinner->s[2] );
    }
    __global__ void plano_normal_lenght(Triangulo* tri_array, size_t count) {
        size_t id = devc::Get_id();
        if (id < count) {
            Triangulo* tri = &tri_array[id];
            tri->plano.l = SQRT(POW(tri->plano.a, 2) + POW(tri->plano.b, 2) + POW(tri->plano.c, 2));
        }
    }

    __global__ void equacao_plano(Triangulo* tri_array, size_t count) {
        size_t id = devc::Get_id();
        if (id < count) {
            Triangulo* tri = &tri_array[id];
            tri->plano.a = (tri->ponto[1]->y - tri->ponto[0]->y) * (tri->ponto[2]->z - tri->ponto[0]->z) - (tri->ponto[2]->y - tri->ponto[0]->y) * (tri->ponto[1]->z - tri->ponto[0]->z);
            tri->plano.b = (tri->ponto[1]->z - tri->ponto[0]->z) * (tri->ponto[2]->x - tri->ponto[0]->x) - (tri->ponto[2]->z - tri->ponto[0]->z) * (tri->ponto[1]->x - tri->ponto[0]->x);
            tri->plano.c = (tri->ponto[1]->x - tri->ponto[0]->x) * (tri->ponto[2]->y - tri->ponto[0]->y) - (tri->ponto[2]->x - tri->ponto[0]->x) * (tri->ponto[1]->y - tri->ponto[0]->y);
            tri->plano.d = -(tri->plano.a * tri->ponto[0]->x + tri->plano.b * tri->ponto[0]->y + tri->plano.c * tri->ponto[0]->z);
            tri->plano.n = (XYZ(tri->plano.a, tri->plano.b, tri->plano.c) / tri->plano.l);
        }
        return;
    }
    __global__ void Spin_vertexs_in_bone(Bone* bone) {
        size_t id = devc::Get_id();
        if (id < bone->n_vertex) {
            bone->vertexs[id].f = bone->vertexs[id].o;
            XYZ* src = &bone->vertexs[id].f;
            Spinner* cur_ang = nullptr;
            while (bone->father != nullptr) {
                bone = bone->father;
                cur_ang = bone->ang;
                while (cur_ang != nullptr) {
                    *src = Spin(src, cur_ang);
                    cur_ang = cur_ang->next;
                }
            }
            //*src = Spin(src, cam->angle);
        }
        return;

    }
    __global__ void Spin_bone(Bone* bone, size_t count) {
        size_t id = devc::Get_id();
        if (id < count) {
            Bone* cur_bone = &bone[id];
            bone[id].pos.f = bone[id].pos.o;
            XYZ* src = &bone[id].pos.f;
            Spinner* cur_ang;
            while (cur_bone->father != nullptr) {
                cur_bone = cur_bone->father;
                cur_ang = bone->ang;
                while (cur_ang != nullptr) {
                    *src = Spin(src, cur_ang);
                    cur_ang = cur_ang->next;
                }

            }
            
            Spin_vertexs_in_bone <<<BLOCKS(bone[id].n_vertex), N_THREADS >> > (&bone[id]);
            
            //cudaThreadSynchronize();
            
            //cudaDeviceSynchronize();
            
        }
        return;
    }
    __global__ void Spin_vertexs_in_bone_cam(Bone* bone, Bone* cam) {
        size_t id = devc::Get_id();
        if (id < bone->n_vertex) {
            bone->vertexs[id].c = bone->vertexs[id].f;
            Spinner* cur_ang = cam->ang;
            while (cur_ang != nullptr) {
                bone->vertexs[id].c = Spin(&bone->vertexs[id].c, cur_ang);
                cur_ang = cur_ang->next;
            }
        }
        return;
    }
    __global__ void Spin_Bone_Cam(Bone* bone, Bone* cam, size_t count) {
        size_t id = devc::Get_id();
        if (id < count) {
            bone[id].pos.c = bone[id].pos.f;
            Spinner* cur_ang = cam->ang;
            while (cur_ang != nullptr) {
                bone[id].pos.c = Spin(&bone[id].pos.c, cur_ang);
                cur_ang = cur_ang->next;
            }
        }
        Spin_vertexs_in_bone_cam << <BLOCKS(bone[id].n_vertex), N_THREADS >> > (&bone[id], cam);
        //cudaDeviceSynchronize();

    }
    __global__ void vertex_add(Bone* bone, FLT focus) {
        //size_t count = bone->n_points;
        size_t id = devc::Get_id();
        if (id < bone->n_vertex)bone->vertexs[id].c = XYZ(bone->vertexs[id].c.x * PRJ(bone->origem.y + bone->vertexs[id].c.y,focus) + bone->origem.x,bone->origem.y + bone->vertexs[id].c.y ,bone->vertexs[id].c.z * PRJ(bone->origem.y + bone->vertexs[id].c.y,focus) + bone->origem.z );

        return;
    }
    __global__ void bone_add(Bone* bone, Cam* cam, size_t count) {
        size_t id = devc::Get_id();
        if (id < count) {
            Bone* cur_bone = &bone[id];
            XYZ* src = &bone[id].origem;
            *src = bone[id].pos.c;
            while (bone->father != nullptr) {
                cur_bone = cur_bone->father;
                *src += cur_bone->pos.c;
            }
            *src -= cam->center->pos.c;
            *src = XYZ(src->x * PRJ(src->y,cam->focus),src->y,src->z * PRJ(src->y,cam->focus) );
            vertex_add << <BLOCKS(bone[id].n_vertex), N_THREADS >> > (&bone[id], cam->focus);
            //cudaDeviceSynchronize();
            //ponto_add<<<BLOCKS(bone[id].n_points), N_THREADS >> > (&bone[id], cam->focus);
            //ponto_add <<<BLOCKS(bone[id]->n_points), N_THREADS >>> (&bone[id], focus);
        }
        return;

    }
};

namespace ray {
    
    __device__ TRG Calculate_baricentro(XYZ* I, XYZ* O, XYZ* P) {
       
        FLT dot_product = (O->x * P->x + O->y * P->y + O->z * P->z) / (P->x * P->x + P->y * P->y + P->z * P->z);//(POW(P->x, 2) + POW(P->y, 2) + POW(P->z, 2));
        
        XYZ v = XYZ(O->x - dot_product * P->x, O->y - dot_product * P->y, O->z - dot_product * P->z);
        
        return 1.0 - ((v.x * I->x + v.y * I->y + v.z * I->z) / (v.x * O->x + v.y * O->y + v.z * O->z));
    }
    __device__ bool sameside(TRG* p,XYZ C,Triangulo* tri,Plano* plano,short a,short b){
        XYZ AB = *tri->ponto[b] - *tri->ponto[a];
        XYZ AC = C -*tri->ponto[a];
        
        FLT crossProductX = AB.y * AC.z - AB.z * AC.y; // Componente Z da normal
        FLT crossProductY = AB.z * AC.x - AB.x * AC.z;
        FLT crossProductZ = AB.x * AC.y - AB.y * AC.x;
        *p = SQRT(crossProductX * crossProductX + crossProductY * crossProductY + crossProductZ * crossProductZ);
        //printf("Foi");
        return (crossProductZ * plano->c >= 0) && (crossProductY * plano->b >= 0) && (crossProductX * plano->a >= 0);

    }
    __device__ bool Metodo_separacao(XYZ vt,Triangulo* tri,Plano* plano,TRG*a,TRG*b,TRG*c) {
        return sameside(a, vt, tri, plano, 0, 1) && sameside(a, vt, tri, plano, 1, 2) && sameside(a, vt, tri, plano, 2, 0);
    }
    __device__ RGBAFLT cor_sub_particulas(Particula* particula,RGBAFLT* background) {
        
        RGBAFLT result = *background;
        
        for (UPXL i = 0; i < particula->n_sub_prenchidas; i += 1) {
        
            result.a = result.a + (1 - result.a) * particula->sub_particula[i].cor.a;
            result.r = result.r * (1 - particula->sub_particula[i].cor.a) + particula->sub_particula[i].cor.r* particula->sub_particula[i].cor.a;
            result.g = result.g * (1 - particula->sub_particula[i].cor.a) + particula->sub_particula[i].cor.g * particula->sub_particula[i].cor.a;
            result.b = result.b * (1 - particula->sub_particula[i].cor.a) + particula->sub_particula[i].cor.b * particula->sub_particula[i].cor.a;
        
        }
        return result;
    }
   
    void pixel_color(World* world, Pixel* pixel,UPXL n) {
        Pixel p;
        cudaMemcpy(&p, pixel, sizeof(Pixel), cudaMemcpyDeviceToHost);
        p.cor = world->background;
        //cudaMemcpy(&p.cor, &world->background,sizeof(RGBAFLT), cudaMemcpyDeviceToHost);
        
        for (UPXL i = 0; i < n; i += 1) {
            Particula aux;
            cudaMemcpy(&aux, &p.particulas[i], sizeof(Particula), cudaMemcpyDeviceToHost);
            printf("erro aqui %d\n",i);
            p.cor.r = p.cor.r * (1 - aux.cor.a) + aux.cor.r * aux.cor.a;
            p.cor.g = p.cor.g * (1 - aux.cor.a) + aux.cor.g * aux.cor.a;
            p.cor.b = p.cor.b * (1 - aux.cor.a) + aux.cor.b * aux.cor.a;
            p.cor.a = p.cor.a + (1 - p.cor.a) * aux.cor.a;
            
        }
        
        cudaMemcpy(pixel, &p, sizeof(Pixel), cudaMemcpyHostToDevice);
        return;
    }

    __device__ void Produto_lights(World* world,Particula* particula) {
        
        RGBAFLT luminosidade = world->sombra;
        
        RGBAFLT e_result;// = RGBAFLT(1.0);
        for (UPXL li = 0; li < world->n_lights; li += 1) {
            
            e_result = world->lights[li].cor;
            for (UPXL sp = 0; sp < world->n_tri && e_result.a >0; sp += 1) {
                
                if (particula->shadows[sp] != nullptr) {

                    e_result.a *= (1.0 - (particula[sp].material->cor.a * particula->shadows[sp]->ipermeability));
                    e_result.r *= e_result.a * particula->shadows[sp]->cor.r;
                    e_result.g *= e_result.a * particula->shadows[sp]->cor.g;
                    e_result.b *= e_result.a * particula->shadows[sp]->cor.b;
                }
            }

            luminosidade += e_result* PRJ(world->lights[li].energia, world->lights[li].lenght * devc::Vetor_lenght(world->lights[li].pos, &particula->pos));
            
            //e_result = { 1.0 };
        
        }
        particula->cor =  ((particula->cor)* (luminosidade / (world->n_lights + 1.0)))* (1.0 - particula->material->reflect);
        
        if (particula->material->reflect > 0 && particula->sub_particula != nullptr) {
            
            particula->cor += cor_sub_particulas(particula,&world->background)* particula->material->reflect;
        }
        return;
    }

    __global__ void shadow_intersection(World* world, Particula* particula, UPXL light_id) {

        size_t id = devc::Get_id();

        if (id < (world->n_tri)) {
            printf("%d\n",id);
            particula->shadows[id] = nullptr;
            //particula->shadows[light_id * world->n_tri + id] = nullptr;
            
            if (particula->tri_ptr != &world->t_triangulos[id]) {
                
                Triangulo* tri = &world->t_triangulos[id];

                FLT div = tri->plano.a * (world->lights[light_id].pos->x - particula->pos.x) + tri->plano.b * (world->lights[light_id].pos->y - particula->pos.y) + tri->plano.c * (world->lights[light_id].pos->z - particula->pos.z);
                
                if (div != 0) {

                    FLT t = -(tri->plano.a * particula->pos.x + tri->plano.b * particula->pos.y + tri->plano.c * particula->pos.z + tri->plano.d) / div;

                    if (devc::entre_0_1(t)) {
                        
                        XYZ P = XYZ(particula->pos.x + t * ((world->lights[light_id].pos->x - particula->pos.x)), particula->pos.y + t * (world->lights[light_id].pos->y - particula->pos.y), particula->pos.z + t * (world->lights[light_id].pos->z - particula->pos.z));
                        TRG a, b, c;
                        if (Metodo_separacao(P, tri, &tri->plano, &a, &b, &c)) {
                            if ((a+b+c)> 0) {
                                FLT s = (a + b + c);
                                a /= s;
                                b /= s;
                                c /= s;
                            }
                            printf("%d a:%f b:%f c:%f soma:%f\n", id, a, b, c, a + b + c);
                            particula->shadows[id] = devc::get_material(tri, a, b, c);
                            //particula->shadows[light_id * world->n_tri + id] = devc::get_material(tri, a, b, c);
                            
                        }
                        /* XYZ AP = P - *tri->ponto[0];
                        XYZ BP = P - *tri->ponto[1];
                        XYZ CP = P - *tri->ponto[2];

                        TRG a = Calculate_baricentro(&AP, &tri->vetor[0], &tri->vetor[1]);
                        TRG b = Calculate_baricentro(&BP, &tri->vetor[1], &tri->vetor[2]);
                        TRG c = Calculate_baricentro(&CP, &tri->vetor[2], &tri->vetor[0]);

                        if ((a >= 0 && b >= 0 && c >= 0))particula->shadows[light_id * world->n_tri + id] = devc::get_material(tri, a, b, c);  */

                    }
                }
            }
            return;
        }
    }

    __global__ void light_ray(World* world, Particula* particula,size_t count) {
        
        size_t id = devc::Get_id();
        
        if (id < count) {
            
            for (UPXL li = 0; li < world->n_lights; li += 1) {
                printf("%d light ray:", li);
                shadow_intersection << <BLOCKS(world->n_tri), N_THREADS >> > (world, &particula[id], li);
                SYNCTHREADS();
                
                //
            }
            printf("Aqui");
            
            
            Produto_lights(world, &particula[id]);
        }
        return;
    }

    __global__ void ordenar_sub_particulas(World* world, Particula* particula) {
        
        size_t id = devc::Get_id();
        
        if (id < world->n_tri) {
        
            particula->n_sub_prenchidas = world->n_tri;
            
            UPXL n_particulas_vazias = 0;
            FLT a = 0.0;
            Particula aux;
            
            for (UPXL i = 0; i < (world->n_tri - (n_particulas_vazias + 1)); i += 1) {
                
                for (UPXL j = i + 1; j < (world->n_tri - n_particulas_vazias); j += 1) {
                
                    if (particula->sub_particula[i].material == nullptr) {
                    
                        aux = particula->sub_particula[i];
                        particula->sub_particula[i] = particula->sub_particula[world->n_tri - j];
                        particula->sub_particula[world->n_tri - j] = aux;
                        
                        n_particulas_vazias += 1;
                    
                    }
                    
                    if ((particula->sub_particula[i].material == nullptr) || particula->sub_particula[j].d < particula->sub_particula[i].d) {
                       
                        aux = particula->sub_particula[i];
                        particula->sub_particula[i] = particula->sub_particula[j];
                        particula->sub_particula[j] = aux;

                    }

                }
                if (particula->sub_particula[i].material == nullptr) {

                    particula->n_sub_prenchidas -= i;
                    i = world->n_tri;

                }
                else {

                    a = (1 - a ) * particula->sub_particula[i].material->cor.a + a;

                    if (a >=1.0) {

                        particula->n_sub_prenchidas -= (i + 1);
                        i = world->n_tri;
                    }
                }
            }
            particula->n_sub_prenchidas = world->n_tri - (particula->n_sub_prenchidas);

        }
        return;
    }

    __global__ void traycing_sub_particulas(World* world, Particula* particula) {
        
        size_t id = devc::Get_id();
        
        if (id < world->n_tri) {
            
            particula->sub_particula[id].material = nullptr;
            
            if (particula->sub_particula[id].tri_ptr == particula->tri_ptr)return;
            
            Triangulo* s_tri = particula->sub_particula[id].tri_ptr;
            Plano p_plano = particula->tri_ptr->plano;
            Plano s_plano = particula->sub_particula[id].tri_ptr->plano;
            
            if (particula->fliped)p_plano *= -1;
            
            particula->sub_particula[id].fliped = (signbit(s_plano.b) == signbit(p_plano.b));
            
            if (particula->sub_particula[id].fliped)s_plano *= -1.0;

            FLT div = (p_plano.n.x * world->cam->dis) * s_plano.a + (p_plano.n.y * world->cam->dis) * s_plano.b + (p_plano.n.z * world->cam->dis) * s_plano.c;
            
            if (div != 0) {
                
                TRG t = -(s_plano.a * particula->pos.x + s_plano.b * particula->pos.y + s_plano.c * particula->pos.z + s_plano.d) / div;
                
                if (devc::entre_0_1(t)) {
                    
                    XYZ P = XYZ(particula->pos.x + t * (p_plano.n.x * world->cam->dis),particula->pos.y + t * (p_plano.n.y * world->cam->dis),particula->pos.z + t * (p_plano.n.z * world->cam->dis) );
                    XYZ AP = P - *s_tri->ponto[0];
                    XYZ BP = P - *s_tri->ponto[1];
                    XYZ CP = P - *s_tri->ponto[2];
                    
                    TRG a = Calculate_baricentro(&AP, &s_tri->vetor[0], &s_tri->vetor[1]);
                    TRG b = Calculate_baricentro(&BP, &s_tri->vetor[1], &s_tri->vetor[2]);
                    TRG c = Calculate_baricentro(&CP, &s_tri->vetor[2], &s_tri->vetor[0]);
                    
                    if ((a >= 0 && b >= 0 && c >= 0)) {
                        particula->sub_particula[id].pos = P;
                        particula->sub_particula[id].d = world->cam->dis * t;
                        particula->sub_particula[id].material = devc::get_material(s_tri, a, b, c);
                        particula->sub_particula[id].cor = particula->sub_particula[id].material->cor;
                    }
                }
            }
        }
    }
    
    __global__ void traycing_sub_em_sub(World* world,Particula* particula,UPXL nivel){
        
        size_t id = devc::Get_id();
        
        if (id < particula->n_sub_prenchidas) {
            
            if (particula->sub_particula[id].material->reflect > 0) {
        
                traycing_sub_particulas<<<BLOCKS(world->n_tri),N_THREADS >> >(world, &particula->sub_particula[id]);//<<<n_tri-1>>>
                //cudaDeviceSynchronize();
                SYNCTHREADS();
                ordenar_sub_particulas << <BLOCKS(world->n_tri), N_THREADS >> > (world, &particula->sub_particula[id]);//<<<n_tri-1>>>
                //cudaDeviceSynchronize();
                SYNCTHREADS();
                if ((nivel > 1) && (particula->sub_particula[id].n_sub_prenchidas > 0)) {
                
                    traycing_sub_em_sub<<<BLOCKS(particula->sub_particula[id].n_sub_prenchidas),N_THREADS>>>(world, &particula->sub_particula[id],nivel-1);//<<<n_tri-1>>>
                    //cudaDeviceSynchronize();
                    SYNCTHREADS();
                }
                
                light_ray<<<BLOCKS(particula->sub_particula[id].n_sub_prenchidas),N_THREADS>>>(world, &particula->sub_particula[id], particula->n_sub_prenchidas);
                SYNCTHREADS();
                //cudaDeviceSynchronize();
                
            }
        }

    }
    
    __global__ void traycing_sub_particulas_em_pixels(World* world, Pixel* pixel) {
        
        size_t id = devc::Get_id();
        
        if (id < pixel->n_particulas_prenchidas) {
        
            if ((pixel->particulas[id].material->reflect > 0) && (pixel->particulas[id].sub_particula != nullptr)) {
            
                traycing_sub_particulas<<<BLOCKS(world->n_tri),N_THREADS>> >(world, &pixel->particulas[id]);//<<<n_tri-1>>>
                SYNCTHREADS();
                //cudaDeviceSynchronize();
                
                ordenar_sub_particulas << <BLOCKS(world->n_tri ), N_THREADS >> > (world, &pixel->particulas[id]);//<<<n_tri-1>>>
                SYNCTHREADS();
                //cudaDeviceSynchronize();
                
                if ((world->n_reflections > 1 )&& (pixel->particulas[id].n_sub_prenchidas >0)) {
                    
                    traycing_sub_em_sub << <BLOCKS(pixel->n_particulas_prenchidas), N_THREADS >> > (world, &pixel->particulas[id], world->n_reflections - 1);//<<<n_tri-1>>>
                    SYNCTHREADS();
                
                }
                
                light_ray <<<BLOCKS(pixel->n_particulas_prenchidas), N_THREADS >> > (world, pixel->particulas[id].sub_particula, pixel->particulas[id].n_sub_prenchidas);
                SYNCTHREADS();
                
            }
        }
        return;
    }

    /*__global__ void ordenar_particulas_em_pixels(World* world, Pixel* pixel) {
        
        size_t id = devc::Get_id();
        
        if (id < world->n_tri) {
            
            pixel->n_particulas_prenchidas = world->n_tri;
            
            FLT a = 0;
            UPXL n_particulas_vazias = 0;
            Particula aux;           
            
            for (UPXL i = 0; i < (world->n_tri - (n_particulas_vazias + 1)); i += 1) {
                
                for (UPXL j = i + 1; j < (world->n_tri - n_particulas_vazias); j += 1) {
                    
                    if (pixel->particulas[i].material == nullptr) {
                        
                        aux = pixel->particulas[i];
                        pixel->particulas[i] = pixel->particulas[world->n_tri - j];
                        pixel->particulas[world->n_tri - j] = aux;
                        n_particulas_vazias += 1;

                    }
                    if ((pixel->particulas[i].material == nullptr) || (pixel->particulas[j].d < pixel->particulas[i].d)) {
                        
                        aux = pixel->particulas[i];
                        pixel->particulas[i] = pixel->particulas[j];
                        pixel->particulas[j] = aux;

                    }

                }
                if (pixel->particulas[i].material == nullptr) {

                    pixel->n_particulas_prenchidas -= i;
                    i = world->n_tri;

                }
                else {

                    a = (1 - a) * pixel->particulas[i].material->cor.a + a;

                    if (a >= 255) {

                        pixel->n_particulas_prenchidas -= (i + 1);
                        i = world->n_tri;

                    }
                }
            }
            pixel->n_particulas_prenchidas = world->n_tri - (pixel->n_particulas_prenchidas);
        }
        return;
    }*/
    void ordenar_particulas_em_pixels(World* w, Pixel* p) {
        
            p->n_particulas_prenchidas = w->n_tri;

            FLT a = 0;

            //UPXL n_particulas_vazias = 0;
            Particula pi;
            Particula pj;
            Particula pnj;
            Particula aux;

            for (UPXL i = 0; i <(p->n_particulas_prenchidas - 1); i += 1) {
               // printf("i:%d\n", i);
                cudaMemcpy(&pi, &p->particulas[i], sizeof(Particula), cudaMemcpyDeviceToHost);
                for (UPXL j = i + 1; j < (p->n_particulas_prenchidas); j += 1) {
                   // printf("j:%d\n", j);
                    cudaMemcpy(&pj, &p->particulas[j], sizeof(Particula), cudaMemcpyDeviceToHost);
                    if (pi.material == nullptr) {

                        aux = pi;
                        cudaMemcpy(&p->particulas[i], &p->particulas[w->n_tri - j], sizeof(Particula), cudaMemcpyDeviceToDevice);
                        cudaMemcpy(&p->particulas[w->n_tri - j],&aux, sizeof(Particula), cudaMemcpyHostToDevice);
                        p->n_particulas_prenchidas -= 1;

                    }
                    //if (pi.material != nullptr || pj.material != nullptr)printf("Aqui");
                    if ((pi.material == nullptr) || ((pj.material!= nullptr)&&(pj.d < pi.d))) {
                        
                        aux = pi;
                        cudaMemcpy(&p->particulas[i], &p->particulas[j], sizeof(Particula), cudaMemcpyDeviceToDevice);
                        cudaMemcpy(&p->particulas[j], &aux, sizeof(Particula), cudaMemcpyHostToDevice);

                    }
                    cudaMemcpy(&pi, &p->particulas[i], sizeof(Particula), cudaMemcpyDeviceToHost);
                }
                //cudaMemcpy(&pi, &p->particulas[i], sizeof(Particula), cudaMemcpyDeviceToHost);
                
                if (pi.material == nullptr) {
                    
                    p->n_particulas_prenchidas = i;
                    i = w->n_tri;

                }
                else {
                    //printf("erro aqui");
                    Material m;
                    cudaMemcpy(&m, pi.material, sizeof(Material), cudaMemcpyDeviceToHost);
                    a = (1 - a) * m.cor.a + a;

                    if (a >= 1.0) {

                        p->n_particulas_prenchidas = (i+1);
                        i = w->n_tri;
                        //printf("erro aqui2 ");

                    }
                }
            }
            
            if (p->n_particulas_prenchidas == 0)printf("\nBolacha\n");
        return;
    }

    __global__ void traycing_particulas_em_pixels(World* world, Pixel* pixel) {

        size_t id = devc::Get_id();
        
        if (id < world->n_tri) {
            
            Triangulo* tri = pixel->particulas[id].tri_ptr;//&world->t_triangulos[id];
            //printf("%p\n", tri);
            pixel->particulas[id].material = nullptr;
            pixel->particulas[id].d = world->cam->dis;
            Plano plano;
            plano = tri->plano;

            pixel->particulas[id].fliped = !signbit(plano.b);

            if (pixel->particulas[id].fliped) {
                plano *= -1.0;//flip caso a normal esteja apontando para a mesma direção que o ray
                //if (!(id % 100))printf("%f\n", plano.b);
            }
            FLT div = world->cam->dis * plano.b;
            //if(!(id%100))printf("%f\n", plano.b);
            if (div != 0) {
                //printf("%d", id);
                TRG t = -(plano.a * pixel->w + plano.c * pixel->h + plano.d) / div;
               
                if (devc::entre_0_1(t)) {

                    //printf("%d\n", id);
                    
                    XYZ P = XYZ(pixel->w, t * world->cam->dis , pixel->h);
                   
                    //XYZ AP = XYZ( pixel->w - tri->ponto[0]->x,t * world->cam->dis - tri->ponto[0]->y, pixel->h - tri->ponto[0]->z );
                    //XYZ BP = XYZ(pixel->w - tri->ponto[1]->x,t * world->cam->dis - tri->ponto[1]->y, pixel->h - tri->ponto[1]->z );
                    //XYZ CP = XYZ(pixel->w - tri->ponto[2]->x,t * world->cam->dis - tri->ponto[2]->y, pixel->h - tri->ponto[2]->z );
                    
                    //XYZ AB = *tri->ponto[1] - *tri->ponto[0];
                    //XYZ BC = *tri->ponto[2] - *tri->ponto[1];
                    //XYZ CA = *tri->ponto[0] - *tri->ponto[2];
                    //TRG a = Calculate_baricentro(&AP, &AB, &BC);
                    //TRG b = Calculate_baricentro(&BP, &CA, &AB);
                    //TRG c = Calculate_baricentro(&CP, &tri->vetor[2], &tri->vetor[0]);
                    //tri->vetor[0] = tri->ponto[0] - tri->ponto[1];
                    //TRG a = Calculate_baricentro(&AP, &tri->vetor[0], &tri->vetor[1]);
                    //TRG b = Calculate_baricentro(&BP, &tri->vetor[2], &tri->vetor[0]);
                    //TRG c = Calculate_baricentro(&CP, &tri->vetor[2], &tri->vetor[0]);
                    //printf("a: %f, b: %f, c: %f\n", a, b, c);
                    TRG a, b, c;
                    if(Metodo_separacao(P,tri,&plano,&a,&b,&c)){
                    //if ((a >= 0) && (b >= 0) && (a<=1) && (b<=1)){
                        //printf("aqui");
                        //TRG c = 1 - (a + b);
                        if (plano.l > 0) {
                            a /= plano.l;
                            b /= plano.l;
                            c /= plano.l;
                        }
                        //printf("\n%f\n", (a + b + c));
                        //if ((a + b + c) == 0.5) {
                            pixel->particulas[id].pos = XYZ(pixel->w, world->cam->dis * t, pixel->h);
                            pixel->particulas[id].d = world->cam->dis * t;
                            pixel->particulas[id].material = devc::get_material(tri, a, b, c);
                            pixel->particulas[id].cor = pixel->particulas[id].material->cor;
                        //}
                        //printf("cor %f", pixel->particulas[id].cor.b);

                    }
                }
            }
        }
        return;
    }

    void traycing_pixels(Creation* c) {

        World world;
        
        Cam cam;
        Frame frame;
        Pixel p;
        cudaMemcpy(&world, c->world, sizeof(World), cudaMemcpyDeviceToHost);
        cudaMemcpy(&cam, world.cam, sizeof(Cam), cudaMemcpyDeviceToHost);
        cudaMemcpy(&frame, cam.frame, sizeof(Frame), cudaMemcpyDeviceToHost);
        cudaMemcpy(&p, world.pixels, sizeof(Pixel), cudaMemcpyDeviceToHost);
        COR* buffer = new COR[4*frame.a];
        //for(UPXL y = 0;y< frame.h;y+=1)for (UPXL id = 0; id < frame.w;id+=1) {
            //std::cout << id << std::endl;
        for (UPXL id = 0; id < frame.a; id += 1) {
            //printf("\nid: %d\n",id);
            //p.h = ((id / frame.w) - ((frame.h/2.0)))/(cam.res);
            //p.w = ((id % frame.w) - ((frame.w/2.0)))/(cam.res);
            p.w = (id % frame.w);
            p.h = (id / frame.w);
            p.w /= cam.res;
            p.h /= cam.res;
            p.w -= frame.w / (2.0*cam.res);
            p.h -= frame.h / (2.0 * cam.res);
            
               //p.h = y/cam.res ;
               // p.w = id/cam.res ;
            
            cudaMemcpy(world.pixels, &p, sizeof(Pixel), cudaMemcpyHostToDevice);
            //cudaMemcpy(&p.h,&h, sizeof(UPXL), cudaMemcpyHostToDevice);
            //cudaMemcpy(&p.w, &w, sizeof(UPXL), cudaMemcpyHostToDevice);
            traycing_particulas_em_pixels << <BLOCKS(world.n_tri), N_THREADS >> > (c->world, world.pixels);
            //
            cudaDeviceSynchronize();
            cudaMemcpy(&p, world.pixels, sizeof(Pixel), cudaMemcpyDeviceToHost);
            cudaMemcpy(&world, c->world, sizeof(World), cudaMemcpyDeviceToHost);
            
            ordenar_particulas_em_pixels(&world, &p);
            //SYNCTHREADS();
            cudaDeviceSynchronize();
            //cudaMemcpy(&world, c->world, sizeof(World), cudaMemcpyDeviceToHost);
            //cudaMemcpy(&p, world.pixels, sizeof(Pixel), cudaMemcpyDeviceToHost);
            //cudaMemcpy(&world, c->world, sizeof(World), cudaMemcpyDeviceToHost);
            //cudaMemcpy(&p, world.pixels, sizeof(Pixel), cudaMemcpyDeviceToHost);
            cudaMemcpy(world.pixels, &p, sizeof(Pixel), cudaMemcpyHostToDevice);
            if (world.n_reflections > 0) {
                
                traycing_sub_particulas_em_pixels << <BLOCKS(p.n_particulas_prenchidas), N_THREADS >> > (c->world, world.pixels);
                //SYNCTHREADS();
                cudaDeviceSynchronize();

            }
            
            if (p.n_particulas_prenchidas > 0) {
                //if (p.n_particulas_prenchidas > 1)printf("h:%f , w: %f\n",p.h,p.w);
                //cudaMemcpy(&p, world.pixels, sizeof(Pixel), cudaMemcpyDeviceToHost);
                printf("Erro 0  aqui");
                light_ray << <BLOCKS(p.n_particulas_prenchidas), N_THREADS >> > (c->world, p.particulas, p.n_particulas_prenchidas);

                //SYNCTHREADS();
                cudaDeviceSynchronize();
                
                
            }
            cudaMemcpy(world.pixels, &p, sizeof(Pixel), cudaMemcpyHostToDevice);
            //cudaMemcpy(world.pixels, &p, sizeof(Pixel), cudaMemcpyHostToDevice);
            printf("Erro 1  aqui");
            pixel_color(&world, world.pixels,p.n_particulas_prenchidas);
            //seta cor em frame
            Pixel px;
            printf("Erro 2  aqui");
            cudaMemcpy(&px, world.pixels, sizeof(Pixel), cudaMemcpyDeviceToHost);
            //printf("Erro 1  aqui");
            buffer[4 * id] = (COR)ceil(255 * px.cor.b);
            buffer[1 + 4 * id] = (COR)ceil(255 * px.cor.g);
            buffer[2 + 4 * id ] = (COR)(255 * px.cor.r);
            buffer[3 + 4 * id ] = (COR)(255 * px.cor.a);
            ///if (buffer[2 + 4 * id] == 0)printf("%d", id);
           /* buffer[4 * (id + y * frame.w)] = (COR)ceil(255 * px.cor.b);
            buffer[1 + 4 * (id + y * frame.w)] = (COR)ceil(255 * px.cor.g );
            buffer[2 + 4 * (id + y * frame.w)] = (COR)(255 * px.cor.r );
            buffer[3 + 4 * (id + y * frame.w)] = (COR)(255 * px.cor.a);*/
            //std::cout << ceil(255 * px.cor.b ) << std::endl;

            //printf("Erro 1  aqui");
        }
        cudaMemcpy(frame.buffer, buffer, 4 * frame.a* sizeof(COR), cudaMemcpyHostToDevice);
        delete[] buffer;
        return;
    }

       /* __global__ void traycing_pixels(World* world,UPXL p) {

        size_t id = devc::Get_id();

        if ((id < world->n_pixels) && ((id+p* world->n_pixels) < world->cam->frame->a)) {

            world->pixels[id].h = (((id+p* world->n_pixels) / world->cam->frame->w) - (world->cam->frame->h / 2)) / world->cam->res;
            world->pixels[id].w = (((id+p* world->n_pixels) % world->cam->frame->w) - (world->cam->frame->w / 2)) / world->cam->res;

            traycing_particulas_em_pixels <<<BLOCKS(world->n_tri), N_THREADS >> > (world, &world->pixels[id]);
            SYNCTHREADS();
            //cudaDeviceSynchronize();

            ordenar_particulas_em_pixels << <BLOCKS(world->n_tri), N_THREADS >> > (world, &world->pixels[id]);
            SYNCTHREADS();
            //cudaDeviceSynchronize();

            if (world->n_reflections > 0) {
                traycing_sub_particulas_em_pixels<<<BLOCKS(world->pixels[id].n_particulas_prenchidas),N_THREADS>>>(world, &world->pixels[id]);
                SYNCTHREADS();
                //cudaDeviceSynchronize();
            }

            light_ray << <BLOCKS(world->pixels[id].n_particulas_prenchidas), N_THREADS >> > (world, world->pixels[id].particulas, world->pixels->n_particulas_prenchidas);
            SYNCTHREADS();
            //cudaDeviceSynchronize();

            pixel_color(world, &world->pixels[id]);
            //seta cor em frame
            world->cam->frame->buffer[    4*(id+ p * world->n_pixels)] = ceil(255 * world->pixels->cor.b);
            world->cam->frame->buffer[1 + 4*(id+ p * world->n_pixels)] = ceil(255 * world->pixels->cor.g);
            world->cam->frame->buffer[2 + 4*(id+ p * world->n_pixels)] = ceil(255 * world->pixels->cor.r);
            world->cam->frame->buffer[3 + 4*(id+ p * world->n_pixels)] = ceil(255 * world->pixels->cor.a);

        }
        return;
    }
    */
};
//mudar negocio do world ser em device
void Render(Creation* creation) {
    //for (UPXL p = 0; p < creation->area; p += 1) {
        ray::traycing_pixels(creation);
    //}
}

