function J=gethits(accession,N)
J={};
Seqinfo=getgenbank(accession);
Seq=Seqinfo.Sequence;
[requestID,requestTime]=blastncbi(Seq,'blastn');
blast_data=getblast(requestID,'WaitTime',requestTime);
for i=1:N
    J{i}={blast_data.Hits(N).Name};
end
end
    


