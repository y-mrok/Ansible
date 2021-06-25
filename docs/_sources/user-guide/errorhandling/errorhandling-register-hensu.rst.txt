.. _errorhandling-register-hensu:

##################################################
レジスター変数
##################################################
- ``register`` ディレクティブを使用してレジスター変数を定義する
- レジスター変数はタスクの実行結果を格納する
- 同一名称のレジスター変数を定義した場合、先の定義を後の定義で上書きする
- ``register`` ディレクティブを定義したタスクを含む、それ以降のタスクでレジスター変数の値を参照できる

.. include:: ./errorhandling-register-hensu-kakunin.txt
.. include:: ./errorhandling-register-hensu-naiyo.txt