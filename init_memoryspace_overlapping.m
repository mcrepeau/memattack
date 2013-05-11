function memoryspace=init_memoryspace_overlapping(N,n,K)

if nargin > 3
    error('Too many input arguments');
elseif nargin < 3
    error('Too few input arguments');
end

memory=zeros(K,N); %Creates an array of dimension K*N and fills it with zeros
r = randi(N-n,1,K); %Generates 1 random integer for the first spot

for i=2:K; %For each variant
    if ((r(1)-(n-1)) < 0)
        r(i) = randi([1, (r(1)+(n-1))],1,1);
    else
        r(i) = randi([(r(1)-(n-1)), (r(1)+(n-1))],1,1);
    end;
end;

for i=1:K; %For each variant
    for j=1:n; %For each continguous memory location
        memory(i,r(i)+j)=1;%We put ones wherever the vulnerable memory is
    end;
end;

memoryspace=memory;