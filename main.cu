#pragma once

#include "TreeCC.cuh"
#define STB_IMAGE_IMPLEMENTATION
#define STB_IMAGE_WRITE_IMPLEMENTATION
//#define STB_IMAGE_RESIZE_IMPLEMENTATION
#include "stb_image.h"
#include "stb_image_write.h"
//#include "stb_image_resize2.h"


struct Cubo {
	Texture tex;
	Triangulo tris[12];//12
	Triangulo* dtri;
	XYZ v[8] = { XYZ(1,2,1),XYZ(-1,2,1),XYZ(1,2,-1),XYZ(-1,2,-1),XYZ(1,3,1),XYZ(-1,3,1),XYZ(1,3,-1),XYZ(-1,3,-1) };
	Cubo() {
		this->tex.height = 10;
		this->tex.width = 10;
		this->tex.area = 10 * 10;
		Material materials[100];
		//this->tex.materials = new Material[100];
		Material base;
		base.cor = RGBAFLT(0.8, 0.8, 1.0, 1.0);
		base.reflect = 0;
		base.ipermeability = 0;
		base.glow = true;
		for (int i = 0; i < 100; i += 1) {
			base.cor = RGBAFLT(1.0,0.0,0.5,1.0);
			materials[i] = base;
		}
		cudaMalloc((void**)&this->tex.materials, 100 * sizeof(Material));
		cudaMemcpy(this->tex.materials, materials, 100 * sizeof(Material), cudaMemcpyHostToDevice);
		Texture* dt;
		cudaMalloc((void**)&dt, sizeof(Texture));
		cudaMemcpy(dt, &this->tex,sizeof(Texture), cudaMemcpyHostToDevice);
		//mexer vetores
		
		//frente
		this->tris[0].ponto[0] = &this->v[0];
		this->tris[0].ponto[1] = &this->v[1];
		this->tris[0].ponto[2] = &this->v[2];
		
		this->tris[0].vetor[0] = this->v[1] - this->v[0];
		this->tris[0].vetor[1] = this->v[2] - this->v[1];
		this->tris[0].vetor[2] = this->v[0] - this->v[2];
		
		this->tris[1].ponto[0] = &this->v[3];
		this->tris[1].ponto[1] = &this->v[2];
		this->tris[1].ponto[2] = &this->v[1];

		this->tris[1].vetor[0] = this->v[2] - this->v[1];
		this->tris[1].vetor[1] = this->v[3] - this->v[2];
		this->tris[1].vetor[2] = this->v[1] - this->v[2];

		//esquerda
		this->tris[2].ponto[0] = &this->v[1];
		this->tris[2].ponto[1] = &this->v[3];
		this->tris[2].ponto[2] = &this->v[5];

		this->tris[2].vetor[0] = this->v[5] - this->v[1];
		this->tris[2].vetor[1] = this->v[7] - this->v[5];
		this->tris[2].vetor[2] = this->v[1] - this->v[7];

		this->tris[3].ponto[0] = &this->v[7];
		this->tris[3].ponto[1] = &this->v[5];
		this->tris[3].ponto[2] = &this->v[3];

		this->tris[3].vetor[0] = this->v[3] - this->v[1];
		this->tris[3].vetor[1] = this->v[7] - this->v[3];
		this->tris[3].vetor[2] = this->v[1] - this->v[7];

		//direita

		this->tris[4].ponto[0] = &this->v[0];
		this->tris[4].ponto[1] = &this->v[2];
		this->tris[4].ponto[2] = &this->v[4];

		this->tris[4].vetor[0] = this->v[2] - this->v[0];
		this->tris[4].vetor[1] = this->v[6] - this->v[2];
		this->tris[4].vetor[2] = this->v[0] - this->v[6];

		this->tris[5].ponto[0] = &this->v[6];
		this->tris[5].ponto[1] = &this->v[4];
		this->tris[5].ponto[2] = &this->v[2];

		this->tris[5].vetor[0] = this->v[4] - this->v[0];
		this->tris[5].vetor[1] = this->v[6] - this->v[4];
		this->tris[5].vetor[2] = this->v[0] - this->v[6];

		// tras

		this->tris[6].ponto[0] = &this->v[4];
		this->tris[6].ponto[1] = &this->v[5];
		this->tris[6].ponto[2] = &this->v[6];

		this->tris[6].vetor[0] = this->v[5] - this->v[4];
		this->tris[6].vetor[1] = this->v[6] - this->v[5];
		this->tris[6].vetor[2] = this->v[4] - this->v[6];

		this->tris[7].ponto[0] = &this->v[7];
		this->tris[7].ponto[1] = &this->v[6];
		this->tris[7].ponto[2] = &this->v[5];

		this->tris[7].vetor[0] = this->v[6] - this->v[5];
		this->tris[7].vetor[1] = this->v[7] - this->v[6];
		this->tris[7].vetor[2] = this->v[5] - this->v[7];

		//cima

		this->tris[8].ponto[0] = &this->v[0];
		this->tris[8].ponto[1] = &this->v[1];
		this->tris[8].ponto[2] = &this->v[4];

		this->tris[8].vetor[0] = this->v[1] - this->v[0];
		this->tris[8].vetor[1] = this->v[5] - this->v[1];
		this->tris[8].vetor[2] = this->v[0] - this->v[5];

		this->tris[9].ponto[0] = &this->v[5];
		this->tris[9].ponto[1] = &this->v[4];
		this->tris[9].ponto[2] = &this->v[1];

		this->tris[9].vetor[0] = this->v[4] - this->v[0];
		this->tris[9].vetor[1] = this->v[5] - this->v[4];
		this->tris[9].vetor[2] = this->v[0] - this->v[5];

		//baixo

		this->tris[10].ponto[0] = &this->v[2];
		this->tris[10].ponto[1] = &this->v[3];
		this->tris[10].ponto[2] = &this->v[6];

		this->tris[10].vetor[0] = this->v[6] - this->v[2];
		this->tris[10].vetor[1] = this->v[7] - this->v[6];
		this->tris[10].vetor[2] = this->v[2] - this->v[7];

		this->tris[11].ponto[0] = &this->v[7];
		this->tris[11].ponto[1] = &this->v[6];
		this->tris[11].ponto[2] = &this->v[3];

		this->tris[11].vetor[0] = this->v[3] - this->v[2];
		this->tris[11].vetor[1] = this->v[7] - this->v[3];
		this->tris[11].vetor[2] = this->v[2] - this->v[7];

		for (int t = 0; t < 12; t += 1) {
			this->tris[t].tex = dt;
			this->tris[t].w_h.w[0] = 0.5;
			this->tris[t].w_h.w[1] = 0.5;
			this->tris[t].w_h.w[2] = 0.5;
			this->tris[t].w_h.h[0] = 0.5;
			this->tris[t].w_h.h[1] = 0.5;
			this->tris[t].w_h.h[2] = 0.5;
			first::equacao_plano_host(&this->tris[t]);
		}
		XYZ* dv;
		cudaMalloc(&dv, 8 * sizeof(XYZ));
		cudaMemcpy(dv, this->v, 8 * sizeof(XYZ), cudaMemcpyHostToDevice);
		//frente
		this->tris[0].ponto[0] = &dv[0];
		this->tris[0].ponto[1] = &dv[1];
		this->tris[0].ponto[2] = &dv[2];

		

		this->tris[1].ponto[0] = &dv[3];
		this->tris[1].ponto[1] = &dv[2];
		this->tris[1].ponto[2] = &dv[1];

		

		//esquerda
		this->tris[2].ponto[0] = &dv[0];
		this->tris[2].ponto[1] = &dv[2];
		this->tris[2].ponto[2] = &dv[4];

		

		this->tris[3].ponto[0] = &dv[6];
		this->tris[3].ponto[1] = &dv[4];
		this->tris[3].ponto[2] = &dv[2];

		

		//direita

		this->tris[4].ponto[0] = &dv[1];
		this->tris[4].ponto[1] = &dv[3];
		this->tris[4].ponto[2] = &dv[5];

		

		this->tris[5].ponto[0] = &dv[7];
		this->tris[5].ponto[1] = &dv[5];
		this->tris[5].ponto[2] = &dv[3];

		

		// tras

		this->tris[6].ponto[0] = &dv[4];
		this->tris[6].ponto[1] = &dv[5];
		this->tris[6].ponto[2] = &dv[6];

		

		this->tris[7].ponto[0] = &dv[7];
		this->tris[7].ponto[1] = &dv[6];
		this->tris[7].ponto[2] = &dv[5];

		

		//cima

		this->tris[8].ponto[0] = &dv[2];
		this->tris[8].ponto[1] = &dv[3];
		this->tris[8].ponto[2] = &dv[6];

		

		this->tris[9].ponto[0] = &dv[7];
		this->tris[9].ponto[1] = &dv[6];
		this->tris[9].ponto[2] = &dv[3];

		

		//baixo

		this->tris[10].ponto[0] = &dv[0];
		this->tris[10].ponto[1] = &dv[1];
		this->tris[10].ponto[2] = &dv[4];

		

		this->tris[11].ponto[0] = &dv[5];
		this->tris[11].ponto[1] = &dv[4];
		this->tris[11].ponto[2] = &dv[1];

		cudaMalloc((void**)&this->dtri, 12 * sizeof(Triangulo));
		cudaMemcpy(this->dtri, this->tris, 12 * sizeof(Triangulo), cudaMemcpyHostToDevice);
		
	}

};

