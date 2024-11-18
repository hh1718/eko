# 環境構築

## 構築手順
1. さくらサーバーの「バックアップ&ステージング SnapUP」からSnupUpへ
1. 本番からsnupshot作成
1. snapshotからstganig環境にデプロイ
1. データ補正
  1. 本番からeko2019dbのデータをdumpしてローカルに持ってくる(get_data.shでeko2019.dumpを取得)
  1. dumpデータをwpnew_postmetaテーブル(eko2019_wpnew_postmeta.dump)とそれ以外(eko2019_light.dump)に分ける(wpnew_postmetaだけデータが大きくてphpadminからimportできない.)
  1. wpnew_postmetaテーブル以外の「eko.co.jp」をstaging環境のドメインに置換して、zipを作りphpadminからimport
  1. wpnew_postmetaは9ファイルにinsertを分割して、「eko.co.jp」をstaging環境のドメインに置換して、zipを作りphpadminからimport
  1. https://ドメイン名/wp/wp-adminにアクセス。(認証はデータを入れ替えてるので本番と同じになる)
  1. 一度adminにアクセスするとdbが更新されて、staging環境のリンクが有効になる

## ドメイン置換とzip生成
./eko/replace_domain_and_make_zip.shがドメイン置換とzip生成のスクリプトになっている。よって
1. wpnew_postmetaテーブルの分割を実行
1. ./eko/replace_domain_and_make_zip.shのファイル内変数のreplace_before="eko.co.jp", replace_after="新ドメイン名"にしてスクリプトを実行

## wpnew_postmetaテーブルの分割
1. wpnew_postmetaテーブルのdumpからinsert分のみのファイルを作る(ファイル名はeko2019_wpnew_postmeta_insert.dump)
2. ./eko/make_wpnew_postmeta.shを実行すると分割したdumpファイルが作られる
