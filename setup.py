from setuptools import find_packages, setup

setup(
    name="churn-prediction-mlops",
    version="1.0.0",
    author="Heaven",
    description="Production-ready end-to-end MLOps pipeline for customer churn prediction",
    packages=find_packages(include=["src", "src.*"]),
    python_requires=">=3.10",
)
