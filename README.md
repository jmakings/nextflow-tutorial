# Nextflow Pipelines

A personal repository for learning and developing bioinformatics pipelines using [Nextflow](https://nextflow.io/). Contains tutorial workflows, experiments, and progressively more complex pipelines as I work toward production-grade bioinformatics tooling.

## Goals

- Learn core Nextflow concepts (channels, processes, workflows, configuration)
- Build a simple QC pipeline (FastQC → MultiQC)
- Extend toward a full TCR clonotype analysis pipeline using MiXCR

## Environment Setup

```bash
git clone https://github.com/jmakings/nextflow.git
cd nextflow
conda env create -f environment.yml
conda activate nextflow
```

## Pipelines

| Pipeline | Description | Status |
|----------|-------------|--------|
| FastQC → MultiQC | Read quality control and summary reporting | 🚧 In progress |

## Repository Structure