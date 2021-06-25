.. _ansible_builtin_import_tasks:

####################################################################################################
ansible.builtin.import_tasks - タスクを静的に取り込む
####################################################################################################

.. _ansible_builtin_import_tasks-gaiyo:

**************************************************
概要
**************************************************
- 別ファイルに定義したタスクをプレイに静的に取り込みます。

.. _ansible_builtin_import_tasks-parameter:

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

.. _ansible_builtin_import_tasks-usage:

**************************************************
使用例
**************************************************

.. _ansible_builtin_import_tasks-usage-1:

別ファイルに定義したタスクをプレイ内に取り込む
==================================================
インベントリです

.. literalinclude:: ./yaml/hosts.yml
   :language: yaml

.. _ansible_builtin_import_tasks-usage-1-1:

ファイル名を直接指定
--------------------------------------------------
別ファイルに定義したタスクをプレイ内に取り込みます。取り込むファイルは ``ansible.builtin.import_tasks`` に続けて指定します。

.. literalinclude:: ./yaml/sample7.yml
   :language: yaml
   :emphasize-lines: 9-10

取り込むタスクです。

.. literalinclude:: ./yaml/imports/imp_task1.yml
   :language: yaml

実行ログです。 ``ansible.builtin.import_tasks`` モジュールを含むタスクの位置で、取り込んだタスクを実行しました。 ``ansible.builtin.import_tasks`` モジュールを含むタスクの実行ログは出力されません。

.. literalinclude:: ./log/sample7.log
   :language: none
   :emphasize-lines: 10-18

.. _ansible_builtin_import_tasks-usage-1-2:

"file" パラメーターを使用してファイル名を指定
--------------------------------------------------
``file`` パラメーターを使用して、別ファイルに定義したタスクをプレイ内に取り込みます。取り込むタスクは「 :ref:`ansible_builtin_import_tasks-usage-1-1` 」と同じです。

.. literalinclude:: ./yaml/sample8.yml
   :language: yaml
   :emphasize-lines: 9-11

実行ログです。 ``ansible.builtin.import_tasks`` モジュールを含むタスクの位置で、取り込んだタスクを実行しました。 ``ansible.builtin.import_tasks`` モジュールを含むタスクの実行ログは出力されません。

.. literalinclude:: ./log/sample8.log
   :language: none
   :emphasize-lines: 10-18

.. _ansible_builtin_import_tasks-usage-2:

取り込むタスクをチェックするタイミング
==================================================
プレイの実行前にタスクをチェックします。

プレイです。

.. literalinclude:: ./yaml/sample9.yml
   :language: yaml
   :emphasize-lines: 9-10

取り込むタスクです。網掛け部分に誤りがあります。

.. literalinclude:: ./yaml/imports/imp_task3.yml
   :language: yaml
   :emphasize-lines: 8

実行ログです。タスクを実行する前の解析段階で誤りを見つけました。

.. literalinclude:: ./log/sample9.log
   :language: none

.. _ansible_builtin_import_tasks-usage-3:

ディレクティブ
==================================================

.. _ansible_builtin_import_tasks-usage-3-1:

become ディレクティブ
--------------------------------------------------
``ansible.builtin.import_tasks`` モジュールを使用したタスクに ``become`` ディレクティブを適用すると、取り込むタスク内の各タスクに継承します。すなわち、取り込むタスクの各タスクに ``bocome`` ディレクティブを設定したのと同じ動作をします。

プレイです。

.. literalinclude:: ./yaml/sample11.yml
   :language: yaml
   :emphasize-lines: 9-11

取り込むタスクです。

.. literalinclude:: ./yaml/imports/imp_task4.yml
   :language: yaml

実行ログです。 ``ansible.builtin.user`` モジュールと ``ansible.builtin.dnf`` モジュールはともに管理者権限が必要なモジュールですが各タスクに ``become`` ディレクティブは設定していません。しかし、タスク [import tasks] に設定した ``become`` ディレクティブを継承したため、正常に実行しました。

.. literalinclude:: ./log/sample11.log
   :language: none

タスク [import tasks] から ``become`` ディレクティブを削除したプレイです。

.. literalinclude:: ./yaml/sample10.yml
   :language: yaml

実行ログです。取り込むタスク内の各タスクに ``become`` ディレクティブを設定しておらず、継承元のタスク [import tasks] にも ``become`` ディレクティブが設定していないのでエラーになりました。

