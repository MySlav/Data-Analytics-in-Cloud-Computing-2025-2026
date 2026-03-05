#!/usr/bin/env python3
"""Compute basic aggregate metrics from cloud_orders.csv.

Usage:
  python3 agg_metrics.py cloud_orders.csv
"""
import csv
import json
import sys
from collections import defaultdict

def main(path: str) -> None:
    total_orders = 0
    total_revenue = 0.0
    rev_by_product = defaultdict(float)

    with open(path, newline="", encoding="utf-8") as f:
        r = csv.DictReader(f)
        for row in r:
            total_orders += 1
            revenue = float(row["revenue_usd"])
            total_revenue += revenue
            rev_by_product[row["product"]] += revenue

    if total_orders == 0:
        raise SystemExit("CSV contains no rows.")

    avg_order_value = round(total_revenue / total_orders, 2)
    top_product, top_product_rev = max(rev_by_product.items(), key=lambda x: x[1])

    out = {
        "total_orders": total_orders,
        "total_revenue_usd": round(total_revenue, 2),
        "avg_order_value_usd": avg_order_value,
        "top_product_by_revenue": {
            "product": top_product,
            "revenue_usd": round(top_product_rev, 2)
        }
    }
    print(json.dumps(out, indent=2))

if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("Usage: python3 agg_metrics.py cloud_orders.csv")
    main(sys.argv[1])
