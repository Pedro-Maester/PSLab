#pragma once
#define STB_IMAGE_IMPLEMENTATION
#define STB_IMAGE_WRITE_IMPLEMENTATION
#define STB_IMAGE_RESIZE_IMPLEMENTATION
#include "stb_image.h"
#include "stb_image_write.h"
#include "stb_image_resize2.h"


namespace tcc_image {
	class TCC_Image {
		int w;
		int h;
		int channels;
		unsigned char* buffer;
		TCC_Image(const char* path);
		unsigned char* Get_img_buffer();
		int Get_width();
		int Get_height();
		int Get_channels();
	};
};



