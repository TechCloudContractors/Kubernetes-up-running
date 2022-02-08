def requestbody(startdate,enddate ) :
    return f''' {{
      "type": "ActualCost",
      "dataSet": {{
        "granularity": "None",
        "aggregation": {{
          "totalCost": {{
            "name": "Cost",
            "function": "Sum"
          }},
          "totalCostUSD": {{
            "name": "CostUSD",
            "function": "Sum"
          }}
        }},
        "grouping": [
          {{
            "type": "Dimension",
            "name": "ResourceId"
          }},
          {{
            "type": "Dimension",
            "name": "ResourceType"
          }},
          {{
            "type": "Dimension",
            "name": "ResourceLocation"
          }},
          {{
            "type": "Dimension",
            "name": "ChargeType"
          }},
          {{
            "type": "Dimension",
            "name": "ResourceGroupName"
          }},
          {{
            "type": "Dimension",
            "name": "PublisherType"
          }},
          {{
            "type": "Dimension",
            "name": "ServiceName"
          }},
          {{
            "type": "Dimension",
            "name": "ServiceTier"
          }},
          {{
            "type": "Dimension",
            "name": "Meter"
          }}
        ],
        "include": [
          "Tags"
        ]
      }},
      "timeframe": "Custom",
      "timePeriod": {{
        "from": "{startdate}",
        "to": "{enddate}"
      }}
    }} '''
