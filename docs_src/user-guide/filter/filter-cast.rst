.. _filter-cast:

##################################################
キャスト関連のフィルター
##################################################
- 変数に設定した値を指定したデータ型にキャスト（型変換）する

.. _filter-cast-koubun:

**************************************************
構文
**************************************************
- 整数型にキャスト

   .. code-block:: yaml

      変数 | int

- 実数型にキャスト

   .. code-block:: yaml

      変数 | float

- 文字型にキャスト

   .. code-block:: yaml

      変数 | string

- bool 型にキャスト

   .. code-block:: yaml

      変数 | bool

.. _filter-cast-rei:

**************************************************
使用例
**************************************************

.. _filter-cast-rei-1:

整数型にキャスト
==================================================
.. literalinclude:: ./yaml/filter7.yml
   :language: yaml
   :emphasize-lines: 9

実行ログです。実数型を整数型にキャストするとき、小数点部分は切り捨てします。クオーテーション（ ``"`` や ``'`` ）でくくった文字列が数字と判断できる値は整数型にキャストします。数字ではないと判断された文字列はキャスト後の値は 0 です。

.. literalinclude:: ./log/filter7.log
   :language: none

.. _filter-cast-rei-2:

実数型にキャスト
==================================================
.. literalinclude:: ./yaml/filter8.yml
   :language: yaml
   :emphasize-lines: 9

実行ログです。整数型を実数型にキャストするとき、.0 を付け加えます。クオーテーション（ ``"`` や ``'`` ）でくくった文字列が数字と判断できる値は実数型にキャストします。数字ではないと判断された文字列はキャスト後の値は 0.0 です。

.. literalinclude:: ./log/filter8.log
   :language: none

.. _filter-cast-rei-3:

文字型にキャスト
==================================================
.. literalinclude:: ./yaml/filter9.yml
   :language: yaml
   :emphasize-lines: 9

実行ログです。数値はそのままの値で文字型に変換します。 True / true / yes などの bool 型の値は文字列 True に変換します。 False / false / no などの bool 型の値は文字列 False に変換します。

.. literalinclude:: ./log/filter9.log
   :language: none

.. _filter-cast-rei-4:

bool 型にキャスト
==================================================
.. literalinclude:: ./yaml/filter10.yml
   :language: yaml
   :emphasize-lines: 9

実行ログです。数値の 1 , 1.0 と文字列 yes , True , True , TRUE などは True に変換します。それ以外は False に変換します。

.. literalinclude:: ./log/filter10.log
   :language: none
