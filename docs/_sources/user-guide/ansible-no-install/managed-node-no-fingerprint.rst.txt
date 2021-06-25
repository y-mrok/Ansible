.. _managed-node-no-fingerprint:

##################################################
管理対象ノードのフィンガープリントを無視するか否か
##################################################
ある端末（管理対象ノード）に :command:`ssh` コマンドで初めて接続すると次のメッセージが表示されます。このとき :guilabel:`yes` を回答すると接続元の端末（コントロールノード）の :file:`~/.ssh/known_host` に接続先端末のフィンガープリントが保存されます。

.. code-block:: none

   The authenticity of host '192.168.23.11 (192.168.23.11)' can't be established.
   ECDSA key fingerprint is SHA256:bseUaGSFrQPNkB2peSUrhJCC+qzS3xRsOg6dT4CQqL0.
   Are you sure you want to continue connecting (yes/no/[fingerprint])? 

上記のようなメッセージが表示されて実行が停止しないようコントロールノードから Ansible を使用して管理対象ノードに SSH 接続する前に、 :command:`ssh` コマンドでコントロールノードから管理対象ノードに SSH 接続し、コントロールノードの :file:`~/.ssh/known_host` に管理対象ノードのフィンガープリントを登録する必要があります。管理対象ノードのフィンガープリントが変更になった場合、コントロールノードの :file:`~/.ssh/known_host` に保存済みの当該管理対象ノードのフィンガープリントを更新する必要があります。更新せず SSH 接続すると下記のようなメッセージが表示され、 SSH 接続に失敗します。

.. code-block:: none

   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   @    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
   Someone could be eavesdropping on you right now (man-in-the-middle attack)!
   It is also possible that a host key has just been changed.
   The fingerprint for the ECDSA key sent by the remote host is
   SHA256:Q4jRQXBqyI8ydZXEk9gDP9ovMcDf8LvRvVQnGxZ0KRo.
   Please contact your system administrator.
   Add correct host key in /home/piyo/.ssh/known_hosts to get rid of this message.
   Offending ECDSA key in /home/piyo/.ssh/known_hosts:1
     remove with:
     ssh-keygen -f "/home/piyo/.ssh/known_hosts" -R "192.168.23.11"
   ECDSA host key for 192.168.23.11 has changed and you have requested strict checking.
   Host key verification failed.

これらは SSH 接続時のデフォルトの仕様が :file:`~/.ssh/known_host` をチェックするようになっているからです。

:file:`~/.ssh/known_host` をチェックせず、:file:`~/.ssh/known_host` にフィンガープリントを登録しないようにするには :file:`~/.ssh/config` （パーミッション 0600 ）に次の内容を記述します。

.. code-block:: none

   Host *
     StrictHostKeyChecking no
     UserKnownHostsFile=/dev/null

:file:`~/.ssh/config` の作成コマンドです。

.. code-block:: none

   $ mkdir ~/.ssh
   $ chmod 0700 ~/.ssh
   $ echo "Host *" > ~/.ssh/config
   $ echo "  StrictHostKeyChecking no" >> ~/.ssh/config
   $ echo "  UserKnownHostsFile=/dev/null" >> ~/.ssh/config
   $ chmod 0600 ~/.ssh/config
   $ ls -l ~/.ssh
   $ cat ~/.ssh/config

上記コマンドを実行したログです。

.. code-block:: none

   piyo@vmpc:~$ mkdir ~/.ssh
   piyo@vmpc:~$ chmod 0700 ~/.ssh
   piyo@vmpc:~$ echo "Host *" > ~/.ssh/config
   piyo@vmpc:~$ echo "  StrictHostKeyChecking no" >> ~/.ssh/config
   piyo@vmpc:~$ echo "  UserKnownHostsFile=/dev/null" >> ~/.ssh/config
   piyo@vmpc:~$ chmod 0600 ~/.ssh/config
   piyo@vmpc:~$ ls -l ~/.ssh
   合計 4
   -rw------- 1 piyo piyo 65  2月 13 14:59 config
   piyo@vmpc:~$ cat ~/.ssh/config 
   Host *
     StrictHostKeyChecking no
     UserKnownHostsFile=/dev/null
   piyo@vmpc:~$ 
