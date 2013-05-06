function memoryspace=init_memoryspace_nonoverlapping(N,n,K)

if nargin > 3
    error('Too many input arguments');
elseif nargin < 3
    error('Too few input arguments');
end

if (K > floor(N/n) - 1) %Verifies if the number of versions doesn't exceed the possibilities of non-overlaps
    error('The number of versions exceed the possibilities of non-overlaps');
end

flag = 0;
r = linspace(N,N,K);
memory=zeros(K,N); %Creates an array of dimension K*N and fills it with zeros

for i=1:K; %For each variant
    r(i) = randi(N-n,1,1); %Generates a random integer
    while(flag == 1)
        overlapping = 0;
        for l=2:i %After the second random integer is created
            if (((r(i) <= r(l-1)) && (r(i) > (r(l-1) - n))) || ((r(i) >= r(l-1)) && (r(i) < (r(l-1) + n)))) %We check whether this number can overlap with others
                overlapping = 1;
            end
        end;
        if (overlapping == 1)
            r(i) = randi(N-n,1,1);
            flag = 1;
        elseif (overlapping == 0)
            flag = 0;
        end;
    end;
    flag = 1;
end;

for i=1:K; %For each variant  
    for j=1:n; %For each contiguous memory location
        memory(i,r(i)+j)=1;%We put ones wherever the vulnerable memory is
    end;
end;

memoryspace=memory;