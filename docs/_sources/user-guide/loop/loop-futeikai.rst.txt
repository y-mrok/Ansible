.. _loop-futeikai:

##################################################
不定回の繰り返し
##################################################
``until`` ディレクティブを使用すると、条件を満たすまでタスクを繰り返し実行します。 ``until`` ディレクティブを使用した Apache(httpd) の最新版をインストールするプレイです。

.. literalinclude:: ./yaml/until.yml
   :language: yaml
   :emphasize-lines: 13-15

このプレイは ``until`` ディレクティブを使用し、正常にインスールできるまで 30 秒ごとに最大 10 回繰り返し実行します。

.. list-table::
   :header-rows: 1
   :widths: 1,5

   * - ディレクティブ
     - 説明
   * - until
     - 繰り返しを終える条件
   * - retries
     - 繰り返し回数の上限（既定値：3 ）
   * - delay
     - タスクの実行間隔（単位：秒）（既定値：5 ）

10 回（ retries: 10 ）Apache をインストールしようとしましたがすべて失敗したときの実行ログです。

.. literalinclude:: ./log/until.log
   :language: none
   :emphasize-lines: 6-16

繰り返しの途中で Apache を正常にインストールできたときの実行ログです。正常にインストールできた時点で繰り返しを中断しました。

.. literalinclude:: ./log/until1.log
   :language: none
   :emphasize-lines: 6-9
