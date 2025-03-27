FROM mambaorg/micromamba:latest

# Create the environment and install required tools
RUN micromamba create -y -n snakebids-env -c conda-forge -c bioconda \
    python=3.11 \
    snakemake \
    snakebids \
    datalad \
    git-annex \
    && micromamba clean -a -y

# Activate the environment by default
ENV MAMBA_DOCKERFILE_ACTIVATE=1
ENV CONDA_DEFAULT_ENV=snakebids-env
ENV PATH=/opt/conda/envs/snakebids-env/bin:$PATH
