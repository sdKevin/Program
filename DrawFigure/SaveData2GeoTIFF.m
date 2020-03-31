%% 把数据保存为geotiff格式，参数分别为保存路径，地理范围，矩阵数据
% savepath='E:\A2.tif';
% extent=[70.025,140.025,15.025,55.025];%CN_mete数据范围
% data=[1,2,3;4,5,6];
% SaveData2GeoTIFF(savepath,extent,data)

function SaveData2GeoTIFF(savepath,extent,data)
  %savepath='E:\test2.tif';
  Lon_min=extent(1);Lon_max=extent(2);Lat_min=extent(3);Lat_max=extent(4);
  %data=flipud(data);
  R = georasterref('RasterSize', size(data),'Latlim', [double(Lat_min) double(max(Lat_max))], 'Lonlim', [double(Lon_min) double(Lon_max)]);%地理栅格数据参考对象(类) 
  geotiffwrite(savepath,data,R);  
end 