.. _lint-install:

##################################################
ansible-lint をインストール
##################################################
コントロールノードに ansible-linnt をインストールします。

.. code-block:: none

   pip3 install ansible-lint
   ansible-lint --version

実行ログです。

.. literalinclude:: ./log/lint-1.log
   :language: none
   :emphasize-lines: 1, 37
