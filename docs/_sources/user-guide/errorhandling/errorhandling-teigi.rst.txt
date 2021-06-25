.. _errorhandling-teigi:

##################################################
エラーと判断する条件を定義する
##################################################
- ``failed_when`` ディレクティブでタスクのエラー条件を定義する
- ``failed_when`` ディレクティブで定義した条件式はタスクの実行後に評価する
- 条件式の書式は :ref:`when ディレクティブ <jyoken>` と同じ

2 つのファイルを比較する :command:`diff` コマンドのリターンコード（ rc ）です。

- rc ＝ 0 ： ファイルの内容が同じ
- rc ＝ 1 ： ファイルの内容が異なる
- rc ≧ 2 ： エラー（ファイルが存在しない 等）

上記を踏まえてエラーのときだけタスクの実行を失敗するようにしたプレイです。 ``register`` 変数を使用しリターンコードでタスクの実行状況を判断します。

.. literalinclude:: ./yaml/error9.yml
   :language: yaml
   :emphasize-lines: 13-15

ファイルの内容が同じときの実行ログです。 ``failed_when`` ディレクティブに指定した条件に合致しないのでプレイの最後のタスクまで実行しました。

.. literalinclude:: ./log/error9.log
   :language: none
   :emphasize-lines: 28, 29

ファイルの内容が異なるときの実行ログです。 ``failed_when`` ディレクティブに指定した条件に合致しないのでプレイの最後のタスクまで実行しました。

.. literalinclude:: ./log/error9-1.log
   :language: none
   :emphasize-lines: 28, 30

比較するファイルの 1 つが存在しないときの実行ログです。 ``failed_when`` ディレクティブに指定した条件に合致したのでエラーになりました。

.. literalinclude:: ./log/error9-2.log
   :language: none

条件式の部分です。今回はリターンコードが 0 でも 1 でもないときにエラーと定義しました。

.. code-block:: yaml

   failed_when:
     - result_of_diff['rc'] != 0
     - result_of_diff['rc'] != 1   

次のように記述しても同じことです。

.. code-block:: yaml

   failed_when: result_of_diff['rc'] not in [0, 1]

2 以上がエラーということに着目すると、次のような条件式になります。

.. code-block:: yaml

   failed_when: result_of_diff['rc'] >= 2

ファイルが存在しないときだけエラーにするのであれば、レジスター変数内の **stderr** を使用して次のような条件式を指定できます。

.. code-block:: yaml

   failed_when: "'No such file or directory' in result_of_diff['stderr']"
