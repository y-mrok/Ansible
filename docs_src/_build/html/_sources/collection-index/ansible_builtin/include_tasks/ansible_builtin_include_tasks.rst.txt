.. _ansible_builtin_include_tasks:

####################################################################################################
ansible.builtin.include_tasks - タスクを動的に取り込む
####################################################################################################

.. _ansible_builtin_include_tasks-gaiyo:

**************************************************
概要
**************************************************
- 別ファイルに定義したタスクをプレイに動的に取り込みます。

.. _ansible_builtin_include_tasks-parameter:

**************************************************
主なパラメーター
**************************************************
.. list-table::
   :header-rows: 1
   :widths: 1, 1, 5

   * - パラメーター
     - 選択肢／デフォルト
     - 説明
   * - file
     - 
     - 取り込むファイルのパスを指定する

.. _ansible_builtin_include_tasks-usage:

**************************************************
使用例
**************************************************

.. _ansible_builtin_include_tasks-usage-1:

別ファイルに定義したタスクをプレイ内に取り込む
==================================================
インベントリです

.. literalinclude:: ./yaml/hosts.yml
   :language: yaml

.. _ansible_builtin_include_tasks-usage-1-1:

ファイル名を直接指定
--------------------------------------------------
別ファイルに定義したタスクをプレイ内に取り込みます。取り込むファイルは ``ansible.builtin.include_tasks`` に続けて指定します。

.. literalinclude:: ./yaml/sample1.yml
   :language: yaml
   :emphasize-lines: 9-10

取り込むタスクです。

.. literalinclude:: ./yaml/includes/inc_task1.yml
   :language: yaml

実行ログです。 ``ansible.builtin.include_tasks`` モジュールを含むタスクの実行に続けて取り込んだタスクを実行しました。

.. literalinclude:: ./log/sample1.log
   :language: none
   :emphasize-lines: 10-11, 13-21

.. _ansible_builtin_include_tasks-usage-1-2:

"file" パラメーターを使用してファイル名を指定
--------------------------------------------------
``file`` パラメーターを使用して、別ファイルに定義したタスクをプレイ内に取り込みます。取り込むタスクは「 :ref:`ansible_builtin_include_tasks-usage-1-1` 」と同じです。

.. literalinclude:: ./yaml/sample2.yml
   :language: yaml
   :emphasize-lines: 9-11

実行ログです。 ``ansible.builtin.include_tasks`` モジュールを含むタスクの実行に続けて取り込んだタスクを実行しました。

.. literalinclude:: ./log/sample2.log
   :language: none
   :emphasize-lines: 10-11, 13-21

.. _ansible_builtin_include_tasks-usage-2:

取り込むタスクをチェックするタイミング
==================================================
``ansible.builtin.include_tasks`` モジュールで別ファイルに定義したタスクを取り込むタイミングでタスクをチェックします。

プレイです。

.. literalinclude:: ./yaml/sample3.yml
   :language: yaml
   :emphasize-lines: 9-10

取り込むタスクです。網掛け部分に誤りがあります。

.. literalinclude:: ./yaml/includes/inc_task3.yml
   :language: yaml
   :emphasize-lines: 8

実行ログです。 ``ansible.builtin.include_tasks`` モジュールを含むタスクで別ファイルに指定したタスクを取り込むタイミングでエラーが発生しました。

.. literalinclude:: ./log/sample3.log
   :language: none
   :emphasize-lines: 10-11

.. _ansible_builtin_include_tasks-usage-3:

ディレクティブ
==================================================

.. _ansible_builtin_include_tasks-usage-3-1:

become ディレクティブ
--------------------------------------------------
``ansible.builtin.include_tasks`` モジュールを使用したタスクに ``become`` ディレクティブは適用できません。

プレイです。

.. literalinclude:: ./yaml/sample4.yml
   :language: yaml
   :emphasize-lines: 8-10

実行ログです。 ``become`` ディレクティブは有効ではない旨のメッセージが表示されました。

.. literalinclude:: ./log/sample4.log
   :language: none
   :emphasize-lines: 2

.. _ansible_builtin_include_tasks-usage-3-2:

when ディレクティブ
--------------------------------------------------
``when`` ディレクティブは ``ansible.builtin.include_tasks`` モジュールを使用したタスク自体に適用されます。取り込むタスクに継承しません。

インベントリです。

.. literalinclude:: ./yaml/hosts2.yml
   :language: yaml

プレイです。

.. literalinclude:: ./yaml/sample5.yml
   :language: yaml
   :emphasize-lines: 8-10

取り込むタスクです。

.. literalinclude:: ./yaml/includes/inc_task1.yml
   :language: yaml

