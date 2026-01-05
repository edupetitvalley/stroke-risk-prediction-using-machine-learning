# 🧠 Stroke Risk Prediction Using Machine Learning

## 🔗 Live Demo
Try the interactive Shiny app here:  
https://eduardo-vallejo.shinyapps.io/stroke-prediction/

---

## 📘 Overview

This project builds an end‑to‑end **clinical prediction model** for estimating stroke risk using real‑world patient variables.  
The goal is to create a **transparent**, **interpretable**, and **clinically meaningful** tool that avoids the pitfalls of black‑box modeling.

The final model is deployed as an interactive **Shiny app**, allowing users to input patient characteristics and instantly view predicted risk.

---

## 🎯 Objectives

- Model non‑linear clinical relationships using **restricted cubic splines**  
- Build a **reproducible ML pipeline** in R  
- Deploy a **real‑time prediction tool** using Shiny  
- Provide a clean, well‑documented GitHub repository  
- Emphasize interpretability and clinical relevance  

---

## 🧩 Key Features

### 🔍 1. Non‑linear modeling with splines  
Clinical variables rarely behave linearly.  
This project uses **restricted cubic splines** to capture realistic patterns in:

- Age  
- Glucose levels  
- BMI  
- Other continuous predictors  

This improves accuracy while preserving interpretability.

### 🧪 2. Reproducible ML pipeline  
The workflow includes:

- Data cleaning  
- Feature engineering  
- Spline transformation  
- Model training  
- Validation  
- Packaging for deployment  

All steps are fully reproducible.

### 🖥️ 3. Interactive Shiny app  
The app provides:

- Real‑time predictions  
- Clean UI  
- Instant feedback  
- A model that updates based on user inputs  

### 📦 4. Deployment  
The model is deployed on **shinyapps.io**, making it accessible to anyone without installing R.

---

## 📁 Repository Structure

