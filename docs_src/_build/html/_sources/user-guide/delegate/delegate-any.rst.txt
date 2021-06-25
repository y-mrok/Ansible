.. _delegate-any:

##################################################
任意のノードでプレイを実行
##################################################
「 :ref:`delegate-control` 」の「 :ref:`delegate-control-command` 」でインベントリファイルの代わりに ``localhost`` や IP アドレス（ ``127.0.0.1`` ）を指定してプレイを実行する方法を示しました。

同様の方法で任意のノードを指定してプレイを実行できます。指定するノードは「 :ref:`delegate-node-non-inventory` 」や「 :ref:`delegate-node-non-inventory-non-host-vars` 」の条件を満たす必要があります。

使用するプレイです。

.. literalinclude:: ./yaml/delegate12.yml
   :language: yaml

.. _delegate-any-host-vars:

**************************************************
host_vars ディレクトリ内だけに定義したノードを指定
**************************************************
:file:`host_vars/` ディレクトリ内だけに定義したノード carbon でプレイを実行したときのログです。

.. literalinclude:: ./log/delegate-any-1.log
   :language: none
   :emphasize-lines: 1

**************************************************
IP アドレスやホスト名でノードを指定
**************************************************
IP アドレスを指定して実行したときのログです。

.. literalinclude:: ./log/delegate-any-2.log
   :language: none
   :emphasize-lines: 1


ホスト名を指定して実行したときのログです。

.. literalinclude:: ./log/delegate-any-3.log
   :language: none
   :emphasize-lines: 1
