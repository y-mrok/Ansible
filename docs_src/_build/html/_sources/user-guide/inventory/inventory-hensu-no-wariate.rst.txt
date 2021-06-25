.. _inventory-hensu-no-wariate:

##################################################
変数の割り当て
##################################################
インベントリ内に管理対象ノードやグループに変数を割り当てられます。割り当てた変数はプレイ内で参照できます。

管理対象ノードに変数を割り当てた例です。管理対象ノードに割り当てた変数なので、これも「ホスト変数」です。

.. literalinclude:: ./yaml/hosts6.yml
   :language: yaml
   :emphasize-lines: 22

グループに変数を割り当てた例です。グループに割り当てた変数を「グループ変数」と呼びます。

.. literalinclude:: ./yaml/hosts7.yml
   :language: yaml
   :emphasize-lines: 10-11 

グループに変数を割り当てると、グループに含まれるすべての管理対象ノードに変数が割り当たります。下記は管理対象ノードごとに変数を割り当て直したインベントリです。

.. literalinclude:: ./yaml/hosts8.yml
   :language: yaml
   :emphasize-lines: 15, 20
