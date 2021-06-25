.. _filter-strftime:

##################################################
strftime フィルター
##################################################
- 指定した `UNIX 時間 <https://ja.wikipedia.org/wiki/UNIX時間>`_ から文字型の日付、時刻を返す
- UNIX 時間を省略したときは現在の日付、時刻を返す

.. _filter-strftime-koubun:

**************************************************
構文
**************************************************
.. code-block:: none

   '書式' | strftime( UNIX時間 )

.. code-block:: none

   '書式' | strftime

.. list-table:: 書式
   :header-rows: 1
   :widths: 1, 5

   * - 書式
     - 意味
   * - %Y
     - 西暦年（ 4 桁）
   * - %m
     - 月（ 2 桁）
   * - %h
     - 月（英語表記）
   * - %d
     - 日（ 2 桁）
   * - %D
     - 日付（ MM/DD/YY ）
   * - %H
     - 時（ 2 桁）
   * - %M
     - 分（ 2 桁）
   * - %S
     - 秒（ 2 桁）

.. _filter-strftime-rei:

**************************************************
使用例
**************************************************
.. literalinclude:: ./yaml/filter12.yml
   :language: yaml

実行ログです。

.. literalinclude:: ./log/filter12.log
   :language: none
