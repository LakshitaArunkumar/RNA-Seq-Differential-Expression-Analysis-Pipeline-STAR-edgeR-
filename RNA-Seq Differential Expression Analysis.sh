#!/bin/bash
#SBATCH -M teach
#SBATCH -A hugen2072-2025s
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH -t 3-00:00 # Runtime in D-HH:MM
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=LAA196@pitt.edu
#SBATCH -J run_test
#SBATCH --output=project7_test.out
#SBATCH --cpus-per-task=1 # Request that ncpus be allocated per process.
#SBATCH --mem=64g # Memory pool for all cores (see also --mem-per-cpu)
set -ve
##array should start from zero

# Modules to load
module load cutadapt/2.10
module load fastqc/0.11.7
module load star/2.7.5a
module load gcc/9.2.0

# Creates HBR_Rep1ReadsPerGene.out.tab 
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
-o /ihome/hugen2071-2024f/laa196/project7/HBR_Rep1.trimmed.R1.fastq.gz \
-p /ihome/hugen2071-2024f/laa196/project7/HBR_Rep1.trimmed.R2.fastq.gz \
/ix1/hugen2072-2025s/p7/HBR_Rep1_ERCC-Mix2_Build37-ErccTranscripts-chr22.read1.fastq.gz \
/ix1/hugen2072-2025s/p7/HBR_Rep1_ERCC-Mix2_Build37-ErccTranscripts-chr22.read2.fastq.gz

# Aligning the reads
STAR \
--runMode alignReads \
--outSAMstrandField intronMotif \
--twopassMode Basic \
--readFilesIn /ihome/hugen2071-2024f/laa196/project7/HBR_Rep1.trimmed.R1.fastq.gz \
              /ihome/hugen2071-2024f/laa196/project7/HBR_Rep1.trimmed.R2.fastq.gz \
--outFileNamePrefix /ihome/hugen2071-2024f/laa196/project7/HBR_Rep1 \
--quantMode GeneCounts \
--outStd Log \
--outWigType bedGraph \
--outWigReferencesPrefix ./bedgraph \
--genomeDir /ix1/hugen2072-2025s/p7/STAR_reference/ \
--readFilesCommand zcat \
--outSAMtype BAM SortedByCoordinate


# Creates HBR_Rep2ReadsPerGene.out.tab 
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
-o /ihome/hugen2071-2024f/laa196/project7/HBR_Rep2.trimmed.R1.fastq.gz \
-p /ihome/hugen2071-2024f/laa196/project7/HBR_Rep2.trimmed.R2.fastq.gz \
/ix1/hugen2072-2025s/p7/HBR_Rep2_ERCC-Mix2_Build37-ErccTranscripts-chr22.read1.fastq.gz \
/ix1/hugen2072-2025s/p7/HBR_Rep2_ERCC-Mix2_Build37-ErccTranscripts-chr22.read2.fastq.gz

# Aligning the reads
STAR \
--runMode alignReads \
--outSAMstrandField intronMotif \
--twopassMode Basic \
--readFilesIn /ihome/hugen2071-2024f/laa196/project7/HBR_Rep2.trimmed.R1.fastq.gz \
              /ihome/hugen2071-2024f/laa196/project7/HBR_Rep2.trimmed.R2.fastq.gz \
--outFileNamePrefix /ihome/hugen2071-2024f/laa196/project7/HBR_Rep2 \
--quantMode GeneCounts \
--outStd Log \
--outWigType bedGraph \
--outWigReferencesPrefix ./bedgraph \
--genomeDir /ix1/hugen2072-2025s/p7/STAR_reference/ \
--readFilesCommand zcat \
--outSAMtype BAM SortedByCoordinate


# Creates UHR_Rep1ReadsPerGene.out.tab
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
-o /ihome/hugen2071-2024f/laa196/project7/UHR_Rep1.trimmed.R1.fastq.gz \
-p /ihome/hugen2071-2024f/laa196/project7/UHR_Rep1.trimmed.R2.fastq.gz \
/ix1/hugen2072-2025s/p7/UHR_Rep1_ERCC-Mix1_Build37-ErccTranscripts-chr22.read1.fastq.gz \
/ix1/hugen2072-2025s/p7/UHR_Rep1_ERCC-Mix1_Build37-ErccTranscripts-chr22.read2.fastq.gz


# Aligning the reads
STAR \
--runMode alignReads \
--outSAMstrandField intronMotif \
--twopassMode Basic \
--readFilesIn /ihome/hugen2071-2024f/laa196/project7/UHR_Rep1.trimmed.R1.fastq.gz \
              /ihome/hugen2071-2024f/laa196/project7/UHR_Rep1.trimmed.R2.fastq.gz \
--outFileNamePrefix /ihome/hugen2071-2024f/laa196/project7/UHR_Rep1 \
--quantMode GeneCounts \
--outStd Log \
--outWigType bedGraph \
--outWigReferencesPrefix ./bedgraph \
--genomeDir /ix1/hugen2072-2025s/p7/STAR_reference/ \
--readFilesCommand zcat \
--outSAMtype BAM SortedByCoordinate


# Creates UHR_Rep2ReadsPerGene.out.tab
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
-o /ihome/hugen2071-2024f/laa196/project7/UHR_Rep2.trimmed.R1.fastq.gz \
-p /ihome/hugen2071-2024f/laa196/project7/UHR_Rep2.trimmed.R2.fastq.gz \
/ix1/hugen2072-2025s/p7/UHR_Rep2_ERCC-Mix1_Build37-ErccTranscripts-chr22.read1.fastq.gz \
/ix1/hugen2072-2025s/p7/UHR_Rep2_ERCC-Mix1_Build37-ErccTranscripts-chr22.read2.fastq.gz


# Aligning the reads
STAR \
--runMode alignReads \
--outSAMstrandField intronMotif \
--twopassMode Basic \
--readFilesIn /ihome/hugen2071-2024f/laa196/project7/UHR_Rep2.trimmed.R1.fastq.gz \
              /ihome/hugen2071-2024f/laa196/project7/UHR_Rep2.trimmed.R2.fastq.gz \
--outFileNamePrefix /ihome/hugen2071-2024f/laa196/project7/UHR_Rep2 \
--quantMode GeneCounts \
--outStd Log \
--outWigType bedGraph \
--outWigReferencesPrefix ./bedgraph \
--genomeDir /ix1/hugen2072-2025s/p7/STAR_reference/ \
--readFilesCommand zcat \
--outSAMtype BAM SortedByCoordinate




