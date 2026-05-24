# 📁 Project Structure Documentation

## Complete Project Overview

```
Origin-Basketball-Tournament-Analytics/
│
├── 📋 Documentation Files
│   ├── README.md                              # Main project documentation
│   ├── SETUP_GUIDE.md                         # Installation & setup instructions
│   ├── PROJECT_STRUCTURE.md                   # This file
│   ├── CONTRIBUTING.md                        # Contributing guidelines
│   ├── LICENSE                                # MIT License
│   └── .gitignore                             # Git ignore patterns
│
├── 🗄️ Database Files
│   └── Origin-Basketball-Tournament-database.sql    # Complete MySQL database dump
│
├── 📊 Power BI Files
│   └── origin_Tournament_2024_Analytics.pbix         # Power BI Dashboard
│
├── 📸 Screenshot Gallery
│   └── Screenshots/
│       ├── Tournament_overview.png            # Dashboard page 1
│       ├── FInancial_summary_page.png         # Dashboard page 2
│       ├── Team_&_player_performance_page.png # Dashboard page 3
│       └── relationships_of_tables.png        # Database ER diagram
│
└── 📚 Data References
    └── real_data_based_on(extracted from)/   # Original data sources
```

---

## 📄 File Descriptions

### Documentation Files

#### **README.md**
- **Purpose:** Main project entry point
- **Contains:**
  - Project overview & objectives
  - Technologies used
  - Quick start guide
  - Database schema overview
  - Dashboard features
  - FAQ section
  - Future enhancements
- **Audience:** All users (developers, managers, stakeholders)
- **When to Read:** First file to start
- **Size:** ~500 lines

#### **SETUP_GUIDE.md**
- **Purpose:** Step-by-step installation guide
- **Contains:**
  - Prerequisites & requirements
  - MySQL server setup (Windows/macOS/Linux)
  - Database import procedures
  - Power BI connection steps
  - Verification procedures
  - Troubleshooting section
  - Quick reference commands
- **Audience:** Anyone setting up the project
- **When to Read:** Before running project
- **Time:** 15-30 minutes to complete
- **Difficulty:** Beginner to Intermediate

#### **PROJECT_STRUCTURE.md**
- **Purpose:** Detailed file & structure documentation
- **Contains:**
  - File-by-file descriptions
  - Database table documentation
  - Power BI dashboard breakdown
  - Data relationships
  - Field descriptions
- **Audience:** Developers & data analysts
- **When to Read:** When understanding project architecture
- **Technical Level:** Intermediate

#### **CONTRIBUTING.md**
- **Purpose:** Guidelines for contributing
- **Contains:**
  - Contribution process
  - Code standards
  - Pull request template
  - Issue reporting
  - Development guidelines
- **Audience:** Contributors & developers
- **When to Read:** Before making contributions
- **Required:** Yes, for GitHub collaboration

#### **LICENSE**
- **Type:** MIT License
- **Purpose:** Legal rights & usage terms
- **Allows:** Commercial use, modification, private use
- **Requires:** License inclusion, liability disclaimers
- **Audience:** Legal/license verification
- **Mandatory:** Yes, for GitHub

#### **.gitignore**
- **Purpose:** Exclude files from Git tracking
- **Contains:**
  - Local configuration files
  - IDE-specific files
  - OS-specific files
  - Credentials & secrets
  - Build artifacts
- **Audience:** Developers using Git
- **Examples:**
  ```
  # IDE files
  .vscode/
  .idea/
  *.swp
  *.swo
  
  # OS files
  .DS_Store
  Thumbs.db
  
  # Local config
  config.local.json
  .env
  
  # Credentials
  *.key
  *.pem
  secrets.*
  ```

---

## 🗄️ Database File

### **Origin-Basketball-Tournament-database.sql**

**Type:** MySQL Database Dump  
**Size:** ~500-800 KB  
**Format:** SQL Script  
**MySQL Version:** 8.0.42+

**Contents:**
- Complete database schema (14 tables)
- All table relationships (foreign keys)
- Sample/real tournament data
- Indexes & constraints
- Views (if any)

**Table Summary:**

