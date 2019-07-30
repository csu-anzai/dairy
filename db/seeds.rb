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
i_v = i.item_variants.create(title: "Cow milk" ,price: 100)
i_v.attribute_choices << a_c11
i_v.attribute_choices << a_c21

# ========================================= #
u1 = Unit.create(name: 'Kilo Grams', code: 'KGS')
u2 = Unit.create(name: 'Litre', code: 'LTR')
# ========================================= #

vnd1 = Vendor.create(name: 'GwalG vendor', salutation: 'Mr.', gender: "male", date_of_birth: '19-12-1989', username: 'ven_user', password: 'password', password_confirmation: 'password', email: 'vandor@user.com', mobile: '9874562125')
sup1 = Supplier.create(name: 'Main supplier', salutation: 'Mr.', gender: "male", date_of_birth: '19-12-1975', username: 'supplier_user', password: 'password', password_confirmation: 'password', email: 'supplier@user.com', mobile: '8857412584')
c1 = Customer.create(name: 'Customer', salutation: 'Mr.', gender: "male", date_of_birth: '19-12-1990', username: 'cstm_user', password: 'password', password_confirmation: 'password', email: 'customer@user.com', mobile: '8547125481')
d_exe1 = DeliveryExecutive.create(name: 'First delivery executive', salutation: 'Mr.', gender: "male", date_of_birth: '19-12-1989', username: 'del_exe_one', password: 'password', password_confirmation: 'password', email: 'delivery_executive@user.com', mobile: '7687452178')

vnd_add = Address.create(address1: 'H.No- 119, Block- A, Near- Govt. hospital', address2: 'address2', addressable: vnd1, receiver_name: 'My mother', receiver_mobile: '9854215784', zip: '521456')
sup_add = Address.create(address1: 'H.No- 09, Block- F, Near- SBI Bank', address2: 'address2', addressable: sup1, receiver_name: 'someone', receiver_mobile: '9854782145', zip: '954782')
cst_add = Address.create(address1: 'H.No- 387, Block- C, Near- Essar Petrol Pump', address2: 'address12', addressable: c1, receiver_name: 'My brther', receiver_mobile: '7845215487', zip: '65845')
d_exe_add = Address.create(address1: 'H.No- 051, Sect-1, Near- Metro station', address2: 'address12', addressable: d_exe1, receiver_name: ' just deliver', receiver_mobile: '8541257412', zip: '854123')

location1 = vnd1.locations.create(name: 'first route', start_point: 'abc first point', end_point: 'xyz last point', delivery_executive: d_exe1, description: "This is a demo location")

subs = cst_add.subscriptions.create(item_variant: i_v, title: "First subscription", quantity: 10, unit: u1, start_date: Date.today + 1.day, end_date: Date.today + 7.days, frequency: 1, status: 'active', call_verified: true)
add_on1 = subs.create_active_addon(start_date: Date.today + 1.day, end_date: Date.today + 7.days, status: 'active', quantity: 1, unit: u1)

vnd_bt = i_v.batches.create(vendor: vnd1, code: 'VN103', manufacturing_date: Date.today - 1.days, expiry_date: Date.today + 5.days)
sup_bt = i_v.batches.create(vendor: sup1, code: 'SLY101', manufacturing_date: Date.today - 1.days, expiry_date: Date.today + 5.days)

stock = vnd_bt.create_stock(quantity: 100, unit: u1)
actual_delivery = ActualDelivery.create!(address_id: cst_add.id, subscription_id: subs.id, delivery_executive_id: d_exe1.id, unit_id: u2.id, quantity: 2.250, amount: 250.50, remarks: nil, status: "delivered")
# Subscription.active.each { |subs| subs.deliveries.create(address: subs.address, status: 'delivered') }
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?