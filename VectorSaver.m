i=0;
row=1;
while i==0
   if holdE(row,1)==0
       row=row+1;
   else
       row=row-1;
       i=1;
   end
end
ZeroErrorVector=holdX(1:row,:);
save('G:\FoodIntake\mfiles\07-29-15\ZeroErrorNew','ZeroErrorVector');