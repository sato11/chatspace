[![wercker status](https://app.wercker.com/status/d33bb0dfda4378cfffc487285f672b72/s/master "wercker status")](https://app.wercker.com/project/byKey/d33bb0dfda4378cfffc487285f672b72)

# README

## 開発環境
* Ruby 2.3.1
* Rails 5.0.0.1

## データベース設計

##### messagesテーブル
>チャットのメッセージを保存する

columns |type             |constraint       |index
:-------|:----------------|:----------------|:----:
body    |text             |                 |-
image   |string           |                 |-
group_id|references :group|foreign_key: true|○※
user_id |references :user |foreign_key: true|○※1

※ グループごとにメッセージが管理されているため、検索しやすいようにgroup_idにindexを貼る

__修正 (2016/11/1)__  
※1 references型で外部キーをとるとデフォルトでindexを貼ってくれる

<br>

##### usersテーブル
>ユーザーを保存する

columns           |type  |constraint                   |index
:-----------------|:-----|:----------------------------|:----:
name              |string|null: false, unique: true    |○※

※ グループにチャットメンバーを追加するときに名前から選択するため、unique: trueとしてindexを貼る

<br>

##### groupsテーブル
>グループを保存する

columns|type  |constraint   |index
:------|:-----|:------------|:----:
name   |string|null: false  |-

<br>

##### group_membersテーブル
>グループとユーザーの対応関係を保存する

columns |type             |constraint       |index
:-------|:----------------|:----------------|:----:
group_id|references :group|foreign_key: true|○※
user_id |references :user |foreign_key: true|○※

※ groups <=> users間の参照を高速化するため、indexを貼る

<br>

### アソシエーション
    class Message < ActiveRecord::Base
      belongs_to :user
      belongs_to :group
    end

    class User < ActiveRecord::Base
      has_many :messages
      has_many :group_members
      has_many :groups, through: :group_members
    end

    class Group < ActiveRecord::Base
      has_many :messages
      has_many :group_members
      has_many :users, through: :group_members
    end

    class GroupMember < ActiveRecord::Base
      belongs_to :user
      belongs_to :group
    end
