load fuzex1trnData.dat
load fuzex1chkData.dat
genOpt = genfisOptions('GridPartition');
genOpt.NumMembershipFunctions =[4];
genOpt.InputMembershipFunctionType = 'gbellmf';
inFIS = genfis(fuzex1trnData(:,1:end-1),fuzex1trnData(:,end),genOpt);
opt = anfisOptions('InitialFIS',inFIS,'EpochNumber',30);
opt.DisplayANFISInformation = 0;
opt.DisplayErrorValues = 0;
opt.DisplayStepSize = 0;
opt.DisplayFinalResults = 0;
opt.ValidationData = fuzex1chkData;
[fis,trainError,stepSize,chkFIS,chkError] = anfis(fuzex1trnData,opt);
x = [1:30];
plot(x,trainError,'.b',x,chkError,'*r')
writeFIS(chkFIS,'ejemplo.fis')