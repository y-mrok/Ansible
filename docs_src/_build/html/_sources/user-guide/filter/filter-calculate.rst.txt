.. _filter-calculate:

##################################################
計算関連のフィルター
##################################################
- 変数を元に計算した結果を返す

.. _filter-calculate-koubun:

**************************************************
構文
**************************************************
- n 乗

   .. code-block:: yaml

      変数 | pow(n)

- 平方根

   .. code-block:: yaml

      変数 | root

- 四捨五入

   .. code-block:: yaml

      変数 | round(桁数, 'common')

      小数点第 1 位を四捨五入

      変数 | round

- 切り上げ

   .. code-block:: yaml

      変数 | round(桁数, 'ceil')

- 切り捨て

   .. code-block:: yaml

      変数 | round(桁数, 'floor')

.. note::

   - 四捨五入、切り上げ、切り捨ての "桁数" は、丸めたあと小数点以下の桁数を指定します。

.. _filter-calculate-rei:

**************************************************
使用例
**************************************************
.. literalinclude:: ./yaml/filter15.yml
   :language: yaml

実行ログです。

.. literalinclude:: ./log/filter15.log
   :language: none
