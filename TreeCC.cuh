#pragma once
#include "cuda.h"
#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <math.h>
#include <cuda_d3d11_interop.h>
#include <d3d11.h>
#include <d3dcompiler.h>
#include <dxgi.h>
#include <Windows.h>
#include <cuda_runtime_api.h>
#include <iostream>

#define COR unsigned char//cor. color
#define D_COR unsigned char//device cor,color
#define USI unsigned short int //small value int
#define N_THREADS 512
#define BLOCKS(count) (count/N_THREADS +1)
#define PRJ(f,d) ( f /( f + abs( d )))
#define HD __host__ __device__
#define SYNCTHREADS __syncthreads

#ifdef TCC_API
#define TCC __declspec(dllexport)
#else
#define TCC __declspec(dllimport)
#endif

#ifdef TCC_DOUBLE
#define TRG double // double between -1 and 1
#define D_TRG double//device double between -1 and 1
#define FLT double//double
#define D_FLT double//device double
#define PXL long  int//pixel related
#define D_PXL long int //device pixel related
#define UPXL unsigned long  int//pixel related
#define D_UPXL unsigned long int//device pixel related
#define SIN sin
#define COS cos
#define TAN tan
#define POW pow
#define SQRT sqrt
#define CEIL ceil
#define ABS abs
#define FLOOR floor
#define ROUND round
#define ATAN2 atan2
#define ASIN asin
#define ACOS acos
#elif TCC_LONG
#define TRG long double //long double between -1 and 1
#define D_TRG long double//device long double between -1 and 1
#define FLT long double//long double
#define D_FLT long double//device long double
#define PXL long long int//pixel related
#define D_PXL long long int //device pixel related
#define UPXL unsigned long long int//pixel related
#define D_UPXL unsigned long long int//device pixel related
#define SIN sinl
#define COS cosl
#define TAN tanl
#define POW powl
#define SQRT sqrtl
#define ATAN2 atan2l
#define ASIN asinl
#define ACOS acosl
#else 
#define TRG float //float  between -1 and 1
#define D_TRG float//device float  between -1 and 1
#define FLT float//float
#define D_FLT float//device float 
#define PXL int//pixel related
#define D_PXL int //device pixel related
#define UPXL unsigned int//pixel related
#define D_UPXL unsigned int//device pixel related
#define SIN sinf
#define COS cosf
#define TAN tanf
#define POW powf
#define SQRT sqrtf
#define ATAN2 atan2f
#define ASIN asinf
#define ACOS acosf
#endif // TCC_F


#define WHITE {255,255,255,255}
#define BLACK {0,0,0,255}
#define GRAY {128,128,128,255}
#define RED {255,0,0,255}
#define GREEN {0,255,0,255};
#define BLUE {0,0,255,255}


namespace Constantes {
    const TRG ONE = 1.0;
    const TRG ZERO = 0.0;
    const FLT M_U_CHAR = 255.0;
    const FLT M_U_CHAR_2 = 65025.0;
    const double Pi = 3.14159265358979323846;
};



struct  RGBA
{
    COR r = 128;
    COR g = 128;
    COR b = 128;
    COR a = 255;
    RGBA();
    RGBA(COR r, COR g, COR b, COR a);
    RGBA(COR r, COR g, COR b);
    RGBA& operator=(const RGBA& other);
    RGBA& operator+(const RGBA& other);
    RGBA& operator*(const FLT m);
    RGBA& operator*=(const FLT to_mult);

};

struct RGBAFLT {
    FLT r;
    FLT g;
    FLT b;
    FLT a;
    HD RGBAFLT();
    HD RGBAFLT(FLT v);
    HD RGBAFLT(FLT r, FLT g, FLT b, FLT a);
    //RGBAFLT& operator=(const RGBA& other);
    //RGBAFLT& operator+(const RGBA& other);
    HD RGBAFLT& operator*(const FLT m);
    HD RGBAFLT& operator*(const RGBAFLT& m);
    HD RGBAFLT& operator/(const FLT d);
    HD RGBAFLT& operator*=(const FLT to_mult);
    HD RGBAFLT& operator/=(const FLT to_div);
    HD RGBAFLT& operator=(const RGBAFLT& other);
    HD RGBAFLT& operator+(const RGBAFLT& other);
    HD RGBAFLT& operator+=(const RGBAFLT& to_add);
    HD RGBAFLT& operator+=(const FLT to_add);
    
};

