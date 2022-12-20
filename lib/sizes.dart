const double designHeight = 926;
const double designWidth = 428;

double resWidth(width, sWidth) {
  return width / designWidth * sWidth;
}

double resHeight(height, sHeight) {
  return height / designHeight * sHeight;
}