
# ML on AWS Project

Welcome to my ML on AWS project repository. This project is part of my portfolio and showcases my work in machine learning and cloud computing using AWS. Below you will find an overview of the project, setup instructions, and key features.

## Project Overview

This project demonstrates the integration of machine learning models with AWS services. The main components include data ingestion, processing, and analysis, all hosted on AWS infrastructure. The project uses Postgres for data storage, and various AWS Lambda functions for processing.

## Database Setup

To set up the Postgres database, create the following table:

sql

Copiar código

`CREATE TABLE guardian_posts_analytics (
    author VARCHAR(50),
    timestamp TIMESTAMP WITH TIME ZONE,
    text VARCHAR(300),
    sentiment_score DOUBLE PRECISION,
    PRIMARY KEY(author, timestamp)
);` 

## AWS Lambda Layers

To add necessary Python packages to your Lambda functions, follow these steps:

1.  Go to `Function Overview > Layers > Add a layer`.
    
2.  Under `Choose a layer > Specify an ARN`, add the following ARNs for the required packages:
    
    plaintext
    
    Copiar código
    
    `arn:aws:lambda:eu-central-1:770693421928:layer:Klayers-python38-nltk:47
    arn:aws:lambda:eu-central-1:770693421928:layer:Klayers-python38-pytz:5
    arn:aws:lambda:eu-central-1:770693421928:layer:Klayers-python38-pandas:37` 
    
    If you are in a different region, replace the region name accordingly. If you encounter an error, check the layer's existence by replacing your region in the URL below:
    
    plaintext
    
    Copiar código
    
    `https://api.klayers.cloud/api/v1/layers/latest/{region}/{layer-name}` 
    
    Example:
    
    -   https://api.klayers.cloud/api/v1/layers/latest/us-east-1/pytz
    -   https://api.klayers.cloud/api/v1/layers/latest/us-east-1/nltk

## Local Setup

Although not necessary, it is recommended to set up a local environment for development and testing. Follow these steps to create a virtual environment and install dependencies:

1.  Install Anaconda3 from Anaconda.
    
2.  Start the Anaconda3 PowerShell.
    
3.  Set the environment variables:
    
    powershell
    
    Copiar código
    
    `[Environment]::SetEnvironmentVariable("GUARDIAN_API_KEY", "Your-api-key", "User")
    [Environment]::SetEnvironmentVariable("S3_BUCKET_NAME", "my-guardianpost-analytics-storage", "User")
    [Environment]::SetEnvironmentVariable("DB_PASSWORD", "password", "User")
    [Environment]::SetEnvironmentVariable("DB_HOST", "your-RDS-endpoint", "User")` 
    
4.  Create and activate the virtual environment:
    
    bash
    
    Copiar código
    
    `conda create --name guardianpost_analytics_py38 python=3.8 spyder
    conda activate guardianpost_analytics_py38` 
    
5.  Install necessary packages:
    
    bash
    
    Copiar código
    
    `conda install -c conda-forge poetry
    conda install -c conda-forge notebook` 
    
6.  Install project dependencies:
    
    bash
    
    Copiar código
    
    `poetry install` 
    
7.  Run the local dashboard after setting environmental variables:
    
    bash
    
    Copiar código
    
    `poetry run streamlit run src/app.py` 
    

## Conclusion

Thank you for taking the time to explore my ML on AWS project. This project demonstrates my skills in machine learning, cloud computing, and data analytics. Feel free to explore the code and reach out if you have any questions or feedback.
