.. _awx-gitlab:

##################################################
GitLab の設定
##################################################
.. note::

   - GitLab サーバーのデプロイ方法は「 :ref:`deploy_gitlab` 」を参照ください。
   - 今回はサーバー名を **gitlab.example.jp** にしています。

AWX から GitLab へは公開鍵認証で接続します。手順です。

#. 鍵を作成
#. GitLab に公開鍵を登録
#. AWX に秘密鍵を登録

ここでは 1. と 2. を説明します。

.. include:: ./awx-gitlab-kagi-sakusei.txt
.. include:: ./awx-gitlab-kagi-toroku.txt
