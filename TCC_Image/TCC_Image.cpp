#include "TCC_Image.h"

namespace tcc_image {
	TCC_Image::TCC_Image(const char* path){
		this->buffer = stbi_load(path, &this->w, &this->h, &this->channels, 0);
		if (buffer == NULL)exit(1);
	}
	unsigned char* TCC_Image::Get_img_buffer() {
		return this->buffer;
	}
	int TCC_Image::Get_width() {
		return this->w;
	}
	int TCC_Image::Get_height() {
		return this->h;
	}
	int TCC_Image::Get_channels() {
		return this->channels;
	}
};