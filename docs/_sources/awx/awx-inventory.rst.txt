.. _awx-inventory:

##################################################
インベントリとホスト
##################################################
.. note::

   - 管理対象ノードに接続するときの認証情報（ ansible_user 等）はここで定義しません。
   - 認証情報は「 :ref:`awx-adhoc-ninsho` 」で定義します。

次の管理対象ノードにアクセスするためのインベントリを作成します。

.. list-table::
   :header-rows: 1

   * - 管理対象ノード名
     - IP アドレス
     - グループ
     - ユーザー名
     - 認証方式
   * - hydrogen
     - 192.168.23.11
     - webservers
     - ansible-user
     - 公開鍵認証
   * - helium
     - 192.168.23.12
     - ungrouped
     - ansible-user
     - 公開鍵認証
   * - lithium
     - 192.168.23.13
     - webservers
     - ansible-user
     - 公開鍵認証

※ 公開鍵認証で使用する鍵はすべての管理対象ノードで共通です。

.. toctree::
   :maxdepth: 2

   ./awx-inventory-teigi
   ./awx-inventory-group
   ./awx-inventory-host
   ./awx-inventory-group-host