void Save_to_file(Creation* c) {
	Frame f;
	World w;
	Cam cm;
	
	cudaMemcpy(&w, c->world, sizeof(World), cudaMemcpyDeviceToHost);
	cudaMemcpy(&cm, w.cam, sizeof(Cam), cudaMemcpyDeviceToHost);
	cudaMemcpy(&f,cm.frame , sizeof(Frame), cudaMemcpyDeviceToHost);
	//cudaMemcpy(&f, c->world->cam->frame, sizeof(Frame), cudaMemcpyDeviceToHost);
	COR* buffer = new COR[4*f.w * f.h];
	cudaMemcpy(buffer, f.buffer, 4*f.w * f.h * sizeof(COR), cudaMemcpyDeviceToHost);
	//std::cout << f.w<<std::endl;
	stbi_write_png("teste.png", f.w, f.h, 4, buffer, f.w * 4);
}

void Teste(Creation* creation) {
	//Cubo cubo = Cubo();
	//UPXL n_t = 12;
	//World w;// = creation->world;
	//UPXL* n;
	//World* w = creation->world;
	//cudaMemcpy(&w->n_tri,&n_t, sizeof(UPXL), cudaMemcpyHostToDevice);
	//cudaMemcpy(&w, creation->world, sizeof(World*), cudaMemcpyDeviceToHost);
	//cudaMemcpy(&creation->world->n_tri, &n_t, sizeof(UPXL),  cudaMemcpyHostToDevice);
	//cudaMemcpy(&w->t_triangulos, cubo.dtri,sizeof(Triangulo*), cudaMemcpyDeviceToDevice);
	Render(creation);
	Save_to_file(creation);
	

}





int main() {
	cudaSetDevice(0);
	Cubo cubo = Cubo();
	Creation creation(50, 100, 100,12,cubo.dtri);
	Teste(&creation);
	return 0;
}