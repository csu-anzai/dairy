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