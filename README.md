# CommerceStack  

![CI](https://github.com/anav94/commercestack/actions/workflows/ci.yml/badge.svg?branch=main)  
![License](https://img.shields.io/github/license/anav94/commercestack)  
![Issues](https://img.shields.io/github/issues/anav94/commercestack)  
![Stars](https://img.shields.io/github/stars/anav94/commercestack)  
![Last Commit](https://img.shields.io/github/last-commit/anav94/commercestack)  

🔗 **Live Demo:** [CommerceStack Dashboard](https://commercestack-y2vphksure7fh4ewgxeiwr.streamlit.app)  

📊 **Dataset:** [Brazilian E-Commerce Public Dataset (Kaggle)](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)  

---

## 🚀 Overview  
CommerceStack is a **modern analytics stack** that transforms raw Brazilian e-commerce data into **decision-ready dashboards**.  
It demonstrates how to design a **production-grade ELT pipeline** using dbt + DuckDB and serve insights via Streamlit.  

---

## ✨ Features  
- **End-to-end ELT**: Raw → staging → marts using **dbt**.  
- **Analytics-ready models**: Fact + dimension tables for orders, payments, products, customers.  
- **KPI dashboards**: Weekly revenue, retention cohorts, payment method trends.  
- **Data quality & testing**: Integrated **Great Expectations** for schema, null, and range checks.  
- **Lightweight deployment**: Runs locally with DuckDB (no heavy infra).  
- **Automated builds**: dbt seeds/models triggered on deploy.  

---

## 🏗️ Architecture  
```mermaid
graph TD
    A[Raw Kaggle Data] -->|dbt seeds| B[Staging Models]
    B --> C[Mart Models]
    C --> D[DuckDB Warehouse]
    D --> E[Streamlit Dashboard]
    C --> F[Great Expectations Checks]
