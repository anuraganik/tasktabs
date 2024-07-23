#!/bin/bash

# Navigate to the project directory
cd /path/to/your/project/directory

# Ensure the latest changes are pulled
git pull origin main

# Add all changes to git
git add .

# Commit the changes
git commit -m "Update project with new changes"

# Push the changes to the remote repository
git push origin main

