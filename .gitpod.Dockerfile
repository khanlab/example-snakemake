FROM mambaorg/micromamba:latest

# Install your packages
RUN micromamba install -y -n snakebids-env -c conda-forge -c bioconda \
    snakemake snakebids python=3.11 \
    && micromamba clean -a -y

ENV PATH /opt/conda/envs/snakebids-env/bin:$PATH
