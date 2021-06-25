.. _block-sonota:

##################################################
その他
##################################################

.. _block-sonota-hensu:

**************************************************
ブロック変数
**************************************************
- ``vars`` ディレクティブを使用して ``block`` ディレクティブに設定した変数を「ブロック変数」と呼ぶ
- 「ブロック変数」の適用範囲（スコープ）は指定したブロック内に限定される

.. _block-sonota-hensu-rei:

使用例
==================================================
.. literalinclude:: ./yaml/block2.yml
   :language: yaml

上記のプレイの一部をブロック変数に変更したプレイです。同じ変数名を使用していますが、適用範囲はそれぞれのブロックの中に限定されます。

.. literalinclude:: ./yaml/block10.yml
   :language: yaml
   :emphasize-lines: 12, 24, 36-37, 45, 57, 68-69

.. _block-sonota-hensu-soto:

ブロック外で参照
==================================================
ブロック変数をブロックの外で参照したプレイです。

.. literalinclude:: ./yaml/block11.yml
   :language: yaml
   :emphasize-lines: 14-16

localhost 上でプレイを実行したログです。タスク [task-2] でブロック変数をブロックの外で参照したので "VARIABLE IS NOT DEFINED!" が表示されました。

.. literalinclude:: ./log/block11.log
   :language: none
   :emphasize-lines: 12

.. _block-sonota-directive-no-hani:

**************************************************
併用したディレクティブの適用範囲
**************************************************

「 :ref:`block-kihon` 」で ``block`` ディレクティブでグルーピングしたタスクに ``when`` ディレクティブ等を設定すると、 ``block`` ディレクティブに含まれるすべてのタスクに設定したのと同じと説明しました。このルールは ``rescue`` ディレクティブや ``always`` ディレクティブにも適用されます。

.. literalinclude:: ./yaml/block7.yml
   :language: yaml

実行ログです。 ``block`` ディレクティブ、 ``always`` ディレクティブ内の各タスクに ``when`` ディレクティブの条件が適用されています。

.. literalinclude:: ./log/block7.log
   :language: none

.. _block-sonota-loop:

**************************************************
loop ディレクティブとの併用
**************************************************
``block`` ディレクティブと ``loop`` ディレクティブは併用できません。併用すると実行時にエラーになります。

.. literalinclude:: ./yaml/block8.yml
   :language: yaml

実行ログです。

.. literalinclude:: ./log/block8.log
   :language: none
   :emphasize-lines: 2

``block`` ディレクティブでグルーピングした各々のタスクには設定できます。

.. literalinclude:: ./yaml/block9.yml
   :language: yaml

.. literalinclude:: ./log/block9.log
   :language: none
