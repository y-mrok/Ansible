.. _awx-playbook-ninsho:

##################################################
GitLab サーバーに接続するための認証情報
##################################################
#. :guilabel:`認証情報` をクリック

   .. image:: img/2021-07-10_14h23_09.png
      :scale: 60%

#. :guilabel:`追加` をクリック

   .. image:: img/2021-07-10_14h23_47.png
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
        - プルダウンリストから :guilabel:`Source Control` を選択
      * - ユーザ名
        - 管理対象ノードに接続するときのユーザー名
      * - SSH Private Key
        - :guilabel:`Browse...` をクリックして「 :ref:`awx-playbook-key` 」で作成した GitLab サーバーに接続するときの秘密鍵ファイルを選択

   .. image:: img/2021-07-10_14h26_27.png
      :scale: 60%

#. :guilabel:`保存` をクリック

   .. image:: img/2021-07-10_14h26_39.png
      :scale: 60%

#. :guilabel:`認証情報に戻る` をクリック

   .. image:: img/2021-07-10_14h27_11.png
      :scale: 60%

#. 登録した認証情報を確認

   .. image:: img/2021-07-10_14h27_27.png
      :scale: 60%