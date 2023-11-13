view: users {
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
    # label: "Created"
    # group_item_label: "Created_using_GIL"
    # html: <p>Created</p> ;;
  }

  dimension: createdmonth{
    type: string
    sql: ${created_month} ;;
    label: "Created"
    group_label: "Created Dimensions"
  }

  dimension: createdyear{
    type: string
    sql: ${created_year} ;;
    label: "Created"
    group_label: "Created Dimensions"
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
    # order_by_field: id
    # order_by_field: orders.id
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: state2 {
    # type: string
    sql: case when ${state} = 'California' then 1 else 1 end ;;
  }

  # measure: test {
  #   type: sum
  #   sql: ${state2} ;;
  #   drill_fields: [detail*]
  # }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  # dimension: site_image {
  #   type: string
  #   sql: ${id} ;;
  #   html:
  #   <img src="https://www.nutrisystem.com/images/global/NS-logo.svg" width="200" height="35" align="right"/> ;;
  # }

  # dimension: userattribute {
  #   type: string
  #   sql: {{_user_attributes['model']}} ;;
  # }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: number_test {
    type: number
    sql: 41242864841504574 ;;
    # value_format: "[>999999999999]0.0,,,,\"T\";[>999999999]0.0,,,\"B\"; [>999999]0.0,,\"M\"; 0.0,\"K\""
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  first_name,
  last_name,
  events.count,
  orders.count,
  saralooker.count,
  sindhu.count,
  user_data.count,
  ]
  }

}
