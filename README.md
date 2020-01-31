# freemarket_sample_36a DB設計


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|bithday|string|null: false|
|shipping_address|string||
|phone_number|string|null: false|

### Association
- has_many :items
- belongs_to :adress


## adressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string｜null: false|
|prefectures|string|null: false|
|city|string|null: false|
|adress_number|string|null: false|
|building_name|string|null: false|

### Association
- belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|user_id|reference|null: false,foreign_key: true|
|category_id|reference|null: false,foreign_key: true|
|brand_id|reference|null: false,foreign_key: true|
|item_status_id|reference|null: false,foreign_key: true|
|delivery_style_id|reference|null: false,foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- belongs_to :item_status
- belongs_to :delivery_style
- has_many :images


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
|name|string||

### Association
- has_many :items


## item_statusesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items


## delivery_stylesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items


## credit_cards
pay.jpで実装するので不要
