import azure.functions as func
import csv
import json
import os
from collections import defaultdict
from urllib.request import urlopen

app = func.FunctionApp(http_auth_level=func.AuthLevel.ANONYMOUS)


@app.route(route="metrics", methods=["GET"])
def metrics(req: func.HttpRequest) -> func.HttpResponse:
    data_url = os.environ.get("DATASET_URL")
    if not data_url:
        return func.HttpResponse(
            "Missing DATASET_URL app setting",
            status_code=500,
        )

    total_orders = 0
    total_revenue = 0.0
    rev_by_product = defaultdict(float)

    with urlopen(data_url) as resp:
        lines = resp.read().decode("utf-8").splitlines()
        reader = csv.DictReader(lines)

        for row in reader:
            total_orders += 1
            revenue = float(row["revenue_usd"])
            total_revenue += revenue
            rev_by_product[row["product"]] += revenue

    avg_order_value = round(total_revenue / total_orders, 2) if total_orders else 0.0
    top_product, top_product_rev = max(rev_by_product.items(), key=lambda x: x[1])

    out = {
        "total_orders": total_orders,
        "total_revenue_usd": round(total_revenue, 2),
        "avg_order_value_usd": avg_order_value,
        "top_product_by_revenue": {
            "product": top_product,
            "revenue_usd": round(top_product_rev, 2),
        },
    }

    return func.HttpResponse(
        json.dumps(out, indent=2),
        mimetype="application/json",
    )