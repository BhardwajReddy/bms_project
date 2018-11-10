function output = feature(a,cd1,cd2,cd3,cd4)
[c,l] = wavedec(a,4,'db2');
approx = appcoef(c,l,'db2');
[cd1,cd2,cd3,cd4] = detcoef(c,l,[1 2 3 4]);
approx = dbwavf('db4');
cd1 = dbwavf('db4');
cd2 = dbwavf('db4');
cd3 = dbwavf('db4');
cd4= dbwavf('db4');
output = [max(cd1') min(cd1') mean(cd1') std(cd1') max(cd2') min(cd2') mean(cd2') std(cd2') max(cd3') min(cd3') mean(cd3') std(cd3') max(cd4') min(cd4') mean(cd4') std(cd4') max(approx') min(approx') mean(approx') std(approx')];

