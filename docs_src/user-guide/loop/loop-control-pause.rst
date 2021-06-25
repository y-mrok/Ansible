.. _loop-control-pause:

##################################################
ループの実行を指定秒数だけ停止：pause
##################################################
``pause`` ディレクティブを使用してタスクの実行後、ループの実行を指定秒数だけを停止します。

.. literalinclude:: ./yaml/date.yml
   :language: yaml
   :emphasize-lines: 14-15

実行ログです。網掛け部分が :command:`date` コマンドの実行結果です。（おおよそ）10 秒ごとに実行しています。

.. literalinclude:: ./log/date.log
   :language: none
   :emphasize-lines: 48, 82, 116
