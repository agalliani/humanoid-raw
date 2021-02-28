function [x,y,z] = lettura(Xlow,Xhigh,Ylow,Yhigh,Zlow,Zhigh)

  x = double(typecast(int8([Xlow Xhigh]),'int16'));
  y = double(typecast(int8([Ylow Yhigh]),'int16'));
  z = double(typecast(int8([Zlow Zhigh]),'int16'));
end

