% start audio recording object
Fs = 16000;
nBits = 16;
nChannels = 1;
recObj1 = audiorecorder(Fs, nBits, nChannels); % initialization of the recording object
BlockSize = 1;               % block size duration (in seconds)
record(recObj1, BlockSize);     % start recording
countBlocks = 0;                
nBlocks = 5;                    % number of blocks to record
T1 = cputime;
while (1)    
    T2 = cputime;    
    if T2-T1>BlockSize
        stop(recObj1);                  % stop recording data
        x = getaudiodata(recObj1);      % get the current audio data
        disp(['now i am recording... block no.',mat2str(countBlocks)])
        audiowrite(['output_no000',mat2str(countBlocks),'.wav'],x,Fs)
        T1 = cputime;
        record(recObj1, BlockSize);     % start recording again
        countBlocks = countBlocks + 1;
        if (countBlocks>nBlocks)        % criterion to stop recording
            break  
        end
    end
end
