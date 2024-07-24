#!/bin/bash

# Function to update import statements in a given file
fix_imports() {
    local file=$1
    sed -i "s|import package:flutter/material.dart|import 'package:flutter/material.dart'|g" $file
    sed -i "s|import package:tasktabs/models/job.dart|import 'package:tasktabs/models/job.dart'|g" $file
    sed -i "s|import package:tasktabs/models/user.dart|import 'package:tasktabs/models/user.dart'|g" $file
    sed -i "s|import package:tasktabs/models/employer.dart|import 'package:tasktabs/models/employer.dart'|g" $file
    sed -i "s|import package:tasktabs/services/job_service.dart|import 'package:tasktabs/services/job_service.dart'|g" $file
    sed -i "s|import package:tasktabs/services/user_service.dart|import 'package:tasktabs/services/user_service.dart'|g" $file
    sed -i "s|import package:tasktabs/services/employer_service.dart|import 'package:tasktabs/services/employer_service.dart'|g" $file
}

# Fix imports in all Dart files in the lib directory
find lib -name "*.dart" | while read file; do
    fix_imports $file
done

echo "Import statements fixed."

