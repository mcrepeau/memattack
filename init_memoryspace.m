function memoryspace=init_memoryspace(N,n,K)

if nargin > 3
    error('Too many input arguments');
elseif nargin < 3
    error('Too few input arguments');
end

memory=zeros(K,N); %Creates an array of dimension K*N and fills it with zeros
r = randi(N-n,1,K); %Generates K random integers, one for each variant
for i=1:K; %For each variant
    for j=1:n; %For each continguous memory location
        memory(i,r(i)+j)=1;%We put ones wherever the vulnerable memory is
    end;
end;

memoryspace=memory;