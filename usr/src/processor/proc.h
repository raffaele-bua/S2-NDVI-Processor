#ifndef __NDVI_CLASS_H__
#define __NDVI_CLASS_H__

class NDVI{
 private:
  char *  ConcatString(const char *  s1, const char * s2);
  void ProcessRasterData(GDALRasterBand * band4_buffer, GDALRasterBand * band8_buffer, int nXSize, int nYSize, float * ndvi_raster);

 public:
  void process(char *  productPath, char * destinationPath);

};

#endif
