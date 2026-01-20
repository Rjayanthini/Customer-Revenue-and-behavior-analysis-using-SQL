# Customer Segmentation using SQL

## Objective
Analyze customer behavior using orders and payment data to classify customers into value segments for targeted business decisions.

## Data Model
- Customers: demographic and regional information
- Orders: customer purchase history
- Payments: payment attempts with success/failure status

## Key Metrics
- Total Spend (successful payments only)
- Order Count (last 12 months)
- Average Order Value
- Recency (last successful payment date)

## Methodology
- Used LEFT JOINs to retain inactive customers
- Filtered date ranges in JOIN conditions to preserve data integrity
- Handled multiple payment attempts per order using DISTINCT
- Segmented customers using CASE logic based on business-defined thresholds

## Customer Segments
- High Value
- Medium Value
- Low Value
- Inactive / New

## Business Impact
- Enables targeted marketing and retention strategies
- Identifies churn-risk customers
- Supports region-wise revenue optimization
