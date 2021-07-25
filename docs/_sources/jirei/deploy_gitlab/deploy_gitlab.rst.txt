.. _deploy_gitlab:

##################################################
GitLab サーバーをデプロイ
##################################################
- CentOS 8.3 上に GitLab サーバーをデプロイします。
- 別途 DNS サーバーを用意し、名前解決をできるようにしています。

.. note::

   このプレイを書くにあたり、下記のサイトを参考にしました。ありがとうございました。

   - `GitLab - Install self-managed GitLab <https://about.gitlab.com/install/?version=ce#centos-8>`_
   - `てくなべ (tekunabe) - [Ansible] yum モジュールで特定のパッケージがインストール済みであることを確認する <https://tekunabe.hatenablog.jp/entry/2020/04/11/ansible_assert_yum_installed>`_
   - `Qiita - Ansibleでファイル・ディレクトリの存在確認 <https://qiita.com/yasthon/items/0693e9f7b605c660d0a3>`_
   - `How to reset your root password - GitLab 日本語ドキュメント <https://gitlab-docs.creationline.com/ee/security/reset_root_password.html>`_

.. _deploy_gitlab-inventory:

**************************************************
インベントリ
**************************************************
.. literalinclude:: ./yaml/hosts.yml
   :language: yaml

.. literalinclude:: ./yaml/host_vars/gitlab.yml
   :language: yaml

.. literalinclude:: ./yaml/group_vars/gitlab_group.yml
   :language: yaml

.. _deploy_gitlab-play:

**************************************************
プレイ
**************************************************
.. literalinclude:: ./yaml/deploy_gitlab.yml
   :language: yaml

.. literalinclude:: ./yaml/roles/initial_processing/tasks/main.yml
   :language: yaml

.. literalinclude:: ./yaml/roles/initial_processing/handlers/main.yml
   :language: yaml

.. literalinclude:: ./yaml/roles/installing_and_configuring_gitlab/tasks/main.yml
   :language: yaml

.. literalinclude:: ./yaml/roles/configure_firewall_and_start_service/tasks/main.yml
   :language: yaml

.. _deploy_gitlab-log:

**************************************************
実行ログ
**************************************************

.. _deploy_gitlab-log-1:

1 回目の実行
==================================================
.. literalinclude:: ./log/deploy_gitlab.log
   :language: none

.. _deploy_gitlab-log-2:

2 回目の実行
==================================================
``ansible.builtin.shell`` モジュールを使用したタスクの前にチェックを入れているので冪等性が保たれています。

.. literalinclude:: ./log/deploy_gitlab-1.log
   :language: none

.. _deploy_gitlab-web-interface:

**************************************************
GitLab の管理者アカウントのパスワードを設定
**************************************************
1. ブラウザーで :file:`group_vars/gitlab_group.yml` ファイル内の変数 gitlab_url に指定した URL を開く

   .. image:: img/2021-04-24_15h35_44.png

#. 警告が表示されても先に進む

   .. image:: img/2021-04-24_15h36_17.png

#. 「 New password 」と「 Confirm new password 」に GitLab の root アカウントのパスワードを入力

   .. image:: img/2021-04-24_15h37_16.png

   ↓

   .. image:: img/2021-04-24_15h39_01.png

#. :guilabel:`Change your password` をクリック

   .. image:: img/2021-04-24_15h39_50.png

#. root アカウントのパスワードの設定終了

   .. image:: img/2021-04-24_15h40_17.png

.. _deploy_gitlab-password-reset:

*************************************************************
GitLab の管理者アカウントのパスワードを設定（コマンドライン）
*************************************************************
GitLab をデプロイ後にブラウザーでアクセスしたとき、GitLab の管理者アカウント（ root ）パスワード変更画面が表示されないことがあります。そのような場合は、 GitLab サーバーにログインしてコマンドラインで管理者アカウントのパスワードを設定します。この方法は GitLab の管理者アカウントのパスワードを再設定する場合にも使用できます。

.. _deploy_gitlab-password-reset-command:

実行コマンド
==================================================
管理者パスワードを **secret_pass** に設定します。

.. literalinclude:: ./cmd/password-reset-cmd.txt
   :language: none

.. _deploy_gitlab-password-reset-log:

実行ログ
==================================================
GitLab の管理者アカウントのパスワードを **adminpassword** に変更した場合のログです。

.. literalinclude:: ./log/deploy_gitlab-password-reset.log
   :language: none

.. _deploy_gitlab-login:

**************************************************
gitlab にログイン
**************************************************
テストとして root アカウントでログインします。

1. ブラウザーで :file:`group_vars/gitlab_group.yml` ファイル内の変数 gitlab_url に指定した URL を開く

   .. image:: img/2021-04-24_15h35_44.png

#. root アカウントの情報を入力

   .. image:: img/2021-04-24_15h43_14.png

   ↓

   .. image:: img/2021-04-24_15h43_37.png

#. :guilabel:`Sign in` をクリック

   .. image:: img/2021-04-24_15h44_10.png

#. ログイン終了

   .. image:: img/2021-04-24_15h44_36.png

.. note::

   GitLab の使い方は次の URL をご確認ください。

   `Leaning GitLab CE (https://y-mrok.github.io/gitlab/) <https://y-mrok.github.io/gitlab/>`_
