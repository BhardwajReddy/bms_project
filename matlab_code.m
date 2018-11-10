a=textread('set_a/Z001.txt','%f'); 
plot(a);
[c,l] = wavedec(a,4,'db2');
approx = appcoef(c,l,'db2');
[cd1,cd2,cd3,cd4] = detcoef(c,l,[1 2 3 4]);
subplot(5,1,1)
plot(approx)
title('Approximation Coefficients')
subplot(5,1,2)
plot(cd4)
title('Level 4 Detail Coefficients')
subplot(5,1,3)
plot(cd3)
title('Level 3 Detail Coefficients')
subplot(5,1,4)
plot(cd2)
title('Level 2 Detail Coefficients')
subplot(5,1,5)
plot(cd1)
title('Level 1 Detail Coefficients')
approx = dbwavf('db4');
cd1 = dbwavf('db4');
cd2 = dbwavf('db4');
cd3 = dbwavf('db4');
cd4= dbwavf('db4');
features = [max(cd1') min(cd1') mean(cd1') std(cd1') max(cd2') min(cd2') mean(cd2') std(cd2') max(cd3') min(cd3') mean(cd3') std(cd3') max(cd4') min(cd4') mean(cd4') std(cd4') max(approx') min(approx') mean(approx') std(approx')];
output = feature(a,cd1,cd2,cd3,cd4);
files_a = dir(strcat('set_a','\*.txt'));
files_b = dir(strcat('set_b','\*.txt'));
files_c = dir(strcat('set_c','\*.txt'));
L = length (files_a);
X=[];
Y=[];
A = [1 0 0];
B = [0 1 0];
C = [0 0 1];
for i=1:L
   a=textread(strcat('set_a','\',files_a(i).name));   
   X = [X;feature(a)];
   Y = [Y;A];
end
for i=1:L
   a=textread(strcat('set_b','\',files_b(i).name));   
   X = [X;feature(a)];
   Y = [Y;B];
end
for i=1:L
   a=textread(strcat('set_c','\',files_c(i).name));   
   X = [X;feature(a)];
   Y = [Y;C];
end
X = typcast(X,uint32);

