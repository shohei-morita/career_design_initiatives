# README

# Career Design Initiatives

## 概要

高校生を対象としたダイレクトリクルーティングサービスです。高校を介さずに、高校生と企業が直接接触できる機会の提供を通して、双方の最適なマッチングの実現を目指しています。

## バージョン
Ruby 2.6.5 Rails 5.2.4

## 機能一覧

**1. 高校生ユーザー**
  - [ ] ログイン機能
    - [ ] メールアドレス、パスワードによる認証
  - [ ] ユーザー登録機能
    - [ ] メールアドレス、パスワードは必須
  - [ ] ユーザー情報登録機能
  - [ ] スカウトメール機能
    - [ ] 企業からのスカウトメールへの返信・削除ができる

**2. 企業ユーザー**
  - [ ] ログイン機能
    - [ ] メールアドレス、パスワードによる認証
  - [ ] ユーザー登録申請機能
    - [ ] アプリオーナーからの承認が必要
  - [ ] 企業情報編集機能
  - [ ] 求人情報の登録機能
    - [ ] 求人情報の削除や公開停止ができる
  - [ ] 生徒検索機能
    - [ ] フリーワード、各種希望から検索できる
  - [ ] リスト登録機能
    - [ ] ターゲットとなる生徒をリスト登録できる
  - [ ] スカウトメール管理機能
    - [ ] 生徒へのスカウトメールの送信ができる

**3. アプリオーナー**
  - [ ] ログイン機能
    - [ ] メールアドレス、パスワードによる認証
  - [ ] アカウント管理機能
    - [ ] 企業ユーザーの登録申請の許可ができる
    - [ ] 生徒ユーザー・企業ユーザーの検索ができる
    - [ ] 生徒ユーザー・企業ユーザーのアカウント停止・削除ができる

## カタログ設計
https://docs.google.com/spreadsheets/d/1d2Po7QcWHHAsKnXg4oeTzDhOoH0xjRVEAi6LSAXLIz0/edit?usp=sharing

## テーブル定義
https://docs.google.com/spreadsheets/d/1K_GzC19o2uQuHV7E-X5R2PQrVA8ZHpUCEC6ZWoinJgA/edit?usp=sharing

## ER図
https://lucid.app/documents/view/fa1bd4da-395c-4d3f-a840-e580bd7cddd3

## 画面遷移図
https://drive.google.com/file/d/1T6vOgqNxB_STy0O3j7uFWDlemCkdhS24/view?usp=sharing

## 画面ワイヤーフレーム
**1. 生徒ユーザー画面**
https://drive.google.com/file/d/1j6NFsvXu3Kx4lxjZbbqSmrr61kuzBquS/view?usp=sharing

**2. 企業ユーザー画面**
https://drive.google.com/file/d/1OKRN1992e_tixjnLrzyMfxEy3kFGFNLa/view?usp=sharing

**3. アプリオーナー画面**
https://drive.google.com/file/d/1vE5SjDO9ImjCRJaG7UJjJUVoLW8g9XJX/view?usp=sharing

## 使用予定Gem
- devise
- ransack
- jp_prefecture
- kaminari
- letter_opener_web
- rinku
