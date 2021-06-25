.. _deploy_zabbix:

##################################################
Zabbix サーバーをデプロイ
##################################################
CentOS 8.3 + MySQL 8 + Zabbix 5.2 の組み合わせで Zabbix サーバーをデプロイします。

.. note::

   このプレイを書くにあたり、下記のサイトおよび書籍を参考にしました。ありがとうございました。

   - `電算星組 - Zabbix 5.2 インストール手順(CentOS8 / Apache2.4 / PHP7.2 / MySQL8.0) <https://densan-hoshigumi.com/server/zabbix-5-2-centos8-apache-mysql-install>`_
   - `Qiita - Ansibleでdnfコマンドを使う際の注意 <https://qiita.com/j-yamada/items/0cebc652f37ca80f9e7e>`_
   - `そうなんでげす - MySQL 8のAnsibleハマりポイント（rootのパスワード変更とか） <https://www.soudegesu.com/mysql/mysql8-password/>`_
   - `akamist blog - MySQL5.7の初期パスワードを非対話で変更する <https://akamist.com/blog/archives/1088>`_
   - `DBOnline - ユーザーに権限を設定する(GRANT文) <https://www.dbonline.jp/mysql/user/index6.html>`_
   - `Ansible構築・運用ガイドブック ~インフラ自動化のための現場のノウハウ~ <https://www.amazon.co.jp/Ansible%E6%A7%8B%E7%AF%89%E3%83%BB%E9%81%8B%E7%94%A8%E3%82%AC%E3%82%A4%E3%83%89%E3%83%96%E3%83%83%E3%82%AF-%E3%82%A4%E3%83%B3%E3%83%95%E3%83%A9%E8%87%AA%E5%8B%95%E5%8C%96%E3%81%AE%E3%81%9F%E3%82%81%E3%81%AE%E7%8F%BE%E5%A0%B4%E3%81%AE%E3%83%8E%E3%82%A6%E3%83%8F%E3%82%A6-Compass-Books%E3%82%B7%E3%83%AA%E3%83%BC%E3%82%BA-%E5%85%AB%E6%9C%A8%E6%BE%A4/dp/4839969388>`_

.. _deploy_zabbix-inventory:

**************************************************
インベントリ
**************************************************
.. literalinclude:: ./yaml/hosts.yml
   :language: yaml

.. literalinclude:: ./yaml/host_vars/zabbix.yml
   :language: yaml

.. literalinclude:: ./yaml/group_vars/zabbix_group.yml
   :language: yaml

.. _deploy_zabbix-play:

**************************************************
プレイ
**************************************************
.. literalinclude:: ./yaml/deploy_zabbix.yml
   :language: yaml

.. literalinclude:: ./yaml/roles/initial_processing/tasks/main.yml
   :language: yaml

.. literalinclude:: ./yaml/roles/initial_processing/handlers/main.yml
   :language: yaml

.. literalinclude:: ./yaml/roles/installing_and_configuring_zabbix/tasks/main.yml
   :language: yaml

次のプレイの一部タスクは冪等性が保たれていません。

.. literalinclude:: ./yaml/roles/installing_and_configuring_mysql/tasks/main.yml
   :language: yaml

.. literalinclude:: ./yaml/roles/configure_firewall_and_start_service/tasks/main.yml
   :language: yaml

.. _deploy_zabbix-log:

**************************************************
実行ログ
**************************************************
.. literalinclude:: ./log/deploy_zabbix.log
   :language: none

.. _deploy_zabbix-web-interface:

**************************************************
Web インターフェースのインストール
**************************************************
1. ブラウザーで :command:`http://192.168.23.39/zabbix` を開く

   .. image:: img/2021-04-24_11h26_43.png

#. :guilabel:`Default language` で ``Japanese(ja_JP)`` を選択

   .. image:: img/2021-04-24_11h27_34.png

#. :guilabel:`次のステップ` をクリック

   .. image:: img/2021-04-24_11h28_18.png

#. 「前提条件のチェック」で右端のチェック結果のすべてが "OK" であることを確認

   .. image:: img/2021-04-24_11h28_35.png

#. :guilabel:`次のステップ` をクリック

   .. image:: img/2021-04-24_11h28_55.png

#. 初期値が表示されているので 「データベース名」、「ユーザー」、「パスワード」に :file:`group_vars/zabbix_group.yml` ファイルに定義した値に変更

   .. list-table::
      :header-rows: 1
      :widths: 1, 2, 1

      * - 項目
        - group_vars/zabbix_group.yml
        - 値
      * - データベース名
        - zabbix_db_name
        - zabbix_db
      * - ユーザー
        - zabbix_user
        - zabbixuser
      * - パスワード
        - zabbix_pass
        - MSM-07@Mip

   .. image:: img/2021-04-24_11h29_12.png

   ↓

   .. image:: img/2021-04-24_11h29_44.png

#. :guilabel:`次のステップ` をクリック

   .. image:: img/2021-04-24_11h29_57.png

#. 「 Name 」に "Zabbix01" と入力（入力した文字列がダッシュボード画面の左上の Zabbix のロゴの下に表示される）

   .. image:: img/2021-04-24_11h30_20.png

   ↓

   .. image:: img/2021-04-24_11h31_29.png


#. :guilabel:`次のステップ` をクリック

   .. image:: img/2021-04-24_11h31_40.png

#. :guilabel:`次のステップ` をクリック

   .. image:: img/2021-04-24_11h31_58.png

#. :guilabel:`次のステップ` をクリック

   .. image:: img/2021-04-24_11h32_38.png

#. :guilabel:`終了` をクリック

   .. image:: img/2021-04-24_11h32_51.png

#. Web インターフェースのインストール終了

   .. image:: img/2021-04-24_11h33_05.png

.. _deploy_zabbix-login:

**************************************************
Zabbix にログイン
**************************************************
1. ブラウザーで :command:`http://192.168.23.39/zabbix` を開く

   .. image:: img/2021-04-24_11h26_43.png

#. :guilabel:`ユーザー名` に **Admin** 、 :guilabel:`パスワード` に **zabbix** と入力

   .. image:: img/2021-04-24_11h33_39.png

   ↓

   .. image:: img/2021-04-24_11h34_03.png

#. :guilabel:`サインイン` をクリック

   .. image:: img/2021-04-24_11h34_15.png

#. Zabbix のダッシュボードを表示

   .. image:: img/2021-04-24_11h34_34.png
      :scale: 60%
