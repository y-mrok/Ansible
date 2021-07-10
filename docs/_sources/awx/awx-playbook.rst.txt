.. _awx-playbook:

##################################################
プレイブック
##################################################
AWX でプレイブックを実行する手順です。 AWX と GitLab 間は公開鍵認証を使用します。

#. :ref:`公開鍵と秘密鍵を作成 <awx-playbook-key>`
#. :ref:`GitLab サーバーに公開鍵を登録 <awx-playbook-gitlab-key>`
#. :ref:`GitLab サーバーに接続するための秘密鍵を使用して認証情報を作成 <awx-playbook-ninsho>`
#. :ref:`作成した認証情報を使用して GitLab サーバーに接続し、実行するプレイブックファイルを含むプロジェクトを指定 <awx-playbook-project>`
#. :ref:`管理対象ノードに接続すための認証情報を使用してジョブテンプレートを作成 <awx-playbook-template>`
#. :ref:`ジョブテンプレートを実行（＝　プロジェクト内のプレイブックファイルを実行） <awx-playbook-jikko>`

.. note::

   管理対象ノードに接続するための認証情報の作成方法は「 :ref:`awx-adhoc-ninsho` 」を参照ください。

.. toctree::
   :maxdepth: 2

   ./awx-playbook-key
   ./awx-playbook-gitlab-key
   ./awx-playbook-ninsho
   ./awx-playbook-project
   ./awx-playbook-template
   ./awx-playbook-jikko