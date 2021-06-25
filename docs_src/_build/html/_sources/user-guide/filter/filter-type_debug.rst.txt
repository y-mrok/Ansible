.. _filter-type_debug:

##################################################
type_debug フィルター
##################################################
- 変数の型を返す

.. _filter-type_debug-koubun:

**************************************************
構文
**************************************************
.. code-block:: yaml

   変数 | type_debug

.. _filter-type_debug-rei:

**************************************************
使用例
**************************************************
ループ変数 item にいろいろな種類の値を設定して型を調べるプレイです。

.. literalinclude:: ./yaml/filter6.yml
   :language: yaml
   :emphasize-lines: 9

実行ログです。

.. literalinclude:: ./log/filter6.log
   :language: none
