from setuptools import setup, Extension
from Cython.Build import cythonize
import numpy as np
import os

# Ensure the target directory exists
if not os.path.exists('../target'):
    os.makedirs('../target')

setup(
    ext_modules=cythonize(
        Extension(
            name="red_envelope",
            sources=["red_envelope.pyx"],
            include_dirs=[np.get_include()],  # Include NumPy headers
        ),
        build_dir="../target",  # Specify the build directory
    ),
    script_args=["build_ext", "--inplace", "--build-lib", "../target"]
)
