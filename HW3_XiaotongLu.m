% GB comments
1.	100
2a. 70 fraction of base pair alignment is calculated incorrectly. Your code does not discriminate between correctly paired nucleotides. To correctly achieve that use “shared_bp = length(strfind(align(2,:),’|’));" Then use fraction = shared_bp/length(ERK1)
2b. 70 Same problem as above
2c. 40 Same problem as above and you only calculated for nucleotide sequences. The questions asks you to “align both the coding DNA sequences and protein sequences to the
% human versions.”
3a 100 
3b. 100
3c. 100  	
Overall: 81


%HW3

%% Problem 1 - Smith-Waterman alignment
% Consider two sequences 'GTAATCC' and 'GTATCCG'
% Construct the scoring matrix for this with the parameters:
% match value = 2, mismatch value = -1, and gap penalty = -1. Use your
% solution to get the optimal alignment. If you prefer, it is acceptable to do this with
% pencil and paper, you can then take a snapshot of your solution and
% include it in your repository. 

%Xiaotong Lu
I upload an snapshot of my solution in my repository.


%% Problem 2 - using the NCBI databases and sequence alignments

% Erk proteins are critical signal transducers of MAP kinase signaling.
% Accessions numbers for ERK1 (also called MAPK3) and ERK2 (also called MAPK1) human mRNA are NM_002746 and
% NM_002745, respectively. 

% Part 1. Perform an alignment of the coding DNA sequences of ERK1 and
% ERK2. What fraction of base pairs in ERK1 can align to ERK2? 
%Xiaotong Lu:
ERK1info=getgenbank('NM_002746');
ERK1=ERK1info.Sequence;
ERK2info=getgenbank('NM_002745');
ERK2=ERK2info.Sequence;
[score,align,start]=swalign(ERK1,ERK2,'Alphabet','nt','Showscore',true);
Fraction=length(align)/length(ERK1)
% Part2. Perform an alignment of the aminoacid sequences of ERK1 and ERK2.
% What fraction of amino acids align?
%Xiaotong Lu:
pro1info=getgenpept(ERK1info.CDS.protein_id);
pro1=pro1info.Sequence;
pro2info=getgenpept(ERK2info.CDS.protein_id);
pro2=pro2info.Sequence;
[score2,align2,start2]=swalign(pro1,pro2,'Alphabet','AA','Showscore',true);
Fraction=length(align2)/length(pro1)
% Part 3.  Use the NCBI tools to get mRNA sequences for the mouse genes ERK1 and
% ERK2 and align both the coding DNA sequences and protein sequences to the
% human versions. How similar are they?
%Xiaotong Lu:
mouseERK1info=getgenbank('NM_011952');
mouseERK2info=getgenbank('XM_006522147.3');
mouseERK1=mouseERK1info.Sequence;
mouseERK2=mouseERK2info.Sequence;
[score3,align3,start3]=swalign(mouseERK1,ERK1,'Alphabet','nt','Showscore',true)
Fraction3=length(align3)/length(ERK1)
[score4,align4,start4]=swalign(mouseERK2,ERK2,'Alphabet','nt','Showscore',true)
All length of the ERK1 and ERK2 from mouse can be aligned to that from Human which means they are quite similar to each other.
%% Problem 3: using blast tools programatically

% Part 1. Write a function that takes an NCBI accession number and a number N as input and
% returns a cell array of the accession numbers for the top N blast hits. 
 %Xiaotong Lu
 AccessionNumber=gethits(acession,N);
% Part 2. Write a function that takes an accession number as input, calls your function 
% from part 1, and returns two outputs - the closest scoring match in human DNA/RNA and the
% closest non-human match. Hint: see the "Source" or "SourceOrganism" field in the data
% returned by getgenbank. Make sure your function does something sensible
% if nothing human is found. 
 %Xiaotong Lu:
 Match=closetmatch(accession);
% Part 3. Choose at least one gene from the human genome and one gene from
% another organism and run your code from part 2 on the relevant accession
% numbers. Comment on the results. 
%Xiaotong Lu:
closetmatch('NM_002746');
closetmatch('NM_011952');
closetmatch('XM_016928783.1');
Take the human gene 'NM_002746' as example. When I use the function closetmatch to search the closet nonhuman gene, I get the 
result 'XM_016928783.1'. However, when I input this nonhuman gene back to the function to find the closet human gene, 
I cannot get the same human gene. That is because blast result is not only decided by the homology but also affected by other 
the parameters like length of the gene. So even when we use the human gene to blast the closet nonhuman gene ,it does not means they are the most 
homologous as the result is decided by multiple factors.
