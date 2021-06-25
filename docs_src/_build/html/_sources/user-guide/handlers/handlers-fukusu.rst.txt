.. _handlers-fukusu:

##################################################
タスクの関連付け
##################################################
「 :ref:`handlers-kihondousa` 」は tasks セクションと handlers セクションのタスクは 1 : 1 で対応しました。必要に応じて m : n で関連付けできます。

インベントリの内容です。

.. literalinclude:: ./yaml/hosts.yml
   :language: yaml

Web Server を構築するプレイです。Web コンテンツは作成していないのでテストページを port:8080/tcp を使用して表示します。タスク [Restart or start httpd.service] の ``listen`` ディレクティブのように、``notify`` ディレクティブと ``listen`` ディレクティブに複数のハンドラー名を指定できます。

.. literalinclude:: ./yaml/handlers2.yml
   :language: yaml
   :emphasize-lines: 11-12, 21-22, 31-32, 40-41, 47-48, 55-57, 64-65

Apache がインストールされていない管理対象ノードに対してプレイを実行したログです。タスク [Syntax check of httpd.conf] は tasks セクション内で 2 回指定されていますが実行は 1 回だけです。タスク [Restart or start httpd.service] は tasks セクション内で 3 回指定されていますが実行は 1 回だけです。このように tasks セクションで handlers セクション内のタスクを複数回指定しても実行は 1 回だけです。

.. literalinclude:: ./log/handlers2.log
   :language: none
