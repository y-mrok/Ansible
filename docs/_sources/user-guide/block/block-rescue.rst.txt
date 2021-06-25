.. _block-rescue:

##################################################
エラー処理
##################################################
- ``rescue`` ディレクティブを使用すると ``block`` ディレクティブでグループイングしたタスクでエラーが発生しても処理を中断しない
- ``block`` ディレクティブでグルーピングしたタスクのエラー（ fatal ）を ``rescue`` ディレクティブを使用してリカバリする
- ``rescue`` ディレクティブのタスクはエラーが発生した管理対象ノードだけが実行する
- ``rescue`` ディレクティブのタスクは ``block`` ディレクティブの実行後に実行する 

.. _block-rescue-tukaikata:

**************************************************
使い方
**************************************************
インベントリの内容です。

.. literalinclude:: ./yaml/hosts.yml
   :language: yaml

``rescue`` ディレクティブを使用しないときにタスクでエラーが発生した場合の動作を確認します。管理対象ノードの OS が CentOS のとき、タスク [task-3] でエラーが発生します。

.. literalinclude:: ./yaml/block3.yml
   :language: yaml

実行ログです。

.. literalinclude:: ./log/block3.log
   :language: none

管理対象ノード centos83 が タスク [task-3] でエラーが発生してタスクの実行が終了しました。管理対象ノード ubuntu2004 はエラーが発生しなかったので、 tasks セクションの最後のタスクまで実行しました。

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
     - n/a
     - block : task-4
   * - 5
     - n/a
     - task-5

``rescue`` ディレクティブを使用し、 ``block`` ディレクティブでグルーピングしたタスクでエラーが発生したときの動作を確認します。

.. literalinclude:: ./yaml/block4.yml
   :language: yaml
   :emphasize-lines: 16-20

実行ログです。

.. literalinclude:: ./log/block4.log
   :language: none

管理対象ノード centos83 が タスク [task-3] でエラーが発生したので ``block`` ディレクティブ内のタスクの実行が終了しました。すべての管理対象ノードが ``block`` ディレクティブ内のタスクの実行を終了した後に ``rescue`` ディレクティブ内のタスクを実行します。 ``rescue`` ディレクティブ内のタスクの実行後は ``block`` ディレクティブの次のタスクに実行が移り、 tasks セクションの最後のタスクまで実行しました。

管理対象ノード ubuntu2004 はエラーが発生しなかったので、 ``rescue`` ディレクティブのタスクを除いて tasks セクションの最後のタスクまで実行しました。

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
     - task-5
   * - 6
     - task-5
     - n/a

.. _block-rescue-play-recap:

**************************************************
PLAY RECAP
**************************************************
``rescue`` ディレクティブが無い場合のプレイの PLAY RECAP です。管理対象ノード centos83 でエラーが発生したので failed がカウントされています。

.. code-block:: none

   PLAY RECAP *******************************************************************************************************************************************
   centos83                   : ok=3    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
   ubuntu2004                 : ok=5    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   

``rescue`` ディレクティブがある場合のプレイの PLAY RECAP です。管理対象ノード centos83 でエラーが発生したが ``rescue`` ディレクティブでリカバリしたので failed はカウントされません。代わりに ``rescue`` ディレクティブを実行した回数がカウントされます。

.. code-block:: none

   PLAY RECAP *******************************************************************************************************************************************
   centos83                   : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=1    ignored=0   
   ubuntu2004                 : ok=5    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
