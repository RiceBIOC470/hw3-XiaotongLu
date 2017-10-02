function F=closetmatch(accession)
F={};
J={};
AA=[];
BB=[];
Seqinfo=getgenbank(accession);
Seq=Seqinfo.Sequence;
[requestID,requestTime]=blastncbi(Seq,'blastn');
blast_data=getblast(requestID,'WaitTime',requestTime);
[~,N]=size(blast_data.Hits);
for i=1:N
    J{i}={blast_data.Hits(i).Name};
    if ~contains(char(J{i}),'Homo sapiens')&&~contains(char(J{i}),'Human')
      AA=[AA,i];
    else 
     BB=[BB,i];
    end
end
if isempty(BB)
    F=J{AA(1)};
    fprintf('nothing human is found and the closet nonhuman is %s',char(F{1}));
else if isempty(AA)
     F=J{BB(1)};
    fprintf('nothing nonhuman is found and the closet human is %s',char(F{1}));
    else
    F={char(J{AA(1)});char(J{BB(1)})};
    fprintf('the clost human is %s and the closet nonhuman is %s',char(F{2}),char(F{1}));
    end
end
end