| # | Table Name | Purpose | Records |
|---|------------|---------|---------|
| 1 | gender_categories | Gender classifications | 2 |
| 2 | teams | Team information | 4 |
| 3 | player_positions | Basketball positions | 5 |
| 4 | players | Player details | 48 |
| 5 | match_stages | Tournament stages | 3 |
| 6 | matches | Match scheduling | 24 |
| 7 | match_results | Match outcomes | 24 |
| 8 | player_match_stats | Player performance | 200+ |
| 9 | award_categories | Award types | 14 |
| 10 | sponsors | Sponsor info | 2+ |
| 11 | awards | Award definitions | 28 |
| 12 | award_winners | Award distribution | 28 |
| 13 | donations | Sponsor donations | 2+ |
| 14 | expenses | Tournament expenses | 4+ |

**Usage:**
```bash
# Import
mysql -u root -p < Origin-Basketball-Tournament-database.sql

# Export (backup)
mysqldump -u root -p origin_basketball_db > backup.sql

# Size estimate: ~1-2 MB
```

**Contains:**
- ✅ All schema definitions
- ✅ Primary & foreign keys
- ✅ UNIQUE constraints
- ✅ Indexes for performance
- ✅ Real tournament data
- ✅ Referential integrity
- ✅ No sensitive data

---

## 📊 Power BI File

### **origin_Tournament_2024_Analytics.pbix**

**Type:** Power BI Desktop Report  
**Format:** Binary (PBIX)  
**Power BI Version:** Latest (2024+)  
**File Size:** ~10-50 MB  
**Compatibility:** Windows/Web

**Contains:**
- 3 interactive dashboard pages
- 14 data tables (linked to MySQL)
- 20+ DAX measures
- 30+ visualizations
- Dynamic filtering with slicers

**Dashboard Pages:**

#### Page 1: Tournament Overview
- KPI cards with key metrics
- Tournament summary statistics
- Gender distribution breakdown
- Match stage distribution
- Quick performance indicators

#### Page 2: Financial Summary
- Donation tracking by sponsor
- Expense breakdown by category
- Net balance calculation
- Financial trends analysis
- Budget vs actual comparison

#### Page 3: Team & Player Performance
- Player statistics leaderboard
- Top scorers ranking
- Assists & rebounds tracking
- Position-wise analysis
- Team performance metrics

**DAX Measures Included:**
```
Total Matches
Total Teams
Total Players
Total Awards
Average Team Size
Total Donations
Total Expenses
Net Balance
Points per Match (Average)
Playing Time (Total)
```

**Filters (Slicers) Available:**
- Gender Category
- Team Selection
- Match Stage
- Date Range
- Award Category

**Features:**
- ✅ Real-time filtering
- ✅ Cross-table filtering
- ✅ Dynamic calculations
- ✅ Responsive design
- ✅ Export capabilities
- ✅ Interactive tooltips

**Usage:**
1. Open file in Power BI Desktop
2. Configure MySQL connection
3. Refresh data
4. Explore dashboards
5. Use slicers to filter
6. Export or publish reports

---

## 📸 Screenshots Folder

### **Screenshots/**

Purpose: Visual documentation of dashboards

#### 1. Tournament_overview.png
- **Shows:** Dashboard page 1
- **Contains:** Overview page layout
- **Use:** Documentation, presentations

#### 2. FInancial_summary_page.png
- **Shows:** Dashboard page 2
- **Contains:** Financial data visualizations
- **Use:** Financial reporting

#### 3. Team_&_player_performance_page.png
- **Shows:** Dashboard page 3
- **Contains:** Performance metrics
- **Use:** Performance analysis

#### 4. relationships_of_tables.png
- **Shows:** Database ER diagram
- **Contains:** Table relationships
- **Use:** Schema documentation

**Resolution:** 1920x1080+ (Full HD)  
**Format:** PNG  
**Size:** ~50-200 KB each  
**Quality:** High resolution for clarity

---

## 📚 Real Data References

### **real_data_based_on(extracted from)/**

**Purpose:** Document data sources  
**Contains:** Original data references  
**Usage:** Understanding data origin

