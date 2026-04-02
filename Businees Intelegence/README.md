<div align="center">

#  World Happiness Report 2019
### Data Warehouse & Business Intelligence Project

<br>

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Google Colab](https://img.shields.io/badge/Google_Colab-F9AB00?style=for-the-badge&logo=googlecolab&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)

<br>

> Membangun **Data Warehouse** dengan desain **Star Schema** untuk menganalisis tingkat kebahagiaan **156 negara** di seluruh dunia menggunakan dataset World Happiness Report 2019.

<br>

---

## 👥 Kelompok 22

| No | Nama | NIM |
|:---:|:---|:---:|
| 1 | Deny Candra Kasuma | 2409116024 |
| 2 | Franklyn Galvin Lodo | 2409116047 |
| 3 | Muhammad Faros Anand | 2409116085 |
| 4 | Muhamad Irpan Santoso | 2409116119 |

**Program Studi Sistem Informasi — Universitas Mulawarman**
**Mata Kuliah: Business Intelligence — 2026**

---

</div>

## 📌 Daftar Isi

- [Deskripsi Proyek](#-deskripsi-proyek)
- [Tools & Teknologi](#-tools--teknologi)
- [Struktur Repository](#-struktur-repository)
- [Desain Star Schema](#-desain-star-schema)
- [Alur Proses ETL](#-alur-proses-etl)
- [Cara Menjalankan](#-cara-menjalankan-proyek)
- [Key Findings & Statistik](#-key-findings--statistik)
- [Analisis Chart & Insight](#-analisis-chart--insight)
- [Preview Dashboard](#-preview-dashboard)
- [Sumber Data](#-sumber-data)

---

## 📋 Deskripsi Proyek

Proyek ini merupakan tugas mata kuliah **Business Intelligence** yang bertujuan membangun sistem analitik end-to-end — mulai dari pengolahan data mentah hingga visualisasi interaktif — menggunakan dataset **World Happiness Report 2019** yang mencakup **156 negara** di seluruh dunia.

| Tahap | Proses | Tool |
|:---:|---|:---:|
| **1. ETL** | Extract → Transform → Load data CSV | Google Colab (Python) |
| **2. Data Warehouse** | Membangun Star Schema & query analisis | PostgreSQL |
| **3. Visualisasi** | Dashboard interaktif & business insight | Power BI |

---

## 🛠️ Tools & Teknologi

<table>
  <tr>
    <th align="center">Tool</th>
    <th>Fungsi dalam Proyek</th>
  </tr>
  <tr>
    <td align="center"><b>🐍 Google Colab</b></td>
    <td>Proses ETL: pembersihan data, transformasi kolom, dan pembuatan tabel dimensi & fakta menggunakan Python/pandas</td>
  </tr>
  <tr>
    <td align="center"><b>🐘 PostgreSQL</b></td>
    <td>Data Warehouse dengan desain Star Schema — penyimpanan terstruktur dan query analitik SQL</td>
  </tr>
  <tr>
    <td align="center"><b>🖥️ pgAdmin 4</b></td>
    <td>GUI untuk manajemen database PostgreSQL, import data CSV, dan eksekusi query</td>
  </tr>
  <tr>
    <td align="center"><b>📊 Power BI Desktop</b></td>
    <td>Visualisasi data interaktif, pembuatan dashboard, dan penyajian insight bisnis</td>
  </tr>
  <tr>
    <td align="center"><b>🐙 GitHub</b></td>
    <td>Version control, dokumentasi proyek, dan kolaborasi antar anggota tim</td>
  </tr>
</table>

---

## 📁 Struktur Repository

```
📦 world-happiness-2019/
│
├── 📂 data/
│   ├── 📂 raw/
│   │   └── 📄 2019.csv                      ← Dataset asli dari Kaggle
│   └── 📂 processed/
│       ├── 📄 dim_country.csv               ← Dimensi negara (hasil ETL)
│       ├── 📄 dim_years.csv                 ← Dimensi tahun (hasil ETL)
│       └── 📄 fact_happiness.csv            ← Tabel fakta utama (hasil ETL)
│
├── 📂 notebooks/
│   └── 📓 ETL_World_Happiness_2019.ipynb   ← Google Colab notebook
│
├── 📂 sql/
│   ├── 📄 01_create_tables.sql              ← DDL: Buat tabel Star Schema
│   ├── 📄 02_import_data.sql                ← Import CSV ke PostgreSQL
│   └── 📄 03_analysis_queries.sql           ← Query analisis & laporan
│
├── 📂 powerbi/
│   ├── 📊 dashboard.pbix                    ← File Power BI
│   └── 🖼️  dashboard_screenshot.png         ← Preview dashboard
│
└── 📄 README.md                             ← Dokumentasi proyek ini
```

---

## 🗄️ Desain Star Schema

Arsitektur Data Warehouse menggunakan **Star Schema** dengan **1 tabel fakta** dan **2 tabel dimensi**:

```
                      ┌──────────────────────┐
                      │     dim_country      │
                      │──────────────────────│
                      │  country_id  (PK)    │
                      │  country_name        │
                      └──────────┬───────────┘
                                 │  1 : Many
                                 ▼
  ┌─────────────────┐   ┌─────────────────────────┐
  │   dim_years     │   │      fact_happiness     │
  │─────────────────│   │─────────────────────────│
  │ year_id  (PK)   │◄──│  fact_id       (PK)     │
  │ year            │   │  country_id    (FK)     │
  └─────────────────┘   │  year_id        (FK)    │
        1 : Many        │  overall_rank           │
                        │  happiness_score        │
                        │  gdp_per_capita         │
                        │  social_support         │
                        │  life_expectancy        │
                        │  freedom                │
                        │  generosity             │
                        │  corruption             │
                        └─────────────────────────┘
```

| Tabel | Tipe | Baris | Keterangan |
|---|:---:|:---:|---|
| `fact_happiness` |  FACT | 156 | Tabel utama berisi seluruh metrik kebahagiaan |
| `dim_country` | DIMENSION | 156 | Master data seluruh negara |
| `dim_years` |  DIMENSION | 1 | Master data tahun (2019) |

---

## 🔄 Alur Proses ETL

```
  ┌──────────────────┐     ┌────────────────────┐     ┌──────────────────────┐
  │    1. EXTRACT    │───▶│   2. TRANSFORM    │───▶ │      3. LOAD         │
  │──────────────────│     │────────────────────│     │──────────────────────│
  │ • Download CSV   │     │ • Standarisasi     │     │ • dim_country.csv    │
  │   dari Kaggle    │     │   nama kolom       │     │ • dim_years.csv      │
  │ • Upload ke      │     │ • Hapus duplikat   │     │ • fact_happiness.csv │
  │   Google Colab   │     │ • Handle missing   │     │ • Import ke          │
  │                  │     │ • Buat tabel       │     │   PostgreSQL via     │
  │                  │     │   dim & fact       │     │   pgAdmin 4          │
  └──────────────────┘     └────────────────────┘     └──────────────────────┘
         Kaggle                 Google Colab                  pgAdmin 4
```

---

## ⚙️ Cara Menjalankan Proyek

### 1️⃣ Clone Repository

```bash
git clone https://github.com/USERNAME/world-happiness-2019.git
cd world-happiness-2019
```

### 2️⃣ ETL di Google Colab

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1RSRBwUz-hY84-fIizhZfe2DAifAulMjk)

> Klik badge di atas untuk langsung membuka notebook ETL di Google Colab.

```
1. Buka link Google Colab di atas
2. Upload file data/raw/2019.csv ke sesi Colab
3. Jalankan semua cell → Runtime → Run All  (Ctrl+F9)
4. Download 3 file hasil:
   - dim_country.csv
   - dim_years.csv
   - fact_happiness.csv
```

### 3️⃣ Setup Database PostgreSQL

```sql
-- Buat database baru di pgAdmin
CREATE DATABASE happiness_dw;

-- Jalankan file SQL secara BERURUTAN di Query Tool pgAdmin:
-- Step 1 → sql/01_create_tables.sql   (buat struktur tabel Star Schema)
-- Step 2 → sql/02_import_data.sql     (import data dari CSV)
-- Step 3 → sql/03_analysis_queries.sql (jalankan query analisis)
```

### 4️⃣ Buka Dashboard Power BI

```
1. Buka file powerbi/dashboard.pbix di Power BI Desktop
2. Jika diminta reconnect → Get Data → PostgreSQL
   ├── Server   : localhost
   └── Database : happiness_dw
3. Klik Load → Dashboard siap digunakan
```

---

## 📊 Key Findings & Statistik

<div align="center">

| Metrik | Hasil |
|:---|:---|
| 🏆 **Negara Paling Bahagia** | Finland — Score: **7.769** |
| 😔 **Negara Paling Tidak Bahagia** | Afghanistan — Score: **2.567** |
| 🌏 **Rata-rata Skor Global** | **5.407** dari skala 10 |
| 📈 **Korelasi Terkuat** | GDP per Capita vs Score: **r = +0.794** |
| 🤝 **Faktor Paling Berpengaruh** | GDP per Capita & Social Support |
| 🇮🇩 **Posisi Indonesia** | Rank **92** dari 156 negara |
| 🌏 **Posisi Malaysia** | Rank **80** dari 156 negara |
| 🇸🇬 **Posisi Singapore** | Rank **34** dari 156 negara |

</div>

---

## 📸 Analisis Chart & Insight

### 📊 Chart 1 — Happiness Score & Ranking Global

<img width="1236" height="696" alt="Chart 1 - Happiness Score Ranking" src="https://github.com/user-attachments/assets/d290d2d5-f5cc-47b5-8c60-4d1f917e4357" />

**💡 Insight:**
> Finland menempati posisi pertama dengan skor **7.769**, diikuti Denmark **(7.600)** dan Norway **(7.554)**. Kelima besar didominasi oleh negara-negara **Nordic** yang dikenal memiliki sistem kesejahteraan sosial kuat, transparansi pemerintahan tinggi, dan GDP per kapita yang besar. Afghanistan berada di posisi paling bawah **(2.567)** akibat konflik berkepanjangan yang merusak seluruh aspek kehidupan masyarakat.

---

### 📊 Chart 2 — Kontribusi GDP per Capita terhadap Kebahagiaan

<img width="1239" height="696" alt="Chart 2 - GDP per Capita" src="https://github.com/user-attachments/assets/fd482c48-899d-4df4-839d-49745deb87b7" />

**💡 Insight:**
> GDP per Capita memiliki korelasi **paling kuat** terhadap Happiness Score dengan nilai **r = +0.794**. Hal ini menunjukkan bahwa kesejahteraan ekonomi adalah fondasi utama kebahagiaan — negara dengan pendapatan per kapita tinggi mampu menyediakan akses pendidikan, kesehatan, dan infrastruktur yang lebih baik bagi warganya. Namun perlu dicatat, GDP bukan satu-satunya penentu — Qatar memiliki GDP sangat tinggi tetapi tidak masuk Top 20 karena nilai freedom dan social support yang rendah.

---

### 📊 Chart 3 — Peran Social Support & Life Expectancy

<img width="1238" height="696" alt="Chart 3 - Social Support" src="https://github.com/user-attachments/assets/a43bc428-3ec2-4771-aa98-2fbff188c1c4" />

**💡 Insight:**
> **Social Support** — diukur dari pertanyaan *"apakah kamu memiliki seseorang yang bisa diandalkan saat dalam kesulitan?"* — terbukti menjadi prediktor kebahagiaan yang lebih kuat dibandingkan Freedom. Negara dengan jaringan sosial erat dan sistem kesehatan berkualitas (Life Expectancy tinggi) secara konsisten memiliki skor yang lebih tinggi. Ini membuktikan bahwa koneksi antar manusia sama pentingnya dengan kondisi ekonomi dalam menentukan kebahagiaan.

---

### 📊 Chart 4 — Dampak Freedom & Persepsi Korupsi

<img width="1237" height="696" alt="Chart 4 - Freedom and Corruption" src="https://github.com/user-attachments/assets/50b73575-04c4-49e7-a3f3-891115ca94a9" />

**💡 Insight:**
> Negara dengan tingkat **korupsi persepsi rendah** (kepercayaan tinggi kepada pemerintah) cenderung memiliki happiness score yang lebih tinggi. Denmark dan Finland secara konsisten menjadi negara paling bersih dari korupsi sekaligus paling bahagia. Sebaliknya, negara seperti Venezuela dan Lebanon yang memiliki persepsi korupsi sangat tinggi justru berada di bawah rata-rata global. **Freedom to make life choices** juga berkorelasi positif — kebebasan individu memberikan rasa kontrol atas hidup yang meningkatkan kebahagiaan.

---

### 📊 Chart 5 — Perbandingan Regional & Posisi Asia Tenggara

<img width="1236" height="691" alt="Chart 5 - Regional Comparison" src="https://github.com/user-attachments/assets/dfdc3808-99a4-4a32-88d7-faa90f630c5d" />

**💡 Insight:**
> Di tingkat regional, **Western Europe** mendominasi dengan rata-rata skor tertinggi, sementara **Sub-Saharan Africa** mencatat skor terendah karena tantangan kemiskinan dan ketidakstabilan politik. Dalam konteks **Asia Tenggara**, terdapat gap yang signifikan: Singapore berada di rank **34** berkat GDP tinggi dan tata kelola pemerintahan yang baik, sementara Indonesia di rank **92** dan Philippines di rank **69**. Gap ini mencerminkan perbedaan kualitas institusi, akses layanan publik, dan tingkat pendapatan antar negara kawasan.

---

## 📸 Preview Dashboard Power BI

<img width="1190" height="668" alt="Power BI Dashboard - World Happiness Report 2019" src="https://github.com/user-attachments/assets/6cbd4abe-ee54-4aad-ab44-d902e8dce9b7" />

> Dashboard interaktif yang memungkinkan eksplorasi data kebahagiaan global secara dinamis — filter per negara, region, dan faktor kebahagiaan.

---

## 📚 Sumber Data

| Item | Detail |
|---|---|
| 📦 **Dataset** | [World Happiness Report 2019 — Kaggle](https://www.kaggle.com/datasets/obaidhere/world-happiness-report?select=2019.csv) |
| 📓 **Notebook ETL** | [Google Colab — ETL World Happiness 2019](https://colab.research.google.com/drive/1RSRBwUz-hY84-fIizhZfe2DAifAulMjk) |
| 📅 **Tahun Data** | 2019 |
| 🌍 **Jumlah Negara** | 156 negara |

---

<div align="center">

*© 2026 Kelompok 22 — Program Studi Sistem Informasi, Universitas Mulawarman*

</div>
