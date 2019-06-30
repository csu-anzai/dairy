i_c = ItemCategory.create(name: 'Dairy')

i_a1 = ItemAttribute.create(name: 'Brand')
a_c11 = i_a1.attribute_choices.create(name: 'Amul')
a_c12 = i_a1.attribute_choices.create(name: 'Mother Dairy')
a_c13 = i_a1.attribute_choices.create(name: 'Gokul')

i_a2 = ItemAttribute.create(name: 'Cream Level')
a_c21 = i_a2.attribute_choices.create(name: 'Full Cream')
a_c22 = i_a2.attribute_choices.create(name: 'Toned')
a_c23 = i_a2.attribute_choices.create(name: 'Double Toned')

i_c.item_attributes << i_a1
i_c.item_attributes << i_a2

i = i_c.items.create(name: 'Milk')
i_v = i.item_variants.create(price: 100)
i_v.attribute_choices << a_c11
i_v.attribute_choices << a_c21

# ========================================= #
u1 = Unit.create(name: 'Kilo Grams', code: 'KGS')
u2 = Unit.create(name: 'Litre', code: 'LTR')
# ========================================= #

v1 = Vendor.create(name: 'Vendor1', salutation: 'Mr.', gender: "male", username: 'ven_user', email: 'vandor@admin.com', mobile: '9874562125')
c1 = Customer.create(name: 'Customer1', salutation: 'Mr.', gender: "male", username: 'cstm_user', email: 'customer@admin.com', mobile: '8547125481')

a1 = Address.create(address1: 'H.No- 119, Block- A, Near- Govt. hospital', address2: 'address2', addressable: v1, receiver_name: 'My mother', receiver_mobile: '9854215784', zip: '521456')
a2 = Address.create(address1: 'H.No- 387, Block- C, Near- Essar Petrol Pump', address2: 'address12', addressable: c1, receiver_name: 'My brther', receiver_mobile: '7845215487', zip: '65845')

s1 = a2.subscriptions.create(item_variant: i_v, quantity: 10, unit: u1, start_date: Date.today, end_date: Date.today + 7.days, frequency: 1, status: 'active', call_verified: true)
add1 = s1.create_active_addon(start_date: Date.today, end_date: Date.today + 7.days, status: 'active', quantity: 1, unit: u1)

bt = i_v.batches.create(vendor: v1, code: 'VN103', manufacturing_date: Date.today - 1.days, expiry_date: Date.today + 5.days)

bt.create_stock(quantity: 100, unit: u1)

# Subscription.active.each { |subs| subs.deliveries.create(address: subs.address, status: 'delivered') }