struct Material//device
{
    RGBAFLT cor;
    bool glow;
    TRG ipermeability;
    TRG reflect;
    HD Material& operator=(const Material& other) {
        this->cor = other.cor;
        this->glow = other.glow;
        this->ipermeability = other.ipermeability;
        this->reflect = other.reflect;
        return *this;
    }
};
struct Texture//device
{
    Material* materials;
    UPXL height;
    UPXL width;
    UPXL area;
    
};

struct XYZ
{
    FLT x;
    FLT y;
    FLT z;
    HD XYZ();
    HD XYZ(FLT x, FLT y, FLT z);
    HD XYZ& operator +=(const XYZ& rhs);
    HD XYZ& operator -=(const XYZ& rhs);
    HD XYZ& operator /=(const FLT& div);
    HD XYZ& operator *=(const FLT& mult);
    HD XYZ& operator =(const XYZ& rhs);
    HD XYZ& operator +(const XYZ& rhs);
    HD XYZ& operator -(const XYZ& rhs);
    HD XYZ& operator /(const FLT& div);
};

struct Ponto {//device
    XYZ o, f, c;
};

struct Spinner {//device
    Spinner();
    TRG c[3] = { 1.0,1.0,1.0 };
    TRG s[3] = { 0.0,0.0,0.0 };
    Spinner* next = nullptr;
};

class Angle {//host
    TRG r;
    TRG c;
    TRG s;
    TRG* c_ptr;
    TRG* s_ptr;
    Angle* next;
    Angle(){
    }
    Angle(Spinner* spinner, short ptr = 0);
    void set_next(Angle* next);
    void set_r(TRG r, UPXL p = 0);
    void delta_r(TRG dr, UPXL p = 0);
    void update_spins();
};

struct Bone {//device
    Spinner* ang;
    Ponto pos;//universal
    Ponto* vertexs;
    XYZ origem;
    UPXL n_vertex;
    Bone* father;
};

class Articulation {
    Bone* bone;
    Angle ang;
    Articulation* next;
};

class Skeleton {
    UPXL n_bones;
    Articulation* articulations;//host
    Bone* bones;//device, array[n_bones]

};

struct W_H {
    TRG w[3];
    TRG h[3];
};

struct Plano {
    FLT a;
    FLT b;
    FLT c;
    FLT d;
    FLT l;
    XYZ n;
    HD Plano& operator=(const Plano& other);
    //HD Plano& operator=(Plano& other);
    HD Plano& operator*=(const FLT& mult);
    
    
};

struct Triangulo {
    Plano plano;
    W_H w_h;
    XYZ vetor[3];
    XYZ* ponto[3];
    Texture* tex;
};

class Model {
    UPXL n_tri;
    Skeleton* skeleton;
    Ponto* vertexs;
    Texture* textura;
    Bone* center;//points to skeleton bone[0] or aux bone;
    Triangulo* tri;//ptr
};

struct Particula {
    HD Particula();
    Particula* sub_particula = nullptr;// n_tri-1
    bool fliped;
    UPXL n_sub_prenchidas;
    Material** shadows;//n_lights * (n_tri)
    Material* material;
    FLT d;
    XYZ pos;
    Triangulo* tri_ptr;
    //RGBAFLT luminosidade;
    RGBAFLT cor;
    HD Particula& operator=(const Particula& p);    
};

struct Pixel {
    HD Pixel();
    Particula* particulas;//n_world_tri)
    FLT w;
    FLT h;
    UPXL n_particulas_prenchidas;
    RGBAFLT cor;
};

struct Frame {
    
    UPXL w;
    UPXL h;
    size_t a;//w*h
    //ID3D11Texture2D* texture;
    COR* buffer;//[4*a]
};

struct Cam {
    Bone* center;
    FLT focus;
    FLT res;
    FLT dis;
    Frame* frame;//device
};

struct Light {
    XYZ* pos;
    RGBAFLT cor;
    FLT lenght;
    FLT energia;
};

struct World {
    HD World();
    UPXL n_lights;
    UPXL n_cams;
    UPXL n_tri;
    UPXL n_bones;
    UPXL n_pixels;
    UPXL n_reflections;
    
    Light* lights;
    Cam* cam_array;
    Cam* cam;
    Triangulo* t_triangulos;
    Bone* t_bones;
    RGBAFLT sombra;
    Pixel* pixels;
    RGBAFLT background;
};

class Creation {
public:
    Creation(UPXL n_pixels_render,UPXL w,UPXL h,UPXL n_t, Triangulo* tri);
    World* world;
    UPXL n_pixel_render;//(a/n_p) +1
    UPXL area;
    UPXL h, w;

};
namespace first {
    void equacao_plano_host(Triangulo* tri);
};
void Render(Creation* creation);