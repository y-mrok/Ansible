.. _kankyo-setuzoku:

##################################################
コントロールノードから管理対象ノードに接続する準備
##################################################
コントロールノードから管理対象ノードに公開鍵認証方式で接続するための設定を行います。

.. _kankyo-setuzoku-tejun:

**************************************************
手順
**************************************************
#. 鍵を作成
#. 管理対象ノードにアカウント ansible-user を作成
#. 管理対象ノードに公開鍵を登録
#. 管理対象ノードでアカウント ansible-user が管理者権限でコマンドを実行できるよう設定（ sudo の設定）

.. _kankyo-setuzoku-playbook:

**************************************************
プレイブック
**************************************************
「 :ref:`kankyo-setuzoku-tejun` 」の内容のプレイを作成・実行します。

.. _kankyo-setuzoku-playbook-inventory:

インベントリファイル
==================================================
.. literalinclude:: ./yaml/hosts.yml
   :language: yaml

.. _kankyo-setuzoku-playbook-play:

プレイブックファイル
==================================================
.. literalinclude:: ./yaml/node.yml
   :language: yaml

.. _kankyo-setuzoku-playbook-sudo:

sudo 設定用ファイル
==================================================
.. literalinclude:: ./yaml/sudo.txt
   :language: none

.. _kankyo-setuzoku-playbook-command:

コマンド
==================================================
.. code-block:: none

   ansible-playbook -i hosts.yml node.yml

.. _kankyo-setuzoku-playbook-log:

実行ログ
==================================================
.. literalinclude:: ./log/kankyo-setuzoku-playbook.log
   :language: none
   :emphasize-lines: 1

.. _kankyo-setuzoku-playbook-kakunin:

鍵認証でログインできるかの確認
==================================================
.. literalinclude:: ./log/kankyo-setuzoku-playbook-kakunin.log
   :language: none
