.. _vault-usage:

##################################################
暗号化したファイルを使用
##################################################
:command:`ansible` コマンドや :command:`ansible-playbook` コマンドなどで暗号化したファイルを使用するとき、下記のいずれかの方法で暗号化するときに設定したパスワードを指定します。

- コマンドの実行時にパスワードを入力する
- ファイルにパスワードを記録し、コマンドの実行時にそのファイルを指定する

.. _vault-usage-ask:

**************************************************
コマンドの実行時にパスワードを入力
**************************************************
:command:`ansible` コマンドや :command:`ansible-playbook` コマンドの実行時に ``--ask-vault-password`` パラメーターまたは ``--ask-vault-pass`` パラメーターを指定します。

.. literalinclude:: ./log/ansible-vault-password.log
   :language: none

.. _vault-usage-file:

****************************************************
コマンドの実行時にパスワードを記録したファイルを指定
****************************************************
:command:`ansible` コマンドや :command:`ansible-playbook` コマンドの実行時に ``--vault-password-file`` パラメーターまたは ``--vault-pass-file`` パラメーターでパスワードを記録したファイルを指定します。

.. literalinclude:: ./log/vault-password-file.log
   :language: none
