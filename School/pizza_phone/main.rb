# Pizza ordering service
# Copyright (C) 2019 Zachary Picone
# This software is released through the GNU Affero General Public License, version 3. For more information, see the LICENSE file.

require_relative './lib/ordering.rb'
include Ordering

pizza_list = [
  ["Meatlovers", 8.5], ["Hawaiian", 8.5], ["Cheese", 8.5], ["Cheesy Garlic", 8.5], ["Pepperoni", 8.5], ["Supreme", 8.5], ["Vegetarian", 8.5], ["Butter Chicken", 13.5], ["Garlic Prawn", 13.5], ["Sweet & Sour Pork", 13.5], ["Seaweed & Anchovy", 13.5], ["Jalapeno Chicken", 13.5]
]

Ordering.build_order_list(pizza_list)
Ordering.order_transport
