#!bin/bash -l

#ACCRE specific bioinformatics tools for general use
#TOOL ROOT
# will export the following updated variables:
#CLASSPATH
#PATH
#R_LIBS_USER
#TRIMMOMATIC

#will invoke perlbrew for all perl programs to use perl-5.22 

#DEFINE ToolRoot (TR)
TR=/scratch/vantage_software

#perlbrew
source $TR/perl5/perlbrew/etc/bashrc
perlbrew use 5.22.0

#R_LIBS_USER
R_LIBS_USER=$TR/R/library


#Tools already installed at ACCRE
#loop through all tools to setpkgs -a
for i in plink boost_1.58.0 R_3.2.2_gcc python git
do
	setpkgs -a $i
done

#loop for tools with executables in /bin
for i in samtools bcftools amos salmon rnaSPADES spades EDGE
do
 PATH=$PATH:$TR/$i/bin
done
#loop for tools with executables in base
for i in bowtie fastqc trimmomatic bowtie2 bwa mummer tophat TRAMS faqcs bbmap mothur megahit
do
 PATH=$PATH:$TR/$i
done

#loop for python
for i in htseq
do
 PATH=$PATH:$TR/$i/bin
 PYTHONPATH=$TR/$i/python.2.7/site-packages:$PYTHONPATH
done

#loop for java
for i in picard
do
 PATH=$PATH:$TR/$i
 CLASSPATH=$TR/$i/$i.jar:$CLASSPATH
done

#special snowflakes
export TRIM=$TR/trimmomatic


#Export
export PATH
export CLASSPATH
export R_LIBS_USER
export TRIMMOMATIC
export PYTHONPATH
