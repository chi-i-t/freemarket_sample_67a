# freemarket_sample_36a DB設計


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|birthday|date|null: false|
|phone_number|string||

### Association
- has_many :items
- has_one :address
- has_one :shipping_address
- has_one :card


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string｜null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address_number|string|null: false|
|building_name|string||
|user_id|reference|null: false,foreign_key: true|

### Association
- belongs_to :user


## shipping_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_code|string｜null: false|
|prefectures|string|null: false|
|city|string|null: false|
|adress_number|string|null: false|
|building_name|string||
|phone_number|string||
|user_id|reference|null: false,foreign_key: true|

### Association
- belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|business_result|integer||
|status|string|null: false|
|user_id|reference|null: false,foreign_key: true|
|category_id|reference|null: false,foreign_key: true|
|brand_id|reference|null: false,foreign_key: true|
|delivery_style_id|reference|null: false,foreign_key: true|
|buyer_id|integer||

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- belongs_to :delivery_style
- has_many :images


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_many :items


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|reference|null: false,foreign_key: true|

### Association
- belongs_to :item


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items


## delivery_stylesテーブル
|Column|Type|Options|
|------|----|-------|
|postage|string|null: false|
|area|string|null: false|
|days|string|null: false|

### Association
- has_many :items


## cardsテーブル
pay.jpで実装

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user