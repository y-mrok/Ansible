.. _errorhandling-sonota-max_fail_percentage:

##################################################
タスクの実行の失敗を許容する台数を割合で設定する
##################################################
通常、実行管理対象ノードの全台が最終的にタスクの実行に失敗したら、その時点でプレイの実行は終了です。

``max_fail_percentage`` ディレクティブは、タスクの実行の失敗を許容する台数を実行対象の管理対象ノードの台数の割合（パーセンテージ）で指定します。例えば、 10 台の管理対象ノード内 5 台まではタスクの実行に失敗することを許容する場合 50 を指定します。タスクの実行が終了した時点で延べ 6 台以上が失敗した場合、そこでプレイの実行を終了します。

インベントリです。

.. literalinclude:: ./yaml/hosts3.yml
   :language: yaml

タスク [Checking the file, part 1] で :command:`diff` コマンドの実行に失敗するときはエラーにします。タスク [Checking the file, part 2] でファイルに差異がないときはエラーにします。エラーを許容するのは全管理対象ノードの 50% （ = 5 台 ）までとします。

.. literalinclude:: ./yaml/error13.yml
   :language: yaml
   :emphasize-lines: 5

実行ログです。

.. literalinclude:: ./log/error13.log
   :language: none

タスク [Checking the file, part 1] で 10 台の管理対象ノードの内 3 台がエラーになりました。まだ許容台数内なので、残った 7 台がタスク  [Checking the file, part 2] に進みました。タスク  [Checking the file, part 2] で 7 台の内 2 台がエラーになり、延べ 5 台がエラーになりました。まだ許容台数内なので、残った 5 台が次のタスクへ進みました。

次にタスク [Checking the file, part 1] で :command:`diff` コマンドの実行に失敗するときはエラーにします。タスク [Checking the file, part 2] でファイルに差異がないときはエラーにします。エラーを許容するのは全管理対象ノードの 50% （ = 5 台 ）までとします。

.. literalinclude:: ./yaml/error14.yml
   :language: yaml
   :emphasize-lines: 5

実行ログです。

.. literalinclude:: ./log/error14.log
   :language: none

タスク [Checking the file, part 1] で 10 台の管理対象ノードの内 3 台がエラーになりました。まだ許容台数内なので、残った 7 台がタスク  [Checking the file, part 2] に進みました。タスク  [Checking the file, part 2] で 7 台の内 5 台がエラーになり、延べ 8 台がエラーになりました。許容台数内を超えたのでタスク  [Checking the file, part 2] でプレイの実行を終了しました。

.. note::

   ``max_fail_percentage`` ディレクティブは targets セクションに設定します。各タスクに設定できません。

``max_fail_percentage`` ディレクティブで ``any_errors_fatal`` ディレクティブと同様に 1 台でもタスクの実行に失敗したときにプレイの実行を終了させるには 0 （ = 0% ）を指定します。

.. literalinclude:: ./yaml/error15.yml
   :language: yaml
   :emphasize-lines: 5

実行ログです。タスク [Checking the file, part 1] でエラーが発生したので、プレイの実行はこのタスクで終了しました。

.. literalinclude:: ./log/error15.log
   :language: none
