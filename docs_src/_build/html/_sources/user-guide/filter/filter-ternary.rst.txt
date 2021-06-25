.. _filter-ternary:

##################################################
ternary フィルター
##################################################
- bool 型の変数に設定された値（ true / false / null ）や条件式の結果により異なる値を返す

.. _filter-ternary-koubun:

**************************************************
構文
**************************************************
.. code-block:: yaml

   bool 型の変数または条件式 | ternary( true の時に返す値 , false の時に返す値 , null の時に返す値 )

※ null の時に返す値は省略できます。

.. _filter-ternary-rei:

**************************************************
使用例
**************************************************

.. _filter-ternary-rei-1:

ture / false の場合
==================================================
条件式の結果により異なる値を返します。

.. literalinclude:: ./yaml/filter4.yml
   :language: yaml
   :emphasize-lines: 9

実行ログです。

.. literalinclude:: ./log/filter4.log
   :language: none
   :emphasize-lines: 6-11

.. _filter-ternary-rei-2:

ture / false / null の場合
==================================================
条件式の結果により異なる値を返します。

.. literalinclude:: ./yaml/filter5.yml
   :language: yaml
   :emphasize-lines: 9

実行ログです。

.. literalinclude:: ./log/filter5.log
   :language: none
   :emphasize-lines: 6-14
