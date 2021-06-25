.. _errorhandling-sonota-changed_when:

##################################################
"changed" と判断する条件を定義する
##################################################
- ``changed_when`` ディレクティブでタスクを実行した結果、管理対象ノードの状態が変化された（ **changed** ）と判断する条件を定義する
- ``changed_when`` ディレクティブで定義した条件式はタスクの実行後に評価する
- 条件式の書式は :ref:`when ディレクティブ <jyoken>` と同じ

.. include:: ./errorhandling-sonota-changed_when-usage.txt
.. include:: ./errorhandling-sonota-changed_when-ok.txt