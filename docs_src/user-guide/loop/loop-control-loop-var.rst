.. _loop-control-loop-var:

##################################################
ループ変数を指定：loop_var
##################################################
``loop_var`` ディレクティブを使用してループ変数に item 以外の変数名を指定します。

ループ変数 item を使用した例です。

.. literalinclude:: ./yaml/dnf.yml
   :language: yaml
   :emphasize-lines: 9

.. literalinclude:: ./log/dnf.log
   :language: none
   :emphasize-lines: 6-9

ループ変数に item の代わりに pkg_name を指定した例です。

.. literalinclude:: ./yaml/dnf2.yml
   :language: yaml
   :emphasize-lines: 9, 12-13

タスク内でループ変数を item 以外に変更しても、実行ログは item で表示されます。

.. literalinclude:: ./log/dnf2.log
   :language: none
   :emphasize-lines: 6-9
