
view: product_tagging_shopifystoreproductvariants {
  derived_table: {
    sql: SELECT
          shopify_store_product_variants.shopifyCategory  AS shopify_store_product_variants_shopify_category,
          shopify_store_product_variants.policyDetailsUSInsurerCategory  AS shopify_store_product_variants_policy_details_usinsurer_category,
          COUNT(*) AS shopify_store_product_variants_count_product_id,
          t.total, (t.total-count(*)) as not_tagged
      FROM `store_products_dataset.shopifyStoreProductVariants`  AS shopify_store_product_variants
      JOIN (SELECT count(shopify_store_product.shopifyCategory) as total, shopifyCategory
            FROM `store_products_dataset.shopifyStoreProductVariants`  AS shopify_store_product
            GROUP BY shopify_store_product.shopifyCategory ) t
            on shopify_store_product_variants.shopifyCategory = t.shopifyCategory
      WHERE (shopify_store_product_variants.policyDetailsUSInsurerCategory )
      IS NOT NULL AND (shopify_store_product_variants.shopifyCategory ) IS NOT NULL
      GROUP BY
          shopify_store_product_variants.shopifyCategory,
          shopify_store_product_variants.policyDetailsUSInsurerCategory,
          t.total
      ORDER BY
          1,
          2 DESC
      LIMIT 5000 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: shopify_store_product_variants_shopify_category {
    type: string
    sql: ${TABLE}.shopify_store_product_variants_shopify_category ;;
  }

  dimension: shopify_store_product_variants_policy_details_usinsurer_category {
    type: string
    sql: ${TABLE}.shopify_store_product_variants_policy_details_usinsurer_category ;;
  }

  dimension: shopify_store_product_variants_count_product_id {
    type: number
    sql: ${TABLE}.shopify_store_product_variants_count_product_id ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  dimension: not_tagged {
    type: number
    sql: ${TABLE}.not_tagged ;;
  }


  set: detail {
    fields: [
        shopify_store_product_variants_shopify_category,
  shopify_store_product_variants_policy_details_usinsurer_category,
  shopify_store_product_variants_count_product_id,
  total,
  not_tagged
    ]
  }
}
