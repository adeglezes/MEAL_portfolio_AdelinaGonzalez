# Basic Python parser for social media metrics exported from Metricool or Meta Insights
# This script reads a CSV file and generates simple summaries.

import pandas as pd

# Replace with the file path after uploading your CSV
file_path = "social_metrics.csv"

# Load data
df = pd.read_csv(file_path)

# Summary statistics
print("=== BASIC SUMMARY ===")
print(df.describe())

# Engagement rate calculation
if {'engagement', 'reach'}.issubset(df.columns):
    df['engagement_rate'] = df['engagement'] / df['reach'].replace(0, 1)
    print("=== AVERAGE ENGAGEMENT RATE ===")
    print(df['engagement_rate'].mean())

# Group by content type
if 'content_type' in df.columns:
    print("=== PERFORMANCE BY CONTENT TYPE ===")
    print(df.groupby('content_type')[['reach', 'engagement']].mean())

# Sort top posts
if 'reach' in df.columns:
    top_posts = df.sort_values('reach', ascending=False).head(5)
    print("=== TOP 5 POSTS BY REACH ===")
    print(top_posts)
