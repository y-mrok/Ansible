.. _errorhandling-sonota-any_errors_fatal:

####################################################
エラー発生時にすべての管理対象ノードの実行を終了する
####################################################

.. _errorhandling-sonota-any_errors_fatal-tujyo:

**************************************************
エラー発生時の通常の動作
**************************************************
タスクの実行時にエラーが発生すると、エラーが発生したタスクを実行した管理対象ノードでの処理が終了し、以降のタスクは実行しません。エラーが発生しなかった管理対象ノードのタスクの実行は継続します。

インベントリの内容です。

.. literalinclude:: ./yaml/hosts2.yml
   :language: yaml

2 つのファイルを比較するプレイです。

.. literalinclude:: ./yaml/error10.yml
   :language: yaml

実行ログです。

.. literalinclude:: ./log/error10.log
   :language: none

管理対象ノード nitrogen はタスク [Checking file differences] でエラーが発生したので、そこで実行を終了しました。管理対象ノード hydrogen はエラーが発生しなかったので最後のタスクまで実行しました。このように、 Ansible はタスクの実行でエラーが発生した管理対象ノードにおけるプレイの実行をエラーが発生したタスクで終了します。

.. _errorhandling-sonota-any_errors_fatal-all-end:

****************************************************
エラー発生時にすべての管理対象ノードの実行を終了する
****************************************************
``any_errors_fatal`` ディレクティブを使用して、タスクでエラーが発生したときはすべての管理対象ノードの実行を終了　＝　プレイの実行を終了します。 ``any_errors_fatal`` ディレクティブの設定値です。

.. list-table::
   :header-rows: 1
   :widths: 1, 10

   * - 設定値
     - 意味
   * - yes
     - タスクの実行エラーが発生した場合、すべての管理対象ノードの実行を終了する
   * - no
     - タスクの実行エラーが発生した場合、エラーが発生したタスクを実行した管理対象ノードの実行を終了する（既定値）

``any_errors_fatal`` ディレクティブを使用して書き直したプレイです。

.. literalinclude:: ./yaml/error11.yml
   :language: yaml
   :emphasize-lines: 12

実行ログです。管理対象ノード nitrogen はタスク [Checking file differences] でエラーが発生したので、エラーが発生していない管理対象ノードを含めてすべての管理対象ノードはそのタスクで実行を終了しました。

.. literalinclude:: ./log/error11.log
   :language: none
   :emphasize-lines: 17

管理対象ノード nitrogen を OFF にしたときの実行ログです。不達エラーのときもタスクの実行時のエラーと同様に、すべての管理対象ノードの実行を終了します。

.. literalinclude:: ./log/error11-1.log
   :language: none
   :emphasize-lines: 17

.. _errorhandling-sonota-any_errors_fatal-targets-section:

****************************************************
targets セクション
****************************************************
``any_errors_fatal`` ディレクティブは targets セクションに設定できます。

.. literalinclude:: ./yaml/error12.yml
   :language: yaml
   :emphasize-lines: 5

これはすべてのタスクに **any_errors_fatal: yes** を設定したのと同じです。したがって、いずれかのタスクの実行が失敗すると、その時点ですべての管理対象ノードの実行が終了　＝　プレイの実行が終了します。

実行ログです。管理対象ノード nitrogen はタスク [Checking file differences] でエラーが発生したので、エラーが発生していない管理対象ノードを含めてすべての管理対象ノードはそのタスクで実行を終了しました。

.. literalinclude:: ./log/error12.log
   :language: none
