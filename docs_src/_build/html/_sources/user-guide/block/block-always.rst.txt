.. _block-always:

##################################################
常に実行するタスク
##################################################
- ``always`` ディレクティブを使用して ``block`` ディレクティブでグルーピングしたタスクでエラーが発生する／しないに関わらず常に実行するタスクを指定する
- タスクの実行順序　：　``block`` ディレクティブ　→　``rescue`` ディレクティブ　→　``always`` ディレクティブ

インベントリの内容です。

.. literalinclude:: ./yaml/hosts.yml
   :language: yaml

.. _block-always-rescue-ari:

**************************************************
rescue ディレクティブあり
**************************************************
``rescue`` ディレクティブありの ``always`` ディレクティブを使用したプレイです。

.. literalinclude:: ./yaml/block5.yml
   :language: yaml
   :emphasize-lines: 21-25

実行ログです。

.. literalinclude:: ./log/block5.log
   :language: none

管理対象ノード centos83 は ``block`` ディレクティブ内のタスク [task-3] でエラーが発生したので ``rescue`` ディレクティブ、 ``always`` ディレクティブの順にタスクを実行した後に tasks セクションの最後のタスクまで実行しました。

管理対象ノード ubuntu2004 は ``block`` ディレクティブ、 ``always`` ディレクティブの順にタスクを実行した後に tasks セクションの最後のタスクまで実行しました。

管理対象ノードごとのタスクの実行順序です。該当するタスクがない場合は "n/a" で表記します。

.. list-table::
   :header-rows: 1
   :widths: 1, 2, 2

   * - 実行順序
     - centos83
     - ubuntu2004
   * - 1
     - task-1
     - task-1
   * - 2
     - block : task-2
     - block : task-2
   * - 3
     - block : task-3 ※エラー発生※
     - block : task-3 (skipping)
   * - 4
     - rescue : task-7
     - block : task-4
   * - 5
     - rescue : task-8
     - always : task-9
   * - 6
     - always : task-9
     - always : task-10
   * - 7
     - always : task-10
     - task-5
   * - 8
     - task-5
     - n/a

.. _block-always-rescue-nashi:

**************************************************
rescue ディレクティブなし
**************************************************
``rescue`` ディレクティブなしの ``always`` ディレクティブを使用したプレイです。


.. literalinclude:: ./yaml/block6.yml
   :language: yaml
   :emphasize-lines: 16-20

実行ログです。

.. literalinclude:: ./log/block6.log
   :language: none

管理対象ノード centos83 は ``block`` ディレクティブ内のタスク [task-3] でエラーが発生したので  ``always`` ディレクティブ内のタスクを実行して処理を終了しました。

管理対象ノード ubuntu2004 は ``block`` ディレクティブ、 ``always`` ディレクティブの順にタスクを実行した後に tasks セクションの最後のタスクまで実行しました。


管理対象ノードごとのタスクの実行順序です。該当するタスクがない場合は "n/a" で表記します。

.. list-table::
   :header-rows: 1
   :widths: 1, 2, 2

   * - 実行順序
     - centos83
     - ubuntu2004
   * - 1
     - task-1
     - task-1
   * - 2
     - block : task-2
     - block : task-2
   * - 3
     - block : task-3 ※エラー発生※
     - block : task-3 (skipping)
   * - 4
     - always : task-9
     - block : task-4
   * - 5
     - always : task-10
     - always : task-9
   * - 6
     - n/a
     - always : task-10
   * - 7
     - n/a
     - task-5
