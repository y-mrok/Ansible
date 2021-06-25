.. _inventory-hostname:

##################################################
インベントリ内のホスト名
##################################################
- インベントリ内のホスト名はインベントリ内で管理対象ノードを識別するために使用する
- インベントリ内のホスト名と管理対象ノードの実際のホスト名は異なっていても支障はない
- 管理対象ノードに接続するときは ``ansible_host`` などに設定した情報を使用する（「 :ref:`inventory-no-kihon` 」を参照）

インベントリの内容

.. literalinclude:: ./yaml/hosts12.yml
   :language: yaml

``ansible`` コマンドを使用して管理対象ノード上で :command:`hostname` コマンドを実行した結果

.. code-block:: none

   piyo@vmpc:~/example/ex1$ ansible all -i hosts.yml -a hostname
   server1 | CHANGED | rc=0 >>
   hydrogen.exam.local
   server2 | CHANGED | rc=0 >>
   helium.exam.local
   server3 | CHANGED | rc=0 >>
   lithium.exam.local
   piyo@vmpc:~/example/ex1$ 

server1 の実行結果に hydrogen.exam.local が表示されたように、インベントリ内のホスト名と管理対象ノードの実際のホスト名が異なっていても支障なく実行できることが確認できます。
