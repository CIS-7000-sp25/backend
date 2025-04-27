# CIS 7000 Final Project Backend

### Python Environment Setup
   Optional: Setup a Python virtual environment however you usually do.

   For example:
   ```bash
      # tested on macos
      mkdir venv
      python -m venv ./venv
      source venv/bin/activate
   ```

   Install python dependencies:

   `pip install -r requirements.txt`

   This will automatically install all the pip packages we used in our package.

### S3 Integration Setup
   To enable asset downloading from AWS S3, you’ll need to allow your credentials to be discovered through the use of environment variables.

   Create a `.env` file in the root directory (next to `manage.py`) with the following content:

   ```env
   AWS_ACCESS_KEY_ID=your-access-key-id
   AWS_SECRET_ACCESS_KEY=your-secret-access-key
   AWS_REGION=us-east-1
   AWS_BUCKET_NAME=cis-7000-usd-assets-versioned
   ```

   Reach out to Jacky Park if you need these credentials.

### MySQL Database Setup
   Our MySQL database is now hosted through a third-party called [Railway](https://railway.com/about).
   
   We have two versions of our database hosted within Railway. One that is connected to our deployed asset browser at https://asset-browser-zeta.vercel.app/, and one that can be used for testing.

   The info for either of these will also go in your `.env` file in the following format:

   ```env
      MYSQLHOST=shuttle.proxy.rlwy.net
      MYSQLPASSWORD=password-of-desired-database
      MYSQLPORT=port-of-desired-database
   ```

   Reach out to Aaron Jiang if you need these credentials.

### Django
   Lastly, we can start the server locally. First, you must make migrations.
   ```bash
   python manage.py migrate
   ```

   Then, you can start the server.

   ```bash
   python manage.py runserver
   ```

### DEPRECATED: Local MySQL Setup
   If you do want to create a local version of the database with all our assets already populated, please follow the steps below.

   1. Install MySQL.
   2. Create a database to import the data into. Example name: "assets".
   3. Then import the backup using the `assets_backup.sql` file at the root of this repo.
      ```
      mysql -u your_user -p assets < filepath_to/assets_backup.sql
      ```

#### Example MacOS MySQLSetup:

   ```bash
      # Install mysql
      brew install mysql pkgconf

      # Start server
      brew services start mysql
      mysql -u root -p # Will prompt to set password

      > CREATE DATABASE assets;
      > exit
   ```

   Lastly, in your regular shell environment, you can import the backup.
   ```bash
      # In repo root directory
      mysql -u root -p assets < assets_backup.sql
   ```

### DEPRECATED: File Crawler Tool
  A script is also provided to create the database from scratch by crawling through the whole asset folder (i.e. Week 6 Assets).

  You still need MySQL to perform this step. There should be an assets db already created so Django can connect with it.

  1. Download our class's assets from Google Drive all in one folder and replace 
  `folder_path` in `./asset_library/library/script.py` with the folder location.
  2. Open the python shell for Django using `python manage.py shell` in console.
  3.  Run the following code:
      ```python
      from library.models import Asset, Keyword, AssetVersion, Commit
      # Clear current db
      Asset.objects.all().delete()
      from library.script import Script
      a = Script()
      a.runFileCrawler()
      # Can check entries added
      Asset.objects.all()
      ```

### The End!
   If you run into any issues during setup, please let us know. The more bugs we fix, systems we adjust to, and documentation we can add, the better. Thanks!