**Information Stored:**
- Source spreadsheets
- Data collection notes
- Verification records
- Data cleaning procedures
- Original vs processed data comparison

---

## 🔗 Database Schema Details

### Table Relationships Map

```
┌─────────────────────────────────────┐
│    REFERENCE TABLES (Lookups)      │
├─────────────────────────────────────┤
│ • gender_categories                 │
│ • player_positions                  │
│ • match_stages                      │
│ • award_categories                  │
│ • sponsors                          │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│    MASTER TABLES (Core Entities)   │
├─────────────────────────────────────┤
│ • teams (linked: gender)            │
│ • players (linked: teams, positions)│
│ • matches (linked: teams, gender)   │
│ • awards (linked: categories)       │
│ • donations (linked: sponsors)      │
│ • expenses                          │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│    TRANSACTION TABLES (Records)    │
├─────────────────────────────────────┤
│ • match_results (linked: matches)   │
│ • player_match_stats (linked: players, matches) │
│ • award_winners (linked: awards, players) │
└─────────────────────────────────────┘
```

### Key Relationships

1. **Gender → Teams**
   - One gender has many teams
   - Enforces Boys/Girls segregation

2. **Teams → Players**
   - One team has 12 players
   - Players belong to one team

3. **Players → Player_Match_Stats**
   - One player has many match statistics
   - One match has many player stats

4. **Matches → Match_Results**
   - One match has one result
   - Result contains scores & winner

5. **Awards → Award_Winners**
   - One award given to one player
   - Each player can win multiple awards

6. **Sponsors → Donations**
   - One sponsor makes multiple donations
   - Each donation is tracked separately

---

## 🔑 Key Fields by Table

### GENDER_CATEGORIES
```
gender_id (PK) → INT AUTO_INCREMENT
gender_name    → VARCHAR(50) UNIQUE
```

### TEAMS
```
team_id (PK)    → INT AUTO_INCREMENT
team_name       → VARCHAR(100)
gender_id (FK)  → INT (references gender_categories)
```

### PLAYERS
```
player_id (PK)      → INT AUTO_INCREMENT
player_name         → VARCHAR(100)
jersey_no           → INT
team_id (FK)        → INT (references teams)
position_id (FK)    → INT (references player_positions)
```

### MATCHES
```
match_id (PK)       → INT AUTO_INCREMENT
match_date          → DATE
match_time          → TIME
team1_id (FK)       → INT (references teams)
team2_id (FK)       → INT (references teams)
stage_id (FK)       → INT (references match_stages)
gender_id (FK)      → INT (references gender_categories)
```

### PLAYER_MATCH_STATS
```
stat_id (PK)        → INT AUTO_INCREMENT
match_id (FK)       → INT (references matches)
player_id (FK)      → INT (references players)
points              → INT (0-60)
rebounds            → INT (0-20)
assists             → INT (0-15)
steals              → INT (0-10)
blocks              → INT (0-10)
minutes             → INT (0-40)
```

### DONATIONS
```
donation_id (PK)    → INT AUTO_INCREMENT
sponsor_id (FK)     → INT (references sponsors)
amount              → DECIMAL(10,2)
tournament_id       → INT
```

### EXPENSES
```
expense_id (PK)     → INT AUTO_INCREMENT
expense_category    → VARCHAR(100)
amount              → DECIMAL(10,2)
tournament_id       → INT
```

### AWARDS
```
award_id (PK)           → INT AUTO_INCREMENT
category_id (FK)        → INT (references award_categories)
gender_id (FK)          → INT (references gender_categories)
sponsor_id (FK)         → INT (references sponsors)
tournament_id           → INT
```

### AWARD_WINNERS
```
award_winner_id (PK)    → INT AUTO_INCREMENT
award_id (FK)           → INT (references awards)
player_id (FK)          → INT (references players)
```

---

## 📊 Power BI Data Model

### Star Schema Design

```
FACT TABLES:
├── player_match_stats ⭐
├── award_winners ⭐
├── match_results ⭐
├── donations ⭐
└── expenses ⭐

DIMENSION TABLES:
├── players ◇
├── teams ◇
├── matches ◇
├── awards ◇
├── gender_categories ◇
├── sponsors ◇
└── match_stages ◇
```

