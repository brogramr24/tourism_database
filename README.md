# Tourism Database

MySQL database schema for Local Tourism Management System.

## Database Structure

### Tables
- **users** - Tourists, guides, and administrators
- **guides** - Extended profiles for guide users
- **experiences** - Available tourism activities and tours
- **seasonal_pricing** - Peak/off-peak pricing multipliers
- **bookings** - Tourist reservations and payments
- **revenue_distribution** - Commission splits between guides and platform
- **reviews** - Customer feedback and ratings
- **demand_analytics** - Seasonal trend tracking
- **notifications** - User alerts and messages

## Setup Instructions

### Option 1: Railway (Recommended)
1. Go to [railway.app](https://railway.app) and create free account
2. Click "New Project" → "Provision MySQL"
3. Wait for database to deploy
4. Click "Connect" → copy MySQL connection string
5. Use MySQL client or Railway dashboard query tool
6. Run `schema.sql` to create tables
7. Run `seed-data.sql` to populate sample data

### Option 2: Clever Cloud
1. Go to [clever-cloud.com](https://clever-cloud.com)
2. Create account and add MySQL addon
3. Get connection credentials from dashboard
4. Connect using MySQL Workbench or CLI
5. Execute schema and seed files

### Option 3: Local MySQL
```bash
mysql -u root -p
source schema.sql
source seed-data.sql