実行ログです。 ``ansible.builtin.include_tasks`` モジュールを使用したタスクに設定した ``when`` ディレクティブの条件に従い、管理対象ノード cenos83 での実行はスキップしました。取り込むタスクはスキップしなかった管理対象ノード ubuntu2004 だけが実行しました。

.. literalinclude:: ./log/sample5.log
   :language: none
   :emphasize-lines: 17-19, 21-29

.. _ansible_builtin_include_tasks-usage-3-3:

loop ディレクティブ
--------------------------------------------------
``loop`` ディレクティブは ``ansible.builtin.include_tasks`` モジュールを使用したタスク自体に適用されます。取り込むタスクに継承しません。

インベントリです。

.. literalinclude:: ./yaml/hosts.yml
   :language: yaml

プレイです。

.. literalinclude:: ./yaml/sample6.yml
   :language: yaml
   :emphasize-lines: 8-13

取り込むタスクです。タスク [loop The value of the variable] 内でループ変数を参照しています。

.. literalinclude:: ./yaml/includes/inc_task2.yml
   :language: yaml

実行ログです。 ``ansible.builtin.include_tasks`` モジュールを使用したタスクに設定した ``loop`` ディレクティブに従い、取り込むタスクの内容を繰り返し実行しました。取り込むタスク内のタスク [loop The value of the variable] でループ変数の参照ができています。

.. literalinclude:: ./log/sample6.log
   :language: none
   :emphasize-lines: 13-16, 18-66

.. _ansible_builtin_include_tasks-usage-3-4:

tags ディレクティブ
--------------------------------------------------
``tags`` ディレクティブは ``ansible.builtin.include_tasks`` モジュールを使用したタスク自体に適用されます。取り込むタスクに継承しません。

プレイです。

.. literalinclude:: ./yaml/sample7.yml
   :language: yaml
   :emphasize-lines: 9-11

取り込むタスクです。

.. literalinclude:: ./yaml/includes/inc_task5.yml
   :language: yaml

タグ job1 を指定した実行ログです。 ``ansible.builtin.include_tasks`` モジュールを使用したタスクは実行されましたが、取り込むタスク内にタグ job1 を設定したタスクが存在しないため、次のような結果になります。

.. literalinclude:: ./log/sample7.log
   :language: none

タグ job2 を指定した実行ログです。取り込むタスク内にタグ job2 を設定したタスクは存在しますが、``ansible.builtin.include_tasks`` モジュールを使用したタスクはタグ job1 だけ設定しているため、次のような結果になります。

.. literalinclude:: ./log/sample8.log
   :language: none

取り込むタスク内のタグ job2 を指定したタスクを実行するにはタグ job1 と job2 を指定します。

.. literalinclude:: ./log/sample9.log
   :language: none

.. _ansible_builtin_include_tasks-usage-4:

取り込むタスクのファイル名に変数を使用する
==================================================

.. _ansible_builtin_include_tasks-usage-4-1:

ファクト変数
--------------------------------------------------
``ansible.builtin.include_tasks`` モジュールを使用したタスクで、取り込むタスクのファイル名にファクト変数を使用できます。

インベントリです。

.. literalinclude:: ./yaml/hosts2.yml
   :language: yaml

プレイです。

.. literalinclude:: ./yaml/sample16.yml
   :language: yaml
   :emphasize-lines: 8-9

取り込むタスクです。

.. literalinclude:: ./yaml/includes/inc_CentOS.yml
   :language: yaml

.. literalinclude:: ./yaml/includes/inc_Ubuntu.yml
   :language: yaml

実行ログです。ディストリビューションごとにディストリビューション名のファイルが実行されました。

.. literalinclude:: ./log/sample16.log
   :language: none
   :emphasize-lines: 17-19, 21-24, 26-29

.. _ansible_builtin_include_tasks-usage-4-2:

vars セクション
--------------------------------------------------
``ansible.builtin.include_tasks`` モジュールを使用したタスクで、取り込むタスクのファイル名を ``vars`` セクションで定義できます。

インベントリです。

.. literalinclude:: ./yaml/hosts.yml
   :language: yaml

プレイです。

.. literalinclude:: ./yaml/sample17.yml
   :language: yaml
   :emphasize-lines: 5-6, 12-13

取り込むタスクです。

.. literalinclude:: ./yaml/includes/inc_task1.yml
   :language: yaml

実行ログです。 ``vars`` セクションで定義したファイル名で指定したタスクを取り込んで実行しました。

.. literalinclude:: ./log/sample17.log
   :language: none
   :emphasize-lines: 10-11, 13-16, 18-21