### Measures Created

```DAX
Total Matches = COUNT(matches[match_id])
Total Teams = DISTINCTCOUNT(teams[team_id])
Total Players = DISTINCTCOUNT(players[player_id])
Total Awards = COUNTA(award_winners[award_winner_id])

Total Donations = SUM(donations[amount])
Total Expenses = SUM(expenses[amount])
Net Balance = [Total Donations] - [Total Expenses]

Average Points per Player = AVERAGE(player_match_stats[points])
Total Points = SUM(player_match_stats[points])

Boys Teams = CALCULATE([Total Teams], gender_categories[gender_name]="Boys")
Girls Teams = CALCULATE([Total Teams], gender_categories[gender_name]="Girls")
```

---

## 🔄 Data Flow

```
1. REAL TOURNAMENT DATA
   ↓
2. MANUAL DATA COLLECTION
   ├─ Team information
   ├─ Player details
   ├─ Match results
   ├─ Statistics
   └─ Financial data
   ↓
3. DATABASE NORMALIZATION
   ├─ Remove duplicates
   ├─ Enforce relationships
   ├─ Validate integrity
   └─ Create indexes
   ↓
4. MYSQL STORAGE
   └─ All data in origin_basketball_db
   ↓
5. POWER BI CONNECTION
   ├─ Connect to MySQL
   ├─ Load all tables
   └─ Build relationships
   ↓
6. DAX CALCULATIONS
   ├─ Create measures
   ├─ Build hierarchies
   └─ Set up filters
   ↓
7. DASHBOARD CREATION
   ├─ Create visualizations
   ├─ Add interactivity
   └─ Add slicers
   ↓
8. USER EXPLORATION
   └─ Analyze data via dashboards
```

---

## 📈 Sample Data Statistics

| Entity | Count | Details |
|--------|-------|---------|
| Gender Categories | 2 | Boys, Girls |
| Teams | 4 | 2 Boys + 2 Girls |
| Players | 48 | 12 per team |
| Matches | 24 | League + Knockout stages |
| Match Results | 24 | One per match |
| Player Match Stats | 200+ | Multiple per match |
| Positions | 5 | PG, SG, SF, PF, C |
| Awards | 28 | 14 per gender |
| Award Winners | 28 | One per award |
| Award Categories | 14 | Different award types |
| Sponsors | 2+ | Donation sources |
| Donations | 2+ | Tracked per sponsor |
| Expenses | 4+ | By category |
| Expense Categories | 4+ | Food, Accommodation, etc. |

---

## 🛠️ Customization Points

**Easy to Customize:**
- [ ] Add new dashboard pages
- [ ] Create new DAX measures
- [ ] Add performance slicers
- [ ] Modify color schemes
- [ ] Add new filters
- [ ] Export custom reports

**Moderate Customization:**
- [ ] Add new database fields
- [ ] Create stored procedures
- [ ] Implement views
- [ ] Add data quality checks
- [ ] Create data validation rules

**Advanced Customization:**
- [ ] Redesign schema
- [ ] Add ETL processes
- [ ] Implement data warehouse
- [ ] Create automated refresh
- [ ] Add machine learning models

---

## 📝 Version Information

| Component | Version | Last Updated |
|-----------|---------|--------------|
| MySQL Dump | 8.0.42 | May 2024 |
| Power BI | 2024+ | May 2024 |
| Documentation | 1.0.0 | May 2024 |
| Schema Version | 1.0 | May 2024 |

---

## ✅ Quality Checklist

- ✅ All tables normalized (3NF)
- ✅ Referential integrity enforced
- ✅ Primary keys defined
- ✅ Foreign keys established
- ✅ Unique constraints applied
- ✅ Indexes created for performance
- ✅ Sample data verified
- ✅ No duplicate awards
- ✅ All relationships mapped
- ✅ Documentation complete

---

**Last Updated:** May 2024  
**Completeness:** 100%  
**Status:** Production Ready
