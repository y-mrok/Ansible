.. _magic-hensu:

##################################################
マジック変数
##################################################
- Ansible が予め用意している変数
- 変数の値の変更はできない

.. _magic-hensu-omona-hensu:

**************************************************
主なマジック変数
**************************************************
.. list-table::
   :header-rows: 1
   :widths: 1, 7

   * - 変数
     - 説明（設定される値）
   * - hostvars
     - 実行対象のすべての管理対象ノードのファクト変数
   * - inventory_hostname
     - インベントリ内の管理対象ノード名
   * - group_names
     - 管理対象ノードが属するグループ名
   * - groups
     - 全グループとグループに含まれる管理対象ノード名

.. note::

   すべてのマジック変数は次のリンクで確認ください。

   `Magic variables <https://docs.ansible.com/ansible/latest/reference_appendices/special_variables.html#magic-variables>`_

.. _magic-hensu-kakunin:

**************************************************
マジック変数の確認
**************************************************
- インベントリの内容

.. literalinclude:: ./yaml/hosts.yml
   :language: yaml

- プレイの内容

.. literalinclude:: ./yaml/sample6.yml
   :language: yaml

- マジック変数の確認結果（実行ログ）

　タスクの実行時に ``inventory_hostname`` と ``group_names`` は実行対象の管理対象ノードに関する値を参照します。

.. literalinclude:: ./log/sample6.log
   :language: none
