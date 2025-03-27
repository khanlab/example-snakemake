import nibabel as nib
import numpy as np

brain_sizes = []
for brain_nii in snakemake.input.brains:
    data = nib.load(brain_nii).get_fdata()
    brain_sizes.append((data != 0).sum())

with open(snakemake.output.txt, "w") as fp:
    fp.write(
        "{avg}".format(avg=np.array(brain_sizes).mean())
    )
