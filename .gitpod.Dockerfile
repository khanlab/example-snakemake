FROM mambaorg/micromamba:latest

# Create env and install packages in one step
RUN micromamba create -y -n snakebids-env -c conda-forge -c bioconda \
    snakemake snakebids python=3.11 && \
    micromamba clean -a -y

# Activate the env by default
ENV MAMBA_DOCKERFILE_ACTIVATE=1
ENV CONDA_DEFAULT_ENV=snakebids-env
ENV PATH=/opt/conda/envs/snakebids-env/bin:$PATH
