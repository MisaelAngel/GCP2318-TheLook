view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    # order_by_field: users.id
    # order_by_field: id
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
    drill_fields: []
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  filter: join_A_B {
    type: yesno
  }

  # dimension: users_states {
  #   type: string
  #   sql: ${users.state} ;;
  #   # sql:"States" ;;
  #   order_by_field: users.id
  # }

  # dimension: user_state {
  #   type: string
  #   sql: {%if join_A_B._in_query %}
  #           ${users_states}
  #         {% else %}
  #           "Test"
  #         {% endif %};;
  #   # sql: case
  #   #       when orders.join_A_B = true then ${users.state} else "test" end;;
  # }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  users.id,
  users.first_name,
  users.last_name,
  billion_orders.count,
  fakeorders.count,
  hundred_million_orders.count,
  hundred_million_orders_wide.count,
  order_items.count,
  order_items_vijaya.count,
  ten_million_orders.count
  ]
  }

}
