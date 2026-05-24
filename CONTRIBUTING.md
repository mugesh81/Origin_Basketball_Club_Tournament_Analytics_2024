# 🤝 Contributing Guide

Thank you for your interest in contributing to the Origin Basketball Tournament Analytics project! This guide will help you get started.

---

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Making Changes](#making-changes)
- [Submitting Changes](#submitting-changes)
- [Style Guides](#style-guides)
- [Reporting Issues](#reporting-issues)
- [Suggestions & Feedback](#suggestions--feedback)

---

## 📜 Code of Conduct

### Our Pledge

We are committed to providing a welcoming and inclusive environment for all contributors.

**Expected Behavior:**
- Use welcoming and inclusive language
- Be respectful of different opinions
- Accept constructive criticism gracefully
- Focus on what is best for the community
- Show empathy and kindness

**Unacceptable Behavior:**
- Harassment, discrimination, or intimidation
- Disruptive or inappropriate comments
- Personal or political attacks
- Sharing others' private information

---

## 🚀 Getting Started

### Prerequisites

- Git installed ([git-scm.com](https://git-scm.com/))
- GitHub account
- MySQL Server 8.0+ (for database work)
- Power BI Desktop (for dashboard modifications)
- Basic knowledge of SQL or Power BI DAX

### Fork & Clone

1. **Fork the repository**
   - Click "Fork" on GitHub
   - Creates your personal copy

2. **Clone your fork**
   ```bash
   git clone https://github.com/YOUR_USERNAME/Origin-Basketball-Tournament-Analytics.git
   cd Origin-Basketball-Tournament-Analytics
   ```

3. **Add upstream remote**
   ```bash
   git remote add upstream https://github.com/ORIGINAL_OWNER/Origin-Basketball-Tournament-Analytics.git
   ```

4. **Create a branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

---

## 🛠️ Development Setup

### Step 1: Set Up Local Environment

```bash
# Clone repository
git clone https://github.com/YOUR_USERNAME/Origin-Basketball-Tournament-Analytics.git
cd Origin-Basketball-Tournament-Analytics

# Add upstream
git remote add upstream https://github.com/original-repo.git

# Fetch updates
git fetch upstream
git merge upstream/main
```

### Step 2: MySQL Database Setup

```bash
# Import database
mysql -u root -p < Origin-Basketball-Tournament-database.sql

# Verify
mysql -u root -p -e "USE origin_basketball_db; SHOW TABLES;"
```

### Step 3: Open Power BI

```
1. Open Power BI Desktop
2. Open origin_Tournament_2024_Analytics.pbix
3. Configure MySQL connection
4. Refresh data
```

### Step 4: Create Feature Branch

```bash
# Always create branch from latest upstream
git fetch upstream
git checkout -b feature/your-feature-name upstream/main
```

---

## 📝 Making Changes

### Database Changes (SQL)

#### Adding a New Table

```sql
-- Add to Origin-Basketball-Tournament-database.sql
CREATE TABLE new_table_name (
    id INT NOT NULL AUTO_INCREMENT,
    column1 VARCHAR(255),
    column2 INT,
    PRIMARY KEY (id)
);

-- Document in PROJECT_STRUCTURE.md
```

**Checklist:**
- [ ] Define clear primary key
- [ ] Use appropriate data types
- [ ] Add UNIQUE constraints where needed
- [ ] Create foreign keys for relationships
- [ ] Document purpose in comments
- [ ] Update PROJECT_STRUCTURE.md

#### Adding a New Column

```sql
-- Add column
ALTER TABLE existing_table 
ADD COLUMN new_column VARCHAR(255);

-- Update schema dump
mysqldump -u root -p origin_basketball_db > Origin-Basketball-Tournament-database.sql
```

**Checklist:**
- [ ] Use NULL or DEFAULT appropriately
- [ ] Don't break existing relationships
- [ ] Consider data type carefully
- [ ] Update documentation

#### Modifying Query Logic

```sql
-- Good example: Descriptive comment
-- Purpose: Calculate total team donations
SELECT 
    t.team_name,
    SUM(d.amount) as total_donations
FROM teams t
LEFT JOIN sponsors s ON t.sponsor_id = s.sponsor_id
LEFT JOIN donations d ON s.sponsor_id = d.sponsor_id
GROUP BY t.team_id
ORDER BY total_donations DESC;
```

### Power BI Changes

#### Adding a New Measure

1. Open Power BI file
2. Go to **Data** view
3. Select a table (preferably fact table)
4. Click **New Measure**
5. Enter DAX formula:

```DAX
New Measure Name = 
CALCULATE(
    SUM(table[column]),
    FILTER(table, condition)
)
```

6. Document formula in comment
7. Save file

#### Adding a Visualization

1. Go to **Report** view
2. Select page
3. Drag fields to create visual
4. Format appropriately
5. Add meaningful title

**Best Practices:**
- ✅ Use appropriate chart type
- ✅ Add descriptive titles
- ✅ Use consistent color scheme
- ✅ Make filters interactive
- ✅ Add tooltips

#### Creating a New Dashboard Page

1. Click "+" tab to add page
2. Rename page meaningfully
3. Add visual layout
4. Add slicers for filtering
5. Format professionally

### Documentation Changes

#### Updating README.md

```markdown
## New Section Title

Explain what this section is about.

### Subsection

Add relevant details.

- Point 1
- Point 2
- Point 3
```

#### Updating Setup Guide

1. Follow existing format
2. Include step numbers
3. Add code blocks with syntax highlighting
4. Include verification steps
5. Add troubleshooting if needed

**Checklist:**
- [ ] Clear, beginner-friendly language
- [ ] Proper formatting
- [ ] Links and references
- [ ] Code examples
- [ ] Verification steps

---

## 📤 Submitting Changes

### Step 1: Commit Your Changes

```bash
# See what changed
git status

# Stage changes
git add .

# Commit with descriptive message
git commit -m "Add feature: description of what you did"

# Push to your fork
git push origin feature/your-feature-name
```

### Step 2: Create Pull Request

1. Go to GitHub repository
2. Click "Pull Request" button
3. Select your branch
4. Fill in PR template:

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation
- [ ] Database schema
- [ ] Power BI enhancement

## Related Issue
Closes #issue_number

## Changes Made
- Change 1
- Change 2
- Change 3

## Testing Done
How did you test this?

## Screenshots (if applicable)
Add screenshots of new features

## Checklist
- [ ] Code follows style guide
- [ ] Documentation updated
- [ ] No new warnings generated
- [ ] Changes tested locally
- [ ] All tables/measures documented
```

### Step 3: Code Review

- Wait for review
- Respond to feedback
- Make requested changes
- Push updates (don't create new PR)

### Step 4: Merge

- After approval, maintainer merges PR
- Cleanup: Delete branch

```bash
# Delete local branch
git branch -d feature/your-feature-name

# Delete remote branch
git push origin --delete feature/your-feature-name
```

---

## 🎨 Style Guides

### SQL Style Guide

#### Formatting

```sql
-- ✅ GOOD - Readable and organized
SELECT 
    p.player_id,
    p.player_name,
    t.team_name,
    SUM(pms.points) as total_points
FROM players p
JOIN teams t ON p.team_id = t.team_id
LEFT JOIN player_match_stats pms ON p.player_id = pms.player_id
WHERE p.team_id = 1
GROUP BY p.player_id, p.player_name, t.team_name
HAVING SUM(pms.points) > 100
ORDER BY total_points DESC
LIMIT 10;

-- ❌ BAD - Hard to read
select p.player_id, p.player_name, t.team_name, sum(pms.points) as total_points from players p join teams t on p.team_id = t.team_id left join player_match_stats pms on p.player_id = pms.player_id where p.team_id = 1 group by p.player_id, p.player_name, t.team_name having sum(pms.points) > 100 order by total_points desc limit 10;
```

#### Naming Conventions

```sql
-- Tables (Plural, lowercase with underscores)
CREATE TABLE player_match_stats (...)

-- Columns (Singular, lowercase with underscores)
CREATE TABLE players (
    player_id INT,
    player_name VARCHAR(255),
    team_id INT
)

-- Primary Keys (table_name_id or id)
PRIMARY KEY (player_id)

-- Foreign Keys (referenced_table_id)
FOREIGN KEY (team_id) REFERENCES teams(team_id)

-- Indexes (idx_table_column)
CREATE INDEX idx_players_team_id ON players(team_id)
```

#### Comments

```sql
-- Single line comment for short explanations
-- Purpose: Calculate total points per player
SELECT ...

/* Multi-line comment
   for detailed explanations
   spanning multiple lines */
SELECT ...
```

### DAX Style Guide

#### Formatting

```DAX
-- ✅ GOOD - Clear and readable
Total Points = 
CALCULATE(
    SUM(player_match_stats[points]),
    ALL(player_match_stats)
)

-- ❌ BAD - Hard to read
Total Points = CALCULATE(SUM(player_match_stats[points]), ALL(player_match_stats))
```

#### Naming

```DAX
-- Measures (Title Case, descriptive)
Total Matches
Average Points per Player
Net Balance

-- Variables (camelCase)
var totalDonations = SUM(donations[amount])
var totalExpenses = SUM(expenses[amount])
```

### Markdown Style Guide

#### Headings

```markdown
# Main Title (H1)
## Major Section (H2)
### Subsection (H3)
#### Small Section (H4)

-- Don't skip levels: No H1 → H3 directly
```

#### Code Blocks

```markdown
Inline code: `variable_name` or `function()`

Multi-line code:
\`\`\`sql
SELECT * FROM players
WHERE team_id = 1;
\`\`\`

\`\`\`python
def calculate_total():
    return sum(values)
\`\`\`
```

#### Lists

```markdown
-- Unordered (use - or *)
- Item 1
- Item 2
  - Nested item
  - Another nested

-- Ordered (use numbers)
1. First step
2. Second step
3. Third step

-- Use blank lines between list items for clarity
```

---

## 🐛 Reporting Issues

### Before Reporting

1. Check existing issues - Don't duplicate
2. Check [Troubleshooting](SETUP_GUIDE.md#troubleshooting) section
3. Search documentation
4. Try to reproduce locally

### Creating an Issue

**Title:** Clear, specific summary
```
❌ Wrong: "Database issue"
✅ Correct: "MySQL import fails with 'Access Denied' on Windows 10"
```

**Description Template:**

```markdown
## Description
Clear description of the issue

## Steps to Reproduce
1. Step 1
2. Step 2
3. Step 3

## Expected Behavior
What should happen

## Actual Behavior
What actually happens

## Environment
- OS: Windows 10 / macOS 12 / Ubuntu 22.04
- MySQL Version: 8.0.42
- Power BI Version: Latest
- Browser (if applicable): Chrome 120

## Error Messages
Include full error text or screenshot

## Screenshots
Add if visually relevant

## Possible Solution
If you have ideas on how to fix

## Checklist
- [ ] I've searched existing issues
- [ ] I've checked documentation
- [ ] I can reproduce the issue
```

### Issue Labels

- **bug** - Something isn't working
- **enhancement** - New feature or improvement
- **documentation** - Missing or unclear docs
- **database** - Database schema related
- **powerbi** - Power BI dashboard related
- **good first issue** - Good for new contributors
- **help wanted** - Need community help

---

## 💡 Suggestions & Feedback

### Feature Request

```markdown
## Is your feature request related to a problem?
Describe the problem here

## Describe the solution
Detailed description of what you want

## Describe alternatives
Other solutions you've considered

## Additional context
Any other context about the request
```

### Improvement Suggestions

Post in Discussions (if available) or create a GitHub Issue with tag `enhancement`.

---

## 📋 Contribution Checklist

Before submitting a PR:

### Code Quality
- [ ] Code follows style guide
- [ ] Comments added for complex logic
- [ ] No console errors or warnings
- [ ] Code tested locally

### Database Changes
- [ ] Schema properly normalized
- [ ] Foreign keys added
- [ ] Constraints enforced
- [ ] Sample data verified
- [ ] No data loss

### Power BI Changes
- [ ] New measures documented
- [ ] Visualizations properly formatted
- [ ] All filters working
- [ ] Colors consistent
- [ ] No performance issues

### Documentation
- [ ] README.md updated
- [ ] SETUP_GUIDE.md updated (if needed)
- [ ] PROJECT_STRUCTURE.md updated
- [ ] Code comments added
- [ ] Screenshots included

### Testing
- [ ] Changes tested locally
- [ ] No regressions
- [ ] All features working
- [ ] Filters work correctly
- [ ] Data loads properly

---

## 🏆 Recognition

Contributors will be:
- Added to [Contributors](README.md#acknowledgments) section
- Thanked in commit messages
- Mentioned in release notes

---

## 📞 Questions?

- Open an issue with `question` label
- Ask in Discussions
- Check existing Q&A

---

## 🙏 Thank You!

Thank you for contributing to making this project better! Your effort and dedication help make this project valuable for everyone.

---

**Last Updated:** May 2024  
**Maintained By:** Project Team
