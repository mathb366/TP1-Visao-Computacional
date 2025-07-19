
#amarelo
using Images,ImageView, ImageFiltering, Staristics
img = load("peppers.jpg");
hsv = HSV.(img)
M = channelview(hsv)
rgb = channelview(img)
mask = ((M[1,:,:].>=25) .&& (M[1,:,:].<=50)) .&& (M[3,:,:].>=0.8) .&& (M[2,:,:].>=0.3)
G=M;
G[1,:,:] = rgb[1,:,:].*mask
G[2,:,:] = rgb[2,:,:].*mask
G[3,:,:] = rgb[3,:,:].*mask
H = colorview(RGB,G)
mask = erode(mask)
mask = dilate(mask)
mask = closing(mask)
G[1,:,:] = rgb[1,:,:].*mask
G[2,:,:] = rgb[2,:,:].*mask
G[3,:,:] = rgb[3,:,:].*mask
tam=11;
se = ones(tam, tam);
filtro = imfilter(float.(mask), se);
dil_img = filtro.> 0.5
ero_img = filtro.>= (tam*tam)-1
tam = 11;
filtro = imfilter(float.(mask), se);
dil_img = filtro.> 0.5
filtro = imfilter(float.(dil_img), se);
ero_img = filtro.>= (tam*tam)-1
G[1,:,:] = rgb[1,:,:].*ero_img
G[2,:,:] = rgb[2,:,:].*ero_img
G[3,:,:] = rgb[3,:,:].*ero_img
T = colorview(RGB,G)
kernel = ones(3, 3) ./ 9
mascara = (3, 3)
media = imfilter(T, kernel)
mediana = mapwindow(median, T, mascara)
imshow(media)
imshow(mediana)


#verde

using Images,ImageView
img = load("peppers.jpg");
hsv = HSV.(img)
M = channelview(hsv)
rgb = channelview(img)
mask = ((M[1,:,:].>=50) .&& (M[1,:,:].<=155)) .&& (M[3,:,:].>=0.0) .&& (M[2,:,:].>=0.0)
G=M;
G[1,:,:] = rgb[1,:,:].*mask
G[2,:,:] = rgb[2,:,:].*mask
G[3,:,:] = rgb[3,:,:].*mask
H = colorview(RGB,G)
mask = erode(mask)
mask = dilate(mask)
mask = closing(mask)
G[1,:,:] = rgb[1,:,:].*mask
G[2,:,:] = rgb[2,:,:].*mask
G[3,:,:] = rgb[3,:,:].*mask
tam=11;
se = ones(tam, tam);
filtro = imfilter(float.(mask), se);
dil_img = filtro.> 0.5
ero_img = filtro.>= (tam*tam)-1
tam = 11;
filtro = imfilter(float.(mask), se);
dil_img = filtro.> 0.5
filtro = imfilter(float.(dil_img), se);
ero_img = filtro.>= (tam*tam)-1
G[1,:,:] = rgb[1,:,:].*ero_img
G[2,:,:] = rgb[2,:,:].*ero_img
G[3,:,:] = rgb[3,:,:].*ero_img
T = colorview(RGB,G)
imshow(T)

#vermelho

using Images,ImageView
img = load("peppers.jpg");
hsv = HSV.(img)
M = channelview(hsv)
rgb = channelview(img)
mask = ((M[1,:,:].>=0) .&& (M[1,:,:].<=12) .|| (M[1,:,:].>=320)) .&& (M[3,:,:].>=0.4) .&& (M[2,:,:].>=0.3)
G=M;
G[1,:,:] = rgb[1,:,:].*mask
G[2,:,:] = rgb[2,:,:].*mask
G[3,:,:] = rgb[3,:,:].*mask
H = colorview(RGB,G)
mask = erode(mask)
mask = dilate(mask)
mask = closing(mask)
G[1,:,:] = rgb[1,:,:].*mask
G[2,:,:] = rgb[2,:,:].*mask
G[3,:,:] = rgb[3,:,:].*mask
tam=11;
se = ones(tam, tam);
filtro = imfilter(float.(mask), se);
dil_img = filtro.> 0.5
ero_img = filtro.>= (tam*tam)-1
tam = 11;
filtro = imfilter(float.(mask), se);
dil_img = filtro.> 0.5
filtro = imfilter(float.(dil_img), se);
ero_img = filtro.>= (tam*tam)-1
G[1,:,:] = rgb[1,:,:].*ero_img
G[2,:,:] = rgb[2,:,:].*ero_img
G[3,:,:] = rgb[3,:,:].*ero_img
T = colorview(RGB,G)
imshow(T)

#preto

using Images,ImageView
img = load("peppers.jpg");
hsv = HSV.(img)
M = channelview(hsv)
rgb = channelview(img)
mask = (M[1,:,:].>=180) .&& (M[1,:,:].<=320) .&& (M[3,:,:].<=0.8) .&& (M[2,:,:].<=1.0) .|| (M[1,:,:].<=50) .&& (M[3,:,:].<=0.1) .&& (M[2,:,:].>=0.2) .&& (M[2,:,:].<=1.0)
G=M;
G[1,:,:] = rgb[1,:,:].*mask
G[2,:,:] = rgb[2,:,:].*mask
G[3,:,:] = rgb[3,:,:].*mask
H = colorview(RGB,G)
mask = erode(mask)
mask = dilate(mask)
mask = closing(mask)
G[1,:,:] = rgb[1,:,:].*mask
G[2,:,:] = rgb[2,:,:].*mask
G[3,:,:] = rgb[3,:,:].*mask
tam=11;
se = ones(tam, tam);
filtro = imfilter(float.(mask), se);
dil_img = filtro.> 0.5
ero_img = filtro.>= (tam*tam)-1
tam = 11;
filtro = imfilter(float.(mask), se);
dil_img = filtro.> 0.5
filtro = imfilter(float.(dil_img), se);
ero_img = filtro.>= (tam*tam)-1
G[1,:,:] = rgb[1,:,:].*ero_img
G[2,:,:] = rgb[2,:,:].*ero_img
G[3,:,:] = rgb[3,:,:].*ero_img
T = colorview(RGB,G)
imshow(T)

#media
img = load("peppers.jpg")
kernel = ones(10, 10) ./ 100
media = imfilter(img, kernel)
imshow(media)

#mediana
using Images, ImageView, OpenCV
img =  OpenCV.imread("peppers.jpg")
mediana = OpenCV.medianBlur(img, 17)
OpenCV.imshow("imagem", img)
OpenCV.imshow("mediana", mediana)
OpenCV.waitKey(0)
OpenCV.destroyAllWindows()

#bordas
using OpenCV
const cv = OpenCV
img = cv.imread("peppers.jpg")
gray = cv.cvtColor(img,cv.COLOR_BGR2GRAY)
edges = cv.Canny(gray,Float64(50),Float64(150))
cv.imshow("imagem", edges)
cv.waitKey(0)
cv.destroyAllWindows()
