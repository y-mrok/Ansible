.. _handlers-kihondousa:

##################################################
基本動作
##################################################
インベントリの内容です。

.. literalinclude:: ./yaml/hosts.yml
   :language: yaml

管理対象ノードに Apache をインストールしたときだけ httpd.service を開始するプレイです。 tasks セクション内のタスクに設定した ``notify`` ディレクティブに指定したハンドラー名と handlers セクション内のタスクに設定した ``listen`` ディレクティブに指定したハンドラー名が同じタスクどうしで関連付けします。

.. literalinclude:: ./yaml/handlers.yml
   :language: yaml
   :emphasize-lines: 15-16, 29-30

管理対象ノードに Apache がインストールされていないときの実行ログです。タスク [Install apache] を実行した結果、管理対象ノードが変更された（ changed ）ので、 tasks セクションの全タスクの実行終了後に handlers セクション内の関連付けされたタスク [Start httpd.service] だけを実行しました。

.. literalinclude:: ./log/handlers.log
   :language: none
   :emphasize-lines: 10-11, 18-19

管理対象ノードに Apache がインストール済みのときの実行ログです。タスク [Install apache] を実行したが管理対象ノードが変更されなかった（ ok ）ので、 tasks セクションの全タスクの実行が終了後に handlers セクション内のタスクは実行しませんでした。

.. literalinclude:: ./log/handlers-1.log
   :language: none
   :emphasize-lines: 10-11
