# README

## 開発環境
* Ruby 2.3.1
* Rails 5.0.0.1

## データベース設計

##### messagesテーブル
>チャットのメッセージを保存する

columns |type   |constraint |index
:-------|:------|:----------|:----:
body    |text   |           |-
image   |string |           |-
group_id|integer|foreign_key|○※
user_id |integer|foreign_key|-


- belongs_to user
- belongs_to group

※ グループごとにメッセージが管理されているため、検索しやすいようにgroup_idにindexを貼る

<br>

##### usersテーブル
>ユーザーを保存する

columns           |type  |constraint          |index
:-----------------|:-----|:-------------------|:----:
name              |string|not null, unique    |○※
email             |string|not null, unique    |-
encrypted_password|string|not null            |-


- has_many messages
- has_many group_members
- has_many groups, through: :group_members

※ グループにチャットメンバーを追加するときに名前から選択するため、nameはuniqueとし、indexを貼る

<br>

##### groupsテーブル
>グループを保存する

columns|type  |constraint|index
:------|:-----|:---------|:----:
name   |string|not null  |-


- has_many messages
- has_many group_members
- has_many users, through: :group_members

<br>

##### group_membersテーブル
>グループとユーザーの対応関係を保存する

columns |type   |constraint |index
:-------|:------|:----------|:----:
group_id|integer|foreign_key|○※
user_id |integer|foreign_key|○※

※ groups <=> users間の参照を高速化するため、indexを貼る
