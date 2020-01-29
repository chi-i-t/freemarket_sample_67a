# freemarket_sample_36a DB設計


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|bithday|string|null: false|
|postal_code|string｜null: false|
|adress|string|null: false|
|shipping_address|string||
|phone_number|string|null: false|

### Association
- has_many :items
- has_many :coments


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|user_id|reference|foreign_key: true|
|large_categorycategory_id|reference|foreign_key: true|
|medium_categorycategory_id|reference|foreign_key: true|
|small_categorycategory_id|reference|foreign_key: true|
|brand_id|reference|foreign_key: true|
|size_id|reference|foreign_key: true|
|item_status_id|reference|foreign_key: true|
|delivery_style_id|reference|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :large_category
- belongs_to :medium_category
- belongs_to :small_category
- belongs_to :brand
- belongs_to :size
- belongs_to :item_status
- belongs_to :delivery_style
- has_many :images
- has_many :coments


## larg-categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||

### Association
- has_many :items
- belongs_to :medium_category


## medium_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
|large_category_id|reference|foreign_key: true|

### Association
- has_many :items
- belongs_to :large_category
- belongs_to :small_category


## small_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
|medium_category_id|reference|foreign_key: true|

### Association
- has_many :items
- belongs_to :medium_category


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|reference|foreign_key: true|

### Association
- belongs_to :item


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||

### Association
- has_many :items


## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||

### Association
- has_many :items


## item_statusテーブル
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


## comentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|use_id|reference|foreign_key: true|
|item_id|reference|foreign_key: true||

### Association
- belongs_to :item
- belongs_to :user


## credit_cards
pay.jpで実装するので不要
