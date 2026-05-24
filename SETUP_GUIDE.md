# 🛠️ Complete Setup Guide

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [MySQL Setup](#mysql-setup)
3. [Database Import](#database-import)
4. [Power BI Setup](#power-bi-setup)
5. [Troubleshooting](#troubleshooting)
6. [Verification Steps](#verification-steps)

---

## ✅ Prerequisites

### System Requirements
- **OS:** Windows, macOS, or Linux
- **RAM:** 4GB minimum (8GB recommended)
- **Disk Space:** 500MB minimum

### Required Software

#### 1. MySQL Server (8.0+)
- **Download:** [mysql.com](https://dev.mysql.com/downloads/mysql/)
- **Version:** 8.0.42 or higher
- **Installer:** MySQL Community Server

#### 2. MySQL Workbench (Optional but Recommended)
- **Download:** [mysql.com/products/workbench](https://www.mysql.com/products/workbench/)
- **Purpose:** Visual database management
- **Cost:** Free

#### 3. Power BI Desktop
- **Download:** [powerbi.microsoft.com](https://powerbi.microsoft.com/en-us/desktop/)
- **Version:** Latest
- **Cost:** Free
- **Note:** Requires Windows or web browser access

#### 4. Git (Optional)
- **Download:** [git-scm.com](https://git-scm.com/)
- **Purpose:** Version control
- **Version:** Latest

---

## 🗄️ MySQL Setup

### Step 1: Download MySQL

Visit [mysql.com/downloads/mysql/](https://dev.mysql.com/downloads/mysql/)

**Choose:**
- Platform: Windows (or your OS)
- Version: 8.0.42 (or latest 8.x)

### Step 2: Install MySQL

#### On Windows:
```
1. Run installer
2. Choose "Developer Default" setup type
3. Select all default components
4. Click "Next" through configuration
5. MySQL Server Configuration:
   - Config Type: Development Machine
   - Port: 3306 (default)
   - MySQL as a Windows Service: YES
6. Complete installation
```

#### On macOS:
```
1. Download DMG installer
2. Double-click to mount
3. Run MySQL installer package
4. Follow prompts
5. MySQL will start automatically
```

#### On Linux (Ubuntu/Debian):
```bash
sudo apt-get update
sudo apt-get install mysql-server
sudo mysql_secure_installation
```

### Step 3: Verify Installation

**On Windows (Command Prompt/PowerShell):**
```cmd
mysql --version
```

**Expected Output:**
```
mysql  Ver 8.0.42 for Win64 on x86_64
```

### Step 4: Start MySQL Service

#### Windows:
```cmd
# Check if running
tasklist | find /I "mysqld"

# If not running, start it
net start MySQL80
```

#### macOS/Linux:
```bash
# MySQL usually starts automatically
# To start manually:
sudo systemctl start mysql

# To enable on boot:
sudo systemctl enable mysql
```

### Step 5: Secure MySQL (Optional but Recommended)

```bash
# Run security script
mysql_secure_installation

# When prompted:
# - Set root password: YES
# - Remove anonymous users: YES
# - Disable remote root login: YES
# - Remove test databases: YES
```

---

## 📥 Database Import

### Step 1: Prepare for Import

Create the database directory:

```cmd
# Windows - Command Prompt (Admin)
mkdir C:\MySQL_data
```

### Step 2: Import Using Command Line

**Option A: Direct Import (Recommended)**

```bash
# Navigate to project folder
cd C:\Users\HP\Desktop\Origin-Basketball-Tournament-Analytics

# Import database
mysql -u root -p < Origin-Basketball-Tournament-database.sql
```

When prompted, enter your MySQL root password.

**Option B: Using MySQL Workbench**

1. Open MySQL Workbench
2. Click **File** → **Open SQL Script**
3. Select `Origin-Basketball-Tournament-database.sql`
4. Click the **Lightning Bolt** icon to execute
5. Wait for completion

### Step 3: Verify Import

```bash
# Connect to MySQL
mysql -u root -p

# In MySQL prompt:
```

```sql
-- Show all databases
SHOW DATABASES;

-- Should see: origin_basketball_db

-- Connect to database
USE origin_basketball_db;

-- Show all tables
SHOW TABLES;

-- Should see 14 tables

-- Check row counts
SELECT 'gender_categories' as table_name, COUNT(*) as rows FROM gender_categories
UNION ALL
SELECT 'teams', COUNT(*) FROM teams
UNION ALL
SELECT 'players', COUNT(*) FROM players
UNION ALL
SELECT 'matches', COUNT(*) FROM matches
UNION ALL
SELECT 'match_results', COUNT(*) FROM match_results
UNION ALL
SELECT 'player_match_stats', COUNT(*) FROM player_match_stats
UNION ALL
SELECT 'awards', COUNT(*) FROM awards
UNION ALL
SELECT 'award_winners', COUNT(*) FROM award_winners
UNION ALL
SELECT 'donations', COUNT(*) FROM donations
UNION ALL
SELECT 'expenses', COUNT(*) FROM expenses;

-- Exit MySQL
EXIT;
```

---

## 📊 Power BI Setup

### Step 1: Install Power BI Desktop

1. Visit [powerbi.microsoft.com/desktop](https://powerbi.microsoft.com/en-us/desktop/)
2. Click **Download**
3. Choose **Free**
4. Run installer
5. Follow installation steps
6. Sign in with Microsoft account

### Step 2: Open Power BI File

1. Open Power BI Desktop
2. Click **File** → **Open Report**
3. Navigate to: `Origin-Basketball-Tournament-Analytics`
4. Select: `origin_Tournament_2024_Analytics.pbix`
5. Click **Open**

### Step 3: Update Data Connection

If Power BI prompts for credentials:

1. Click **Edit Queries** (or skip to next step if not prompted)
2. Go to **Home** → **Transform Data** → **Data Source Settings**
3. For MySQL connection, click **Edit**
4. Update credentials:
   - **Server:** localhost (or 127.0.0.1)
   - **Database:** origin_basketball_db
   - **Username:** root
   - **Password:** (your MySQL password)
5. Click **OK** → **Close**
6. Click **Apply Changes**

### Step 4: Refresh Data

```
1. Go to Home tab
2. Click "Refresh"
3. Wait for data to load (30 seconds - 2 minutes)
4. Dashboards will populate with data
```

### Step 5: Explore Dashboards

Navigate through 3 pages:
- **Page 1:** Tournament Overview
- **Page 2:** Financial Summary
- **Page 3:** Team & Player Performance

Use **Slicers** (filters) to explore by:
- Gender
- Team
- Match Stage
- Date Range

---

## 🔍 Verification Steps

### Step 1: Verify MySQL Database

```sql
-- Connect to database
mysql -u root -p
USE origin_basketball_db;

-- Check critical tables
SELECT COUNT(*) as match_count FROM matches;
SELECT COUNT(*) as player_count FROM players;
SELECT COUNT(*) as team_count FROM teams;
SELECT COUNT(*) as award_count FROM awards;
SELECT COUNT(*) as donation_count FROM donations;

-- Expected results:
-- matches: 24
-- players: 48
-- teams: 4
-- awards: 28
-- donations: 2+
```

### Step 2: Verify Sample Queries

```sql
-- Show all teams with gender
SELECT t.team_id, t.team_name, g.gender_name
FROM teams t
JOIN gender_categories g ON t.gender_id = g.gender_id;

-- Show top scorers
SELECT 
    p.player_name,
    t.team_name,
    SUM(pms.points) as total_points
FROM players p
JOIN teams t ON p.team_id = t.team_id
JOIN player_match_stats pms ON p.player_id = pms.player_id
GROUP BY p.player_id, p.player_name, t.team_name
ORDER BY total_points DESC
LIMIT 10;

-- Show financial summary
SELECT 
    SUM(d.amount) as total_donations,
    SUM(e.amount) as total_expenses,
    SUM(d.amount) - SUM(e.amount) as net_balance
FROM donations d, expenses e;
```

### Step 3: Verify Power BI Connection

1. Open Power BI file
2. Go to **Data** view (left panel)
3. Should see all 14 tables listed
4. Click on each table to verify data loading
5. Switch to **Report** view
6. All visualizations should display data

---

## ❌ Troubleshooting

### Problem 1: MySQL Service Not Running

**Symptom:** "Can't connect to MySQL server"

**Solution:**
```cmd
# Windows - Command Prompt (Admin)
net start MySQL80

# Or restart Windows service
Get-Service -Name MySQL80 | Stop-Service
Get-Service -Name MySQL80 | Start-Service
```

### Problem 2: "Access Denied" Error

**Symptom:** "Access denied for user 'root'@'localhost'"

**Solution:**
```sql
-- Reset root password (Windows)
mysqld --skip-grant-tables

-- In new command prompt:
mysql -u root
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_password';
EXIT;

-- Restart MySQL:
net stop MySQL80
net start MySQL80
```

### Problem 3: Database Already Exists

**Symptom:** "Database 'origin_basketball_db' already exists"

**Solution:**
```sql
-- Drop existing database (WARNING: Deletes all data)
DROP DATABASE origin_basketball_db;

-- Then re-import:
mysql -u root -p < Origin-Basketball-Tournament-database.sql
```

### Problem 4: Power BI Cannot Find MySQL

**Symptom:** Power BI shows "MySQL not found" or "Driver error"

**Solution:**
1. Install MySQL Connector/ODBC:
   - Download: [dev.mysql.com/downloads/connector/odbc/](https://dev.mysql.com/downloads/connector/odbc/)
   - Install 64-bit version
2. Restart Power BI Desktop
3. Try reconnecting

### Problem 5: Power BI Shows Old Data

**Symptom:** Dashboard data doesn't match database

**Solution:**
```
1. In Power BI, click "Refresh" button
2. Or go to Home → Transform Data → Close & Apply
3. Wait 1-2 minutes for refresh
4. Check Report view for updated data
```

### Problem 6: Import Takes Too Long

**Symptom:** SQL import hangs or times out

**Solution:**
```bash
# Increase MySQL timeout
mysql -u root -p --max_allowed_packet=512M < Origin-Basketball-Tournament-database.sql

# Or import with verbose output to see progress
mysql -u root -p -v < Origin-Basketball-Tournament-database.sql
```

---

## 🔄 Next Steps After Setup

### 1. Explore Data
- Open database in MySQL Workbench
- Run provided queries
- Understand table relationships

### 2. Analyze Dashboards
- View all three dashboard pages
- Use filters to explore data
- Understand key metrics

### 3. Customize (Optional)
- Add new measures in Power BI
- Create additional visualizations
- Modify dashboard layout

### 4. Share Results
- Publish to Power BI Service
- Share with stakeholders
- Export reports

---

## ✨ Quick Reference Commands

### MySQL Commands
```bash
# Login
mysql -u root -p

# Import database
mysql -u root -p < backup.sql

# Export database
mysqldump -u root -p origin_basketball_db > backup.sql

# Connect to database
mysql -u root -p origin_basketball_db

# Show all users
SELECT user, host FROM mysql.user;

# Check MySQL version
SHOW VARIABLES LIKE 'version';
```

### Power BI Steps
```
1. Open file → origin_Tournament_2024_Analytics.pbix
2. If prompted: Enter MySQL credentials
3. Click Refresh to load data
4. Explore dashboards
5. Use slicers to filter
```

---

## ✅ Setup Checklist

- [ ] MySQL Server installed (version 8.0+)
- [ ] MySQL service running
- [ ] Database imported successfully
- [ ] Sample queries executed
- [ ] Power BI Desktop installed
- [ ] Power BI file opened
- [ ] MySQL connection configured in Power BI
- [ ] Data refreshed in Power BI
- [ ] All dashboards displaying data
- [ ] All tables verified with data

---

## 📞 Need Help?

If you encounter issues:
1. Check [Troubleshooting](#troubleshooting) section
2. Review error messages carefully
3. Search similar issues online
4. Check MySQL logs: `C:\ProgramData\MySQL\MySQL Server 8.0\Data\*.err`
5. Create GitHub issue with error details

---

**Setup Time:** 15-30 minutes  
**Difficulty:** Beginner to Intermediate  
**Last Updated:** May 2024

🎉 **Once setup is complete, you're ready to analyze tournament data!**
