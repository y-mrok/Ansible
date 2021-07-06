.. _awx-ninsho-node:

##################################################
管理対象ノードに接続するための認証情報
##################################################
次の管理対象ノードの接続時に使用する認証情報を追加します。

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

#. :guilabel:`認証情報` をクリック

   .. image:: img/2021-07-04_14h48_45.png
      :scale: 60%

#. :guilabel:`追加` をクリック

   .. image:: img/2021-07-04_14h49_41.png
      :scale: 60%

#. 各項目に値を入力

   .. list-table::
      :header-rows: 1
      :widths: 1, 3

      * - 項目名
        - 入力する値
      * - 名前
        - 認証情報名
      * - 認証情報タイプ
        - プルダウンリストから :guilabel:`Macihne` を選択
      * - ユーザ名
        - 管理対象ノードに接続するときのユーザー名
      * - SSH Private Key
        - :guilabel:`Browse...` をクリックして管理対象ノードに接続するときの秘密鍵ファイルを選択

   .. image:: img/2021-07-04_14h55_47.png
      :scale: 60%

#. :guilabel:`保存` をクリック

   .. image:: img/2021-07-04_14h56_24.png
      :scale: 60%

#. :guilabel:`認証情報に戻る` をクリック

   .. image:: img/2021-07-04_14h58_03.png
      :scale: 60%

#. 登録した認証情報を確認　→　追加終了

   .. image:: img/2021-07-04_14h59_03.png
      :scale: 60%