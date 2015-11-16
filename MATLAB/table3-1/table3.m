%
%
%Table 3 Sample 1928-2000
disp('.')
disp('.')
disp('.')
disp('----------------------------------------------------')
disp('      mu      gama     R2R      R2        LLF       ')
disp('----------------------------------------------------')
disp('Sample:1928:01-2000:12')
disp('Weekly')
global DailyReturn;
global WeeklyReturn;
global MonthlyReturn;
global BiMonthlyReturn;
global QuarterlyReturn;

load midas;
%Maximising loglikelihood for Rollingwindow

[kappa,y]=fminsearch('loglikelihoodWeekly',[-0.005,-0.01,0.002,2]);

%R square values on realized variance regression


[realV]=realizedVWeekly(DailyReturn);
length=5;
num=numel(DailyReturn);
N=fix((num-251)/length);
new=ones(2,N);
Vmidas=functionmidasWeekly(kappa);
new(2,1:N)=Vmidas(1:N);
[b,bint,r,rint,stats]=regress(realV(fix(252/length)+1:N+fix(251/length))',new');
R2S=stats(1);

%R square values on realized variance regression
[b,bint,r,rint,stats]=regress(WeeklyReturn(fix(252/length)+1:N+fix(251/length)),new');
R2R=stats(1);
disp(sprintf('     %g          %g       %g          %g        %g  ',kappa(3),kappa(4),R2R,R2S,y));
[stderr]=stderr_midasWeekly(kappa);
tstats=kappa./stderr;
disp(sprintf('     [%g]        [%g]  ',tstats(3),tstats(4)));


%Monthly Midas
disp('Monthly');
[kappa,y]=fminsearch('loglikelihoodMonthly',[-0.003,-1,0.005,2]);
[realV]=realizedVMonthly(DailyReturn);
length=22;
num=numel(DailyReturn);
N=fix((num-251)/length);
new=ones(2,N);
Vmidas=functionmidasMonthly(kappa);
new(2,1:N)=Vmidas(1:N);
[b,bint,r,rint,stats]=regress(realV(fix(252/length)+1:N+fix(251/length))',new');
R2S=stats(1);
[b,bint,r,rint,stats]=regress(MonthlyReturn(fix(252/length)+1:N+fix(251/length)),new');
R2R=stats(1);
disp(sprintf('     %g          %g       %g          %g        %g  ',kappa(3),kappa(4),R2R,R2S,y));
[stderr]=stderr_midasMonthly(kappa);
tstats=kappa./stderr;
disp(sprintf('     [%g]        [%g]  ',tstats(3),tstats(4)));


%BiMonthly Midas

disp('BiMonthly');
[kappa,y]=fminsearch('loglikelihoodBiMonthly',[-0.005,-1,0.001,4]);
[realV]=realizedVBiMonthly(DailyReturn);
length=44;
num=numel(DailyReturn);
N=fix((num-251)/length);
new=ones(2,N);
Vmidas=functionmidasBiMonthly(kappa);
new(2,1:N)=Vmidas(1:N);
[b,bint,r,rint,stats]=regress(realV(fix(252/length)+1:N+fix(251/length))',new');
R2S=stats(1);
[b,bint,r,rint,stats]=regress(BiMonthlyReturn(fix(252/length)+1:N+fix(251/length)),new');
R2R=stats(1);
disp(sprintf('     %g          %g       %g          %g        %g  ',kappa(3),kappa(4),R2R,R2S,y));
[stderr]=stderr_midasBiMonthly(kappa);
tstats=kappa./stderr;
disp(sprintf('     [%g]        [%g]  ',tstats(3),tstats(4)));



%Quarterly Midas

disp('Quarterly');
[kappa,y]=fminsearch('loglikelihoodQuarterly',[-0.005,-0.0001,0.001,1]);
[realV]=realizedVQuarterly(DailyReturn);
length=66;
num=numel(DailyReturn);
N=fix((num-251)/length);
new=ones(2,N);
Vmidas=functionmidasQuarterly(kappa);
new(2,1:N)=Vmidas(1:N);
[b,bint,r,rint,stats]=regress(realV(fix(252/length)+1:N+fix(251/length))',new');
R2S=stats(1);
[b,bint,r,rint,stats]=regress(QuarterlyReturn(fix(252/length)+1:N+fix(251/length)),new');
R2R=stats(1);
disp(sprintf('     %g          %g       %g          %g        %g  ',kappa(3),kappa(4),R2R,R2S,y));
[stderr]=stderr_midasQuaterly(kappa);
tstats=kappa./stderr;
disp(sprintf('     [%g]        [%g]  ',tstats(3),tstats(4)));






%first half
%
%
%
%
clear;
global DailyReturn;
global WeeklyReturn;
global MonthlyReturn;
global BiMonthlyReturn;
global QuarterlyReturn;
load midas1;

disp('----------------------------------------------------')
disp('Sample:1928:01-1963:12')
disp('Weekly')

[kappa,y]=fminsearch('loglikelihoodWeekly',[-0.005,-0.01,0.002,2]);
[realV]=realizedVWeekly(DailyReturn);
length=5;
num=numel(DailyReturn);
N=fix((num-251)/length);
new=ones(2,N);
Vmidas=functionmidasWeekly(kappa);
new(2,1:N)=Vmidas(1:N);
[b,bint,r,rint,stats]=regress(realV(fix(252/length)+1:N+fix(251/length))',new');
R2S=stats(1);

%R square values on realized variance regression
[b,bint,r,rint,stats]=regress(WeeklyReturn(fix(252/length)+1:N+fix(251/length)),new');
R2R=stats(1);
disp(sprintf('     %g          %g       %g          %g        %g  ',kappa(3),kappa(4),R2R,R2S,y));
[stderr]=stderr_midasWeekly(kappa);
tstats=kappa./stderr;
disp(sprintf('     [%g]        [%g]  ',tstats(3),tstats(4)));



%Monthly Midas
disp('Monthly');
[kappa,y]=fminsearch('loglikelihoodMonthly',[-0.003,-1,0.005,2]);
[realV]=realizedVMonthly(DailyReturn);
length=22;
num=numel(DailyReturn);
N=fix((num-251)/length);
new=ones(2,N);
Vmidas=functionmidasMonthly(kappa);
new(2,1:N)=Vmidas(1:N);
[b,bint,r,rint,stats]=regress(realV(fix(252/length)+1:N+fix(251/length))',new');
R2S=stats(1);
[b,bint,r,rint,stats]=regress(MonthlyReturn(fix(252/length)+1:N+fix(251/length)),new');
R2R=stats(1);
disp(sprintf('     %g          %g       %g          %g        %g  ',kappa(3),kappa(4),R2R,R2S,y));
[stderr]=stderr_midasMonthly(kappa);
tstats=kappa./stderr;
disp(sprintf('     [%g]        [%g]  ',tstats(3),tstats(4)));



%BiMonthly Midas

disp('BiMonthly');
[kappa,y]=fminsearch('loglikelihoodBiMonthly',[-0.005,-1,0.001,4]);
[realV]=realizedVBiMonthly(DailyReturn);
length=44;
num=numel(DailyReturn);
N=fix((num-251)/length);
new=ones(2,N);
Vmidas=functionmidasBiMonthly(kappa);
new(2,1:N)=Vmidas(1:N);
[b,bint,r,rint,stats]=regress(realV(fix(252/length)+1:N+fix(251/length))',new');
R2S=stats(1);
[b,bint,r,rint,stats]=regress(BiMonthlyReturn(fix(252/length)+1:N+fix(251/length)),new');
R2R=stats(1);
disp(sprintf('     %g          %g       %g          %g        %g  ',kappa(3),kappa(4),R2R,R2S,y));
[stderr]=stderr_midasBiMonthly(kappa);
tstats=kappa./stderr;
disp(sprintf('     [%g]        [%g]  ',tstats(3),tstats(4)));


%Quarterly Midas

disp('Quarterly');
[kappa,y]=fminsearch('loglikelihoodQuarterly',[-0.005,-0.0001,0.001,1]);
[realV]=realizedVQuarterly(DailyReturn);
length=66;
num=numel(DailyReturn);
N=fix((num-251)/length);
new=ones(2,N);
Vmidas=functionmidasQuarterly(kappa);
new(2,1:N)=Vmidas(1:N);
[b,bint,r,rint,stats]=regress(realV(fix(252/length)+1:N+fix(251/length))',new');
R2S=stats(1);
[b,bint,r,rint,stats]=regress(QuarterlyReturn(fix(252/length)+1:N+fix(251/length)),new');
R2R=stats(1);
disp(sprintf('     %g          %g       %g          %g        %g  ',kappa(3),kappa(4),R2R,R2S,y));
[stderr]=stderr_midasQuaterly(kappa);
tstats=kappa./stderr;
disp(sprintf('     [%g]        [%g]  ',tstats(3),tstats(4)));




%second half
%
%
%
%


clear;
global DailyReturn;
global WeeklyReturn;
global MonthlyReturn;
global BiMonthlyReturn;
global QuarterlyReturn;
load midas2;

disp('----------------------------------------------------')
disp('Sample:1964:01-2000:12')
disp('Weekly')

[kappa,y]=fminsearch('loglikelihoodWeekly',[-0.005,-0.01,0.002,2]);
[realV]=realizedVWeekly(DailyReturn);
length=5;
num=numel(DailyReturn);
N=fix((num-251)/length);
new=ones(2,N);
Vmidas=functionmidasWeekly(kappa);
new(2,1:N)=Vmidas(1:N);
[b,bint,r,rint,stats]=regress(realV(fix(252/length)+1:N+fix(251/length))',new');
R2S=stats(1);

%R square values on realized variance regression
[b,bint,r,rint,stats]=regress(WeeklyReturn(fix(252/length)+1:N+fix(251/length)),new');
R2R=stats(1);
disp(sprintf('     %g          %g       %g          %g        %g  ',kappa(3),kappa(4),R2R,R2S,y));
[stderr]=stderr_midasWeekly(kappa);
tstats=kappa./stderr;
disp(sprintf('     [%g]        [%g]  ',tstats(3),tstats(4)));



%Monthly Midas
disp('Monthly');
[kappa,y]=fminsearch('loglikelihoodMonthly',[-0.003,-1,0.005,2]);
[realV]=realizedVMonthly(DailyReturn);
length=22;
num=numel(DailyReturn);
N=fix((num-251)/length);
new=ones(2,N);
Vmidas=functionmidasMonthly(kappa);
new(2,1:N)=Vmidas(1:N);
[b,bint,r,rint,stats]=regress(realV(fix(252/length)+1:N+fix(251/length))',new');
R2S=stats(1);
[b,bint,r,rint,stats]=regress(MonthlyReturn(fix(252/length)+1:N+fix(251/length)),new');
R2R=stats(1);
disp(sprintf('     %g          %g       %g          %g        %g  ',kappa(3),kappa(4),R2R,R2S,y));
[stderr]=stderr_midasMonthly(kappa);
tstats=kappa./stderr;
disp(sprintf('     [%g]        [%g]  ',tstats(3),tstats(4)));


%BiMonthly Midas

disp('BiMonthly');
[kappa,y]=fminsearch('loglikelihoodBiMonthly',[-0.005,-0.0001,0.001,1]);
[realV]=realizedVBiMonthly(DailyReturn);
length=44;
num=numel(DailyReturn);
N=fix((num-251)/length);
new=ones(2,N);
Vmidas=functionmidasBiMonthly(kappa);
new(2,1:N)=Vmidas(1:N);
[b,bint,r,rint,stats]=regress(realV(fix(252/length)+1:N+fix(251/length))',new');
R2S=stats(1);
[b,bint,r,rint,stats]=regress(BiMonthlyReturn(fix(252/length)+1:N+fix(251/length)),new');
R2R=stats(1);
disp(sprintf('     %g          %g       %g          %g        %g  ',kappa(3),kappa(4),R2R,R2S,y));
[stderr]=stderr_midasBiMonthly(kappa);
tstats=kappa./stderr;
disp(sprintf('     [%g]        [%g]  ',tstats(3),tstats(4)));


%Quarterly Midas

disp('Quarterly');
[kappa,y]=fminsearch('loglikelihoodQuarterly',[-0.005,-0.0001,0.001,1]);
[realV]=realizedVQuarterly(DailyReturn);
length=66;
num=numel(DailyReturn);
N=fix((num-251)/length);
new=ones(2,N);
Vmidas=functionmidasQuarterly(kappa);
new(2,1:N)=Vmidas(1:N);
[b,bint,r,rint,stats]=regress(realV(fix(252/length)+1:N+fix(251/length))',new');
R2S=stats(1);
[b,bint,r,rint,stats]=regress(QuarterlyReturn(fix(252/length)+1:N+fix(251/length)),new');
R2R=stats(1);
disp(sprintf('     %g          %g       %g          %g        %g  ',kappa(3),kappa(4),R2R,R2S,y));
[stderr]=stderr_midasQuaterly(kappa);
tstats=kappa./stderr;
disp(sprintf('     [%g]        [%g]  ',tstats(3),tstats(4)));


