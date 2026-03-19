## RNA-Seq Differential Expression Analysis Pipeline (STAR, edgeR)

This project implements an end-to-end RNA sequencing (RNA-seq) analysis pipeline for gene expression quantification and differential expression analysis between biological conditions. The workflow integrates read preprocessing, alignment, gene-level quantification, normalization, and statistical modeling.

---

## Project Overview

RNA-seq enables transcriptome-wide measurement of gene expression. This pipeline processes raw sequencing reads, quantifies gene expression, and identifies differentially expressed genes between two conditions using statistical methods.

---

## Objectives

- Perform preprocessing and trimming of RNA-seq reads  
- Align reads to reference genome  
- Quantify gene-level expression  
- Normalize expression data  
- Identify differentially expressed genes  
- Visualize sample relationships and expression patterns  

---

## Workflow Summary

### Read Preprocessing

- Trimmed adapter sequences using Cutadapt  
- Applied quality filtering to sequencing reads  

---

### Alignment and Quantification

- Aligned reads to reference genome using STAR  
- Used two-pass alignment for improved splice junction detection  
- Generated:
  - Sorted BAM files  
  - Gene-level count matrices (`ReadsPerGene.out.tab`)  

---

### Data Integration

- Combined gene expression counts across multiple samples  
- Constructed expression matrix:
  - Rows: genes/transcripts  
  - Columns: samples  

---

### Normalization and Filtering

- Created DGEList object using edgeR  
- Calculated counts per million (CPM)  
- Filtered lowly expressed genes  
- Applied normalization factors to account for library size differences  

---

### Exploratory Analysis

- Performed multidimensional scaling (MDS)  
- Visualized sample clustering based on expression profiles  

---

### Dispersion Estimation

- Estimated:
  - Common dispersion  
  - Tagwise dispersion  
  - GLM-based dispersion  

- Visualized dispersion trends using BCV plots  

---

### Differential Expression Analysis

- Performed statistical testing using edgeR exact test  
- Identified significantly differentially expressed genes  
- Applied multiple testing correction (Benjamini–Hochberg)  

---

### Result Visualization

- Generated:
  - MDS plots  
  - BCV plots  
  - Smear plots (log fold change vs expression)  

---

## Technologies Used

- Bash (Unix scripting)  
- SLURM (HPC job scheduling)  
- STAR (RNA-seq aligner)  
- Cutadapt  
- R  
- edgeR  
- baySeq  
- data.table  

---

## Key Features

- End-to-end RNA-seq analysis workflow  
- Integration of alignment and statistical analysis  
- Gene-level expression quantification  
- Differential expression testing  
- Visualization of transcriptomic patterns  

---

## Key Skills Demonstrated

- RNA-seq data analysis  
- Differential gene expression analysis  
- Statistical modeling in R  
- High-throughput data processing  
- Data normalization and filtering  
- Visualization of high-dimensional data  

---

## Notes

- Analysis compares two biological conditions (HBR vs UHR)  
- Low-expression genes are filtered prior to analysis  
- Multiple normalization and dispersion estimation methods are applied  
- Results include both significant and full gene expression outputs  

---

## Author

Lakshita Arunkumar
