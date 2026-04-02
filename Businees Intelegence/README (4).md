# 🌍 World Happiness Report 2019 — Data Warehouse Project

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Google Colab](https://img.shields.io/badge/Google_Colab-F9AB00?style=for-the-badge&logo=googlecolab&logoColor=white)

---

## 📋 Deskripsi Proyek

Proyek ini membangun **Data Warehouse** dengan desain **Star Schema** untuk menganalisis dataset **World Happiness Report 2019** yang mencakup **156 negara** di seluruh dunia.

Proses dimulai dari pembersihan data menggunakan **Google Colab (Python/pandas)**, dilanjutkan membangun Data Warehouse di **PostgreSQL**, dan divisualisasikan menggunakan **Power BI**.

---

## 🎯 Tujuan

- Melakukan proses **ETL** (Extract, Transform, Load) dari data mentah CSV
- Membangun **Data Warehouse** dengan struktur Star Schema di PostgreSQL
- Menganalisis faktor-faktor yang mempengaruhi tingkat kebahagiaan suatu negara
- Membuat **dashboard interaktif** di Power BI untuk visualisasi dan insight

---

## 🛠️ Tools & Teknologi

| Tool | Fungsi |
|------|--------|
| Google Colab (Python) | ETL — Pembersihan & transformasi data |
| PostgreSQL | Data Warehouse — Penyimpanan Star Schema |
| pgAdmin 4 | GUI untuk manajemen database PostgreSQL |
| Power BI Desktop | Visualisasi & dashboard interaktif |
| GitHub | Version control & dokumentasi proyek |

---

## 📁 Struktur Repository

```
world-happiness-2019/
│
├── 📂 data/
│   ├── 📂 raw/
│   │   └── 2019.csv                    # Dataset asli dari Kaggle
│   └── 📂 processed/
│       ├── dim_country.csv             # Dimensi negara (hasil ETL)
│       ├── dim_years.csv               # Dimensi tahun (hasil ETL)
│       └── fact_happiness.csv          # Tabel fakta utama (hasil ETL)
│
├── 📂 notebooks/
│   └── ETL_World_Happiness_2019.ipynb  # Google Colab notebook (ETL)
│
├── 📂 sql/
│   ├── 01_create_tables.sql            # DDL: Buat tabel Star Schema
│   ├── 02_import_data.sql              # Import CSV ke PostgreSQL
│   └── 03_analysis_queries.sql         # Query analisis & laporan
│
├── 📂 powerbi/
│   ├── dashboard.pbix                  # File Power BI
│   └── dashboard_screenshot.png        # Preview dashboard
│
└── README.md                           # Dokumentasi proyek ini
```

---

## 🗄️ Desain Star Schema

```
                    ┌─────────────────┐
                    │   dim_country   │
                    │─────────────────│
                    │ country_id (PK) │
                    │ country_name    │
                    └────────┬────────┘
                             │ FK
                             ▼
┌──────────────┐    ┌─────────────────────┐
│  dim_years   │    │   fact_happiness    │
│──────────────│    │─────────────────────│
│ year_id (PK) │◄───│ fact_id (PK)        │
│ year         │    │ country_id (FK)     │
└──────────────┘    │ year_id (FK)        │
                    │ overall_rank        │
                    │ happiness_score     │
                    │ gdp_per_capita      │
                    │ social_support      │
                    │ life_expectancy     │
                    │ freedom             │
                    │ generosity          │
                    │ corruption          │
                    └─────────────────────┘
```

**Tipe relasi:** `dim_country` → `fact_happiness` (1 : Many)  
**Tipe relasi:** `dim_years` → `fact_happiness` (1 : Many)

---

## ⚙️ Cara Menjalankan Proyek

### 1. Clone Repository
```bash
git clone https://github.com/USERNAME/world-happiness-2019.git
cd world-happiness-2019
```

### 2. ETL di Google Colab
- Buka file `notebooks/ETL_World_Happiness_2019.ipynb` di [Google Colab](https://colab.research.google.com)
- Upload file `data/raw/2019.csv`
- Jalankan semua cell secara berurutan (Shift+Enter)
- Download 3 file hasil: `dim_country.csv`, `dim_years.csv`, `fact_happiness.csv`

### 3. Setup PostgreSQL
```sql
-- Buat database baru di pgAdmin
CREATE DATABASE happiness_dw;

-- Jalankan file SQL secara berurutan:
-- 1. sql/01_create_tables.sql
-- 2. sql/02_import_data.sql
-- 3. sql/03_analysis_queries.sql (untuk analisis)
```

### 4. Buka Power BI
- Buka file `powerbi/dashboard.pbix` menggunakan Power BI Desktop
- Jika diminta koneksi ulang: Get Data → PostgreSQL → `localhost` / `happiness_dw`

---

## 📊 Key Findings

| Metrik | Nilai |
|--------|-------|
| 🏆 Negara Paling Bahagia | Finland (Score: 7.769) |
| 😔 Negara Paling Tidak Bahagia | Afghanistan (Score: 2.567) |
| 🌏 Rata-rata Global | 5.407 |
| 📈 Korelasi GDP vs Happiness | +0.794 (Sangat Kuat) |
| 🤝 Faktor Terkuat | GDP per Capita & Social Support |
| 🇮🇩 Posisi Indonesia | Rank 92 dari 156 |

### Insight Utama:
- **Negara Nordic** (Finland, Denmark, Norway, Iceland, Netherlands) mendominasi Top 5 karena kombinasi GDP tinggi + social support kuat + korupsi rendah
- **GDP per Capita** berkorelasi paling kuat dengan happiness score (+0.794)
- **Social Support** adalah prediktor kebahagiaan yang lebih kuat dari Freedom
- Negara dengan **korupsi tinggi** cenderung memiliki happiness score rendah
- **Asia Tenggara**: Singapore (rank 34) jauh di atas Indonesia (rank 92) dan Philippines (rank 69)

---

## 📸 Preview Dashboard

![Dashboard Power BI](powerbi/dashboard_screenshot.png)

---

## 📚 Sumber Data

- **Dataset:** [World Happiness Report — Kaggle](https://www.kaggle.com/datasets/obaidhere/world-happiness-report)
- **Tahun:** 2019
- **Jumlah Negara:** 156
- **Sumber Survei:** Gallup World Poll (Cantril Ladder)

---

## 👤 Author

**[Nama Kamu]**  
Program Studi: [Jurusan]  
Universitas: [Nama Universitas]  
Tahun: 2025

---

*Proyek ini dibuat sebagai tugas mata kuliah [Nama Mata Kuliah]*