.. literalinclude:: ./log/sample10.log
   :language: none
   :emphasize-lines: 11

.. _ansible_builtin_import_tasks-usage-3-2:

when ディレクティブ
--------------------------------------------------
``ansible.builtin.import_tasks`` モジュールを使用したタスクに ``when`` ディレクティブを適用すると、取り込むタスク内の各タスクに継承します。すなわち、取り込むタスクの各タスクに ``when`` ディレクティブを設定したのと同じ動作をします。

インベントリです。

.. literalinclude:: ./yaml/hosts2.yml
   :language: yaml

プレイです。

.. literalinclude:: ./yaml/sample12.yml
   :language: yaml
   :emphasize-lines: 8-10

取り込むタスクです。

.. literalinclude:: ./yaml/imports/imp_task1.yml
   :language: yaml

実行ログです。 ``ansible.builtin.import_tasks`` モジュールを使用したタスクに設定した ``when`` ディレクティブを取り込むタスク内の各タスクが継承しました。その結果、取り込むタスクの各タスクの実行結果に **skipping** などを表示しました。

.. literalinclude:: ./log/sample12.log
   :language: none
   :emphasize-lines: 17-27

.. _ansible_builtin_import_tasks-usage-3-3:

loop ディレクティブ
--------------------------------------------------
``loop`` ディレクティブは ``ansible.builtin.import_tasks`` モジュールを使用したタスク自体に適用できません。

プレイです。

.. literalinclude:: ./yaml/sample13.yml
   :language: yaml
   :emphasize-lines: 9-14

実行ログです。 ``loop`` ディレクティブは使用できない旨のメッセージが表示されました。

.. literalinclude:: ./log/sample13.log
   :language: none
   :emphasize-lines: 2

.. _ansible_builtin_import_tasks-usage-3-4:

tags ディレクティブ
--------------------------------------------------
``ansible.builtin.import_tasks`` モジュールを使用したタスクに ``tags`` ディレクティブを適用すると、取り込むタスク内の各タスクに継承します。すなわち、取り込むタスクの各タスクに ``tags`` ディレクティブを設定したのと同じ動作をします。

プレイです。

.. literalinclude:: ./yaml/sample1.yml
   :language: yaml
   :emphasize-lines: 9-11

取り込むタスクです。

.. literalinclude:: ./yaml/imports/imp_task5.yml
   :language: yaml

タグ job1 を指定した実行ログです。 ``ansible.builtin.import_tasks`` モジュールを使用したタスクに設定した ``tags`` ディレクティブを取り込むタスク内の各タスクが継承しました。

.. literalinclude:: ./log/sample1.log
   :language: none

タグ job2 を指定した実行ログです。タグ job2 を設定したタスクだけを実行しました。

.. literalinclude:: ./log/sample2.log
   :language: none

.. _ansible_builtin_import_tasks-usage-4:

取り込むタスクのファイル名に変数を使用する
==================================================

.. _ansible_builtin_import_tasks-usage-4-1:

ファクト変数
--------------------------------------------------
``ansible.builtin.import_tasks`` モジュールを使用したタスクで、取り込むタスクのファイル名にファクト変数は使用できません。

インベントリです。

.. literalinclude:: ./yaml/hosts2.yml
   :language: yaml

プレイです。

.. literalinclude:: ./yaml/sample14.yml
   :language: yaml
   :emphasize-lines: 8-9

実行ログです。ファクト変数などはファイル名に使用できないと表示されました。

.. literalinclude:: ./log/sample14.log
   :language: none
   :emphasize-lines: 4-6

.. _ansible_builtin_import_tasks-usage-4-2:

vars セクション
--------------------------------------------------
``ansible.builtin.import_tasks`` モジュールを使用したタスクで、取り込むタスクのファイル名を ``vars`` セクションで定義できます。

インベントリです。

.. literalinclude:: ./yaml/hosts.yml
   :language: yaml

プレイです。

.. literalinclude:: ./yaml/sample15.yml
   :language: yaml
   :emphasize-lines: 5-6, 12-13

取り込むタスクです。

.. literalinclude:: ./yaml/imports/imp_task1.yml
   :language: yaml

実行ログです。 ``vars`` セクションで定義したファイル名で指定したタスクを取り込んで実行しました。

.. literalinclude:: ./log/sample15.log
   :language: none
   :emphasize-lines: 10-13, 15-18